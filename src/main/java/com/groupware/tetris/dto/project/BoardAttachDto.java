package com.groupware.tetris.dto.project;

import com.groupware.tetris.entity.project.BoardAttach;
import com.groupware.tetris.entity.project.ProjectBoard;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class BoardAttachDto {

    private Long id;
    private String attachName;
    private String oriAttachName;
    private String attachPath;
    private String type;

    public static BoardAttachDto toDto(BoardAttach boardAttach){

        BoardAttachDto boardAttachDto = new BoardAttachDto();
        boardAttachDto.setId(boardAttach.getId());
        boardAttachDto.setType(boardAttach.getType());
        boardAttachDto.setAttachName(boardAttach.getAttachName());
        boardAttachDto.setAttachPath(boardAttach.getAttachPath());
        boardAttachDto.setOriAttachName(boardAttach.getOriAttachName());
;
        return boardAttachDto;

    }

}
