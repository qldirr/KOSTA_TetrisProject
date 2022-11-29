package com.groupware.tetris.repository;

import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.user.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProjectRepository extends JpaRepository<Project, Long>, ProjectRepositoryCustom {

    Project findProjectById(Long projectId);

    /*@Query("select p.e_id, m.e_id from project p "
    + "join project_member m " + "on p.project_id = m.project_id "
    + "where p.project_id = :projectId")
    List<Employee> getEmployeesByProjectId(Long projectId);*/

}
