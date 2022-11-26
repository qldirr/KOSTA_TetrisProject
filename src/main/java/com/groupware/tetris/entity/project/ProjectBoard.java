package com.groupware.tetris.entity.project;

import com.groupware.tetris.dto.project.BoardFormDto;
import com.groupware.tetris.entity.BaseTimeEntity;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;

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

    @ManyToOne
    @JoinColumn(name = "project_id")
    private Project project;

    public static ProjectBoard createBoard(BoardFormDto boardFormDto){

        ProjectBoard projectBoard = new ProjectBoard();
        projectBoard.setWriter(boardFormDto.getWriter());
        projectBoard.setContents(boardFormDto.getContents());
        projectBoard.setProject(boardFormDto.getProject());

        return projectBoard;

    }

}
