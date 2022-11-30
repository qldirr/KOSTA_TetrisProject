package com.groupware.tetris.repository;

import com.groupware.tetris.entity.user.Department;
import com.groupware.tetris.entity.user.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentRepository extends JpaRepository<Department, Long> {
}