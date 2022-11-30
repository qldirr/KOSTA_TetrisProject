package com.groupware.tetris.dto.attendance;

import com.groupware.tetris.constant.Hr_status;
import com.groupware.tetris.entity.attendance.Hr;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter @Setter
public class HrFormDto {

    private Hr hr;
    private long hr_num;
    private long e_id;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH-mm-ss")
    private LocalDateTime hr_date;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH-mm-ss")
    private LocalDateTime hr_leave;
    private Hr_status hr_status;
    private String hr_note;
    private String e_name;
    private String d_name;
    private String e_position;
    private LocalDateTime e_hiredate;
    private String e_num;
    private String hr_time;

    //public static HrFormDto toDto();
}
