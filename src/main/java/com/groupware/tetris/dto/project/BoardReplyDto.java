package com.groupware.tetris.dto.project;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.groupware.tetris.entity.project.BoardReply;
import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.project.ProjectBoard;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class BoardReplyDto {

    private Long boardId;
    private ProjectBoard board;
    private Long id;
    private Employee writer;
    private Long writerId;
    private String contents;

    public static BoardReplyDto toDto(BoardReply boardReply){

        BoardReplyDto boardReplyDto = new BoardReplyDto();

        boardReplyDto.setId(boardReply.getId());
        boardReplyDto.setWriter(boardReply.getWriter());
        boardReplyDto.setBoardId(boardReply.getProjectBoard().getId());
        boardReplyDto.setContents(boardReply.getContents());

        return boardReplyDto;

    }

}
