package com.groupware.tetris.entity.project;

import com.groupware.tetris.dto.project.MemberFormDto;
import com.groupware.tetris.dto.project.ProjectFormDto;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.EmployeeRepository;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Entity
@Table(name="project")
@Getter @Setter
@ToString
public class Project {

    @Id
    @Column(name = "project_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String type;
    private LocalDate startTime;
    private LocalDate endTime;
    private String contents;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "e_id")
    private Employee manager;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "project_member",
            joinColumns = @JoinColumn(name = "e_id"),
            inverseJoinColumns = @JoinColumn(name = "project_id")
    )
    private List<Employee> employees;

    @OneToMany(mappedBy = "project", cascade = CascadeType.ALL)
    private List<ProjectBoard> projectBoards;


    //프로젝트 생성 메서드
    public static Project createProject(ProjectFormDto projectFormDto) {

        Project project = new Project();

        project.setName(projectFormDto.getName());
        project.setType(projectFormDto.getType());
        project.setContents(projectFormDto.getContents());
        project.setStartTime(projectFormDto.getStartDate());
        project.setEndTime(projectFormDto.getEndDate());
        project.setManager(projectFormDto.getManager());
        project.setEmployees(projectFormDto.getEmployees());

        return project;

    }

}


