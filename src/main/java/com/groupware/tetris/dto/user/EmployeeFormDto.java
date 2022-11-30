package com.groupware.tetris.dto.user;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter@Setter
public class EmployeeFormDto {
    private Long id;
    private String name;
    private String email;
    private String password;
    private String phoneNumber;
    private String hireddate;
    private String resigndate;
    private Integer totalVac;
    private Integer useVac;
    private String birth;
    private String position;
    /*private long departmentId;*/
    private String departmentName;
}
