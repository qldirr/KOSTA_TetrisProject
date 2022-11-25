package com.groupware.tetris.dto.project;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;
import org.modelmapper.ModelMapper;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Getter @Setter
public class ProjectFormDto {

    private String name;
    private String type;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDate;
    private String manager;
    private String contents;

    /*//엔티티 객체와 DTO 객체 간 데이터를 복사하여 복사한 객체를 반환
    private static ModelMapper modelMapper = new ModelMapper();

    public Project createProject() {
        return modelMapper.map(this, Project.class);
    }

    public static ProjectFormDto of(Project project) {
        return modelMapper.map(project, ProjectFormDto.class);
    }*/

}
