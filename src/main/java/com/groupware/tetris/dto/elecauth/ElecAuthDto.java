package com.groupware.tetris.dto.elecauth;

import com.groupware.tetris.constant.ElecStatus;
import com.groupware.tetris.entity.elecauth.ElecAuth;
import com.groupware.tetris.entity.elecauth.ElecLine;
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

    private List<ElecLineDto> lines = new ArrayList<>();
    private List<Long> lineIds = new ArrayList<>();

}
