package com.groupware.tetris.repository;

import com.groupware.tetris.entity.user.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    Employee getEmployeeById(Long e_id);
    List<Employee> getEmployeesByIdIn(List<Long> memberIds);

    Employee findByEmail(String email);

}
