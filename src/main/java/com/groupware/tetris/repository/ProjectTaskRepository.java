package com.groupware.tetris.repository;

import com.groupware.tetris.entity.project.ProjectTask;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjectTaskRepository extends JpaRepository<ProjectTask, Long> {

    List<ProjectTask> findProjectTasksByProject_Id(Long projectId);
}
