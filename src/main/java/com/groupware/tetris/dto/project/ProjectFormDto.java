package com.groupware.tetris.dto.project;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;
import org.modelmapper.ModelMapper;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter @Setter
public class ProjectFormDto {

    private String name;
    private String type;

    //String으로 넘어온 값을 LocalDate(Date)형으로 변환
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDate;

    private Employee manager;

    private String contents;

    private List<Employee> employees;


    /*//엔티티 객체와 DTO 객체 간 데이터를 복사하여 복사한 객체를 반환
    private static ModelMapper modelMapper = new ModelMapper();

    public Project createProject() {
        return modelMapper.map(this, Project.class);
    }

    public static ProjectFormDto of(Project project) {
        return modelMapper.map(project, ProjectFormDto.class);
    }*/

}
