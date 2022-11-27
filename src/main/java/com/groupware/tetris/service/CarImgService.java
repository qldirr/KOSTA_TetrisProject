package com.groupware.tetris.service;

import com.groupware.tetris.entity.reservation.CarImg;
import com.groupware.tetris.repository.CarImgRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;


@Service
@RequiredArgsConstructor
@Transactional
public class CarImgService {

    @Value("${carImgLocation}")
    private String carImgLocation;

    private final CarImgRepository carImgRepository;

    private final FileService fileService;

    public void savedItemImg(CarImg carImg, MultipartFile itemImgFile)throws Exception{
        String origImgName = itemImgFile.getOriginalFilename();
        String imgName="";
        String imgUrl="";

        //파일 업로드
        if (!StringUtils.isEmpty(origImgName)){
            imgName = fileService.uploadFile(carImgLocation, origImgName,itemImgFile.getBytes());
            imgUrl ="/images/file/"+ imgName;
        }

        //상품 이미지 정보저장
        carImg.updateCarImg(origImgName, imgName, imgUrl);
        carImgRepository.save(carImg);
    }




}
