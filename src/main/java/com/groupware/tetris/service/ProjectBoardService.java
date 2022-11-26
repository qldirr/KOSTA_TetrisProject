package com.groupware.tetris.service;

import com.groupware.tetris.dto.project.BoardFormDto;
import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.project.ProjectBoard;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.EmployeeRepository;
import com.groupware.tetris.repository.ProjectBoardRepository;
import com.groupware.tetris.repository.ProjectRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class ProjectBoardService {

    private final ProjectBoardRepository boardRepository;

    private final ProjectRepository projectRepository;

    private final EmployeeRepository employeeRepository;

    public Long saveProjectBoard(BoardFormDto boardFormDto){

        Long writerId = boardFormDto.getWriterId();
        Employee writer = employeeRepository.getEmployeeById(writerId);
        Long projectId = boardFormDto.getProjectId();
        Project project = projectRepository.findProjectById(projectId);

        boardFormDto.setWriter(writer);
        boardFormDto.setProject(project);

        ProjectBoard projectBoard = ProjectBoard.createBoard(boardFormDto);
        boardRepository.save(projectBoard);

        return projectBoard.getId();
    }


    public List<ProjectBoard> getListProjectBoard(Long projectId){
        return boardRepository.findProjectBoardsByProject_IdOrderByIdDesc(projectId);
    }

}
