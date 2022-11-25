package com.groupware.tetris.entity.project;

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
public class ProjectBoard {

    @Id
    @Column(name = "pb_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String title;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "project_member_id")
    private Employee writer;
    private String contents;

    @ManyToOne
    @JoinColumn(name = "project_id")
    private Project project;

}
