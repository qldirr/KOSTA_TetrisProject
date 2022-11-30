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
    private String id;

}
