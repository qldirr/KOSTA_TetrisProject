package com.groupware.tetris.entity.project;

import com.groupware.tetris.dto.project.BoardAttachDto;
import com.groupware.tetris.dto.project.BoardReplyDto;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name="boardattach")
@Getter
@Setter
@ToString
public class BoardAttach {

    @Id
    @Column(name = "board_attach_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String attachName;

    private String oriAttachName;

    private String attachPath;

    private String type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pb_id")
    private ProjectBoard projectBoard;

    public static BoardAttach createAttach(BoardAttachDto boardAttachDto){

        BoardAttach boardAttach = new BoardAttach();
        boardAttach.setAttachName(boardAttachDto.getAttachName());
        boardAttach.setAttachPath(boardAttachDto.getAttachPath());
        boardAttach.setOriAttachName(boardAttachDto.getOriAttachName());
        boardAttach.setType(boardAttachDto.getType());

        return boardAttach;

    }



}
