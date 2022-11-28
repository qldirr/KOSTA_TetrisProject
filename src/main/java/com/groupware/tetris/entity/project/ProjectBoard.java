package com.groupware.tetris.entity.project;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.groupware.tetris.dto.project.BoardFormDto;
import com.groupware.tetris.entity.BaseTimeEntity;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="projectboard")
@Getter
@Setter
@ToString
public class ProjectBoard extends BaseTimeEntity {

    @Id
    @Column(name = "pb_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "project_member_id")
    private Employee writer;
    private String contents;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "project_id")
    private Project project;

    @JsonManagedReference
    @OneToMany(mappedBy = "projectBoard", cascade = CascadeType.ALL)
    private List<BoardReply> replies = new ArrayList<>();

    @OneToMany(mappedBy = "projectBoard", cascade = CascadeType.ALL)
    private List<BoardAttach> attaches = new ArrayList<>();

    public static ProjectBoard createBoard(BoardFormDto boardFormDto){

        ProjectBoard projectBoard = new ProjectBoard();
        projectBoard.setWriter(boardFormDto.getWriter());
        projectBoard.setContents(boardFormDto.getContents());
        projectBoard.setProject(boardFormDto.getProject());

        return projectBoard;

    }

}
