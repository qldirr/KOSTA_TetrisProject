package com.groupware.tetris.entity.project;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.groupware.tetris.dto.project.BoardFormDto;
import com.groupware.tetris.dto.project.BoardReplyDto;
import com.groupware.tetris.entity.BaseTimeEntity;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name="boardreply")
@Getter
@Setter
@ToString
public class BoardReply extends BaseTimeEntity {

    @Id
    @Column(name = "pr_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;

    @OneToOne
    @JoinColumn(name = "project_member_id")
    private Employee writer;
    private String contents;

    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    private ProjectBoard projectBoard;

    public static BoardReply createReply(BoardReplyDto boardReplyDto){

        BoardReply boardReply = new BoardReply();

        boardReply.setProjectBoard(boardReplyDto.getBoard());
        boardReply.setWriter(boardReplyDto.getWriter());
        boardReply.setContents(boardReplyDto.getContents());

        return boardReply;

    }


}
