package com.groupware.tetris.repository;

import com.groupware.tetris.entity.project.ProjectBoard;
import com.groupware.tetris.entity.user.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjectBoardRepository extends JpaRepository<ProjectBoard, Long> {

    List<ProjectBoard> findProjectBoardsByProject_IdOrderByIdDesc(Long projectId);

}
