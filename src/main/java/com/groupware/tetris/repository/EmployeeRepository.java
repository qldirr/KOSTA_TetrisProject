package com.groupware.tetris.repository;

import com.groupware.tetris.entity.user.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee,Long> {

    Employee findByEmail(String email);

}
