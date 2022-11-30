package com.groupware.tetris.dto.project;

import com.groupware.tetris.constant.TaskImportance;
import com.groupware.tetris.constant.TaskStatus;
import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.project.ProjectTask;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;
import org.modelmapper.ModelMapper;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Getter
@Setter
public class TaskFormDto {

    private Long id;
    private String name;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDate;

    private Long managerId;
    private Employee manager;
    private String contents;
    private TaskStatus status;
    private TaskImportance importance;

    private static ModelMapper modelMapper = new ModelMapper();

    public static TaskFormDto toDto(ProjectTask projectTask) {
        return modelMapper.map(projectTask, TaskFormDto.class);
    }


}
