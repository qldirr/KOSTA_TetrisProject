package com.groupware.tetris.service;

import com.groupware.tetris.dto.project.MemberFormDto;
import com.groupware.tetris.dto.project.ProjectFormDto;
import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.EmployeeRepository;
import com.groupware.tetris.repository.ProjectRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
@RequiredArgsConstructor
public class ProjectService {

    private final ProjectRepository projectRepository;

    private final EmployeeRepository employeeRepository;

    public Long saveProject(ProjectFormDto projectFormDto, MemberFormDto memberFormDto) throws Exception {

        Long managerId = memberFormDto.getManagerId();
        Employee manager = employeeRepository.getEmployeeById(managerId);

        List<Long> memberIds_ = memberFormDto.getMemberIds();
        List<Long> memberIds = new ArrayList<>();

        for (int i = 0; i < memberIds_.size()-1; i++) {
            memberIds.add(memberIds_.get(i));
        }

        List<Employee> members = memberIds.stream().map(id -> employeeRepository.getEmployeeById(id))
                .collect(Collectors.toList());

        projectFormDto.setManager(manager);
        projectFormDto.setEmployees(members);

        Project project = Project.createProject(projectFormDto);
        projectRepository.save(project);

        return project.getId();

    }

    @Transactional(readOnly = true)
    public List<ProjectFormDto> getListMyProjects(Long employeeId) {

        List<Project> projects
                = projectRepository.getMyProjectPage(employeeId);

        List<ProjectFormDto> projectFormDtos
                = projects.stream().map(project -> ProjectFormDto.toDto(project)).collect(Collectors.toList());

        return projectFormDtos;
    }

    @Transactional(readOnly = true)
    public ProjectFormDto getProject(Long projectId){

        ProjectFormDto projectFormDto = ProjectFormDto.toDto(projectRepository.findProjectById(projectId));

        return projectFormDto;
    }

}
