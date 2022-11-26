package com.groupware.tetris.dto.project;

import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter @Setter
public class BoardFormDto {

    private Project project;
    private Long projectId;
    private Employee writer;
    private Long writerId;
    private String contents;

}
