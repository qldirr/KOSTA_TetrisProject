package com.groupware.tetris.service;

import com.groupware.tetris.dto.project.ProjectFormDto;
import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.repository.ProjectRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class ProjectService {

    private final ProjectRepository projectRepository;

    public Long saveProject(ProjectFormDto projectFormDto) throws Exception {

        Project project = Project.createProject(projectFormDto);
        projectRepository.save(project);

        return project.getId();

    }

}
