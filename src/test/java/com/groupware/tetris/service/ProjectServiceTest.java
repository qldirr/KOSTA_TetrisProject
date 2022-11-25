package com.groupware.tetris.service;

import com.groupware.tetris.dto.project.ProjectFormDto;
import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.repository.ProjectRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.TestPropertySource;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
@TestPropertySource(locations = "classpath:application-test.properties")
class ProjectServiceTest {

    @Autowired
    ProjectRepository projectRepository;

    @Autowired
    ProjectService projectService;

    @Test
    @DisplayName("프로젝트 등록 테스트")
    @WithMockUser(username = "user")
    void saveProject() throws Exception{
        ProjectFormDto projectFormDto = new ProjectFormDto();

        projectFormDto.setName("테스트 프로젝트");
        projectFormDto.setManager("테스트 매니저");
        projectFormDto.setType("단일");
        projectFormDto.setStartDate(LocalDate.of(2022, 11, 16));
        projectFormDto.setEndDate(LocalDate.of(2022, 12, 16));
        projectFormDto.setContents("테스트 프로젝트입니다.");

        Long projectId = projectService.saveProject(projectFormDto);

        Project project = projectRepository.findProjectById(projectId);

        assertEquals(projectFormDto.getName(), project.getName());
        assertEquals(projectFormDto.getType(), project.getType());
        assertEquals(projectFormDto.getContents(), project.getContents());
        /*assertEquals(projectFormDto.getManager(), project.getManager());*/
        assertEquals(projectFormDto.getStartDate(), project.getStartTime());
        assertEquals(projectFormDto.getEndDate(), project.getEndTime());
    }

}