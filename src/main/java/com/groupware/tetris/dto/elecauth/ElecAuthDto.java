package com.groupware.tetris.dto.elecauth;

import com.groupware.tetris.constant.ElecStatus;
import com.groupware.tetris.dto.project.BoardAttachDto;
import com.groupware.tetris.dto.project.BoardFormDto;
import com.groupware.tetris.entity.elecauth.ElecAuth;
import com.groupware.tetris.entity.elecauth.ElecLine;
import com.groupware.tetris.entity.project.ProjectBoard;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class ElecAuthDto {

    private Long id;
    private String title;
    private String writer;
    private Long writerId;
    private String writer_position;
    private String writer_dept_name;
    private String contents;
    private ElecStatus status;
    private Long doc_id;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDate;

    private LocalDate regDate;

    private List<ElecLineDto> lines = new ArrayList<>();
    private List<Long> lineIds = new ArrayList<>();

    public static ElecAuthDto toDto(ElecAuth auth, List<ElecLineDto> elecLineDtos){

        ElecAuthDto elecAuthDto = new ElecAuthDto();

        elecAuthDto.setId(auth.getId());
        elecAuthDto.setTitle(auth.getTitle());
        elecAuthDto.setContents(auth.getContents());
        elecAuthDto.setStatus(auth.getStatus());
        elecAuthDto.setWriter(auth.getWriter().getName());
        elecAuthDto.setWriter_dept_name(auth.getWriter().getDepartment().getName());
        elecAuthDto.setWriter_position(auth.getWriter().getPosition());
        elecAuthDto.setStartDate(auth.getStartDate());
        elecAuthDto.setEndDate(auth.getEndDate());
        elecAuthDto.setRegDate(auth.getRegTime().toLocalDate());

        elecAuthDto.setDoc_id(auth.getDocument().getId());
        elecAuthDto.setLines(elecLineDtos);

        return elecAuthDto;

    }

}
