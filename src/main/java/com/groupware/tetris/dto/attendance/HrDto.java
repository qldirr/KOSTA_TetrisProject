package com.groupware.tetris.dto.attendance;

import com.groupware.tetris.constant.Hr_status;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter @Setter
public class HrDto {

    private Long hr_num;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime hr_leave;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime hr_date;

    private String hr_status;
    private String hr_note;
    private Long e_id;

    private String e_name;
    private String d_name;
    private String e_position;
    private LocalDateTime e_hiredate;
    private String e_num;
    private String hr_Time;

}
