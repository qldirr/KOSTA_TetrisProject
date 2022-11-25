package com.groupware.tetris.repository;

import com.groupware.tetris.entity.project.Project;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjectRepository extends JpaRepository<Project, Long> {

    Project findProjectById(Long projectId);

}
