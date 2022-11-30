package com.groupware.tetris.repository;

import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.user.Employee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProjectRepositoryCustom {

    List<Project> getMyProjectPage(Long employeeId);
}
