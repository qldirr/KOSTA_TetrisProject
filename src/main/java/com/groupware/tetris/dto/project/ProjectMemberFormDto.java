package com.groupware.tetris.dto.project;

import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ProjectMemberFormDto {

    private List<Employee> employees;

}
