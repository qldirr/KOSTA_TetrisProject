package com.groupware.tetris.dto.attendance;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

@Getter @Setter
public class VacDto {

    private long v_num;
    private DateTimeFormat v_startdate;
    private DateTimeFormat v_enddate;
    private long dm_num;
    private long e_num;
    private String e_name;
    private long el_num;
}
