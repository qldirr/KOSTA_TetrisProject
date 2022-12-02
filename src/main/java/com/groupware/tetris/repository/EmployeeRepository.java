package com.groupware.tetris.repository;

import com.groupware.tetris.entity.user.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    Employee getEmployeeById(Long e_id);
    List<Employee> getEmployeesByIdIn(List<Long> memberIds);

    Employee findByEmail(String email);

    @Query(value = "select * from employee where e_id in " +
            "(select e_id from project where project_id = :projectId) " +
            "or e_id in (select pm.e_id from project p join project_member pm on p.project_id = pm.project_id " +
            "where p.project_id = :projectId)", nativeQuery = true)
    List<Employee> findProjectMembersByProjectId(@Param("projectId") Long projectId);

}