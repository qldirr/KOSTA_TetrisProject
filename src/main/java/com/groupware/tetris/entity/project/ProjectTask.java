package com.groupware.tetris.entity.project;

import com.groupware.tetris.constant.TaskImportance;
import com.groupware.tetris.constant.TaskStatus;
import com.groupware.tetris.dto.project.TaskFormDto;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name="projecttask")
@Getter
@Setter
@ToString
public class ProjectTask {

    @Id
    @Column(name = "ts_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "project_member_id")
    private Employee manager;
    private String contents;

    private LocalDate startTime;
    private LocalDate endTime;

    @Enumerated(EnumType.STRING)
    private TaskStatus status;

    @Enumerated(EnumType.STRING)
    private TaskImportance importance;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "project_id")
    private Project project;

    public static ProjectTask createTask(Project project, TaskFormDto taskFormDto) {

        ProjectTask projectTask = new ProjectTask();

        projectTask.setName(taskFormDto.getName());
        projectTask.setContents(taskFormDto.getContents());
        projectTask.setManager(taskFormDto.getManager());
        projectTask.setStatus(taskFormDto.getStatus());
        projectTask.setImportance(taskFormDto.getImportance());
        projectTask.setStartTime(taskFormDto.getStartDate());
        projectTask.setEndTime(taskFormDto.getEndDate());
        projectTask.setProject(project);

        return projectTask;
    }

    public void updateTask(TaskStatus status) {
        this.status = status;
    }


}
