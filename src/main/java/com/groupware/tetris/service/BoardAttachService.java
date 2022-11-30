package com.groupware.tetris.service;

import com.groupware.tetris.dto.project.BoardAttachDto;
import com.groupware.tetris.entity.project.BoardAttach;
import com.groupware.tetris.repository.BoardAttachRepository;
import lombok.RequiredArgsConstructor;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.*;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardAttachService {

    @Value("${attachFileLocation}")
    private String attachFileLocation;

    private final BoardAttachRepository boardAttachRepository;

    private final FileService fileService;


    private boolean checkImageType(File file) {

        try {
            String contentType = Files.probeContentType(file.toPath());
            return contentType.startsWith("image");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<BoardAttachDto> uploadBoardAttach(List<MultipartFile> uploadFile) {

        List<BoardAttachDto> boardAttachDtos = new ArrayList<>();

        File uploadPath = new File(attachFileLocation);

        for (MultipartFile multipartFile : uploadFile) {

            BoardAttachDto boardAttachDto = new BoardAttachDto();

            String uploadFileName = multipartFile.getOriginalFilename();
            boardAttachDto.setOriAttachName(uploadFileName);
            String extension = uploadFileName.substring(uploadFileName.lastIndexOf("."));


            UUID uuid = UUID.randomUUID();
            String uploadFileNameWithUUID = uuid.toString() + extension;

            boardAttachDto.setAttachPath(attachFileLocation);
            boardAttachDto.setAttachName(uploadFileNameWithUUID);

            try {

                File saveFile = new File(uploadPath, uploadFileNameWithUUID);
                multipartFile.transferTo(saveFile);

                //이미지 파일 여부를 확인하고 이미지 파일인 경우 썸네일 파일 생성
                if(checkImageType(saveFile)) {

                    boardAttachDto.setType("image");

                    File thumbFile = new File(uploadPath, "s_" + uploadFileNameWithUUID);

                    Thumbnails.of(saveFile)
                            .forceSize(200,200).toFile(thumbFile);

                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            boardAttachDtos.add(boardAttachDto);
        }

        return boardAttachDtos;

    }

    public List<Object> getThumbnailImg(String fileName){

        List<Object> thumbnailInfo = new ArrayList<>();

        File file = new File(attachFileLocation + "/" +fileName);

        byte[] result = null;

        try {
            HttpHeaders header = new HttpHeaders();
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = FileCopyUtils.copyToByteArray(file);

            thumbnailInfo.add(result);
            thumbnailInfo.add(header);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return thumbnailInfo;

    }

    public void saveBoardAttach(BoardAttachDto boardAttachDto, MultipartFile boardAttachFile) throws Exception{

        BoardAttach boardAttach = BoardAttach.createAttach(boardAttachDto);
        String oriAttachName = boardAttachFile.getOriginalFilename();
        String attachName = "";

        if (oriAttachName != null) {
            attachName = fileService.uploadFile(attachFileLocation, oriAttachName, boardAttachFile.getBytes());
        }

        boardAttachRepository.save(boardAttach);
    }
}
