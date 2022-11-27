package com.groupware.tetris.dto.project;

import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.project.ProjectBoard;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter @Setter
public class BoardFormDto {

    private Project project;
    private Long projectId;
    private Long id;
    private Employee writer;
    private Long writerId;
    private String contents;

    public static BoardFormDto toDto(ProjectBoard projectBoard){

        BoardFormDto boardFormDto = new BoardFormDto();

        boardFormDto.setId(projectBoard.getId());
        boardFormDto.setWriter(projectBoard.getWriter());
        boardFormDto.setContents(projectBoard.getContents());
        boardFormDto.setProject(projectBoard.getProject());

        return boardFormDto;

    }

}
