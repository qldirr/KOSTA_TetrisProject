package com.groupware.tetris.repository;

import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.user.Employee;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

import java.awt.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@TestPropertySource(locations = "classpath:application-test.properties")
class ProjectRepositoryTest {

    @Autowired
    ProjectRepository projectRepository;

    public Employee addManager() {

        Employee employee = new Employee();
        employee.setName("임시 매니저");

        return employee;
    }
    public List<Employee> addProjectMember() {

        List<Employee> employees = new ArrayList<>();

        for (int i = 0; i < 3; i++) {
            Employee employee = new Employee();
            employee.setName("테스트 멤버" + i);
            employees.add(employee);
        }

        return employees;
    }

    @Test
    @DisplayName("프로젝트 저장 테스트")
    public void createProjectTest() {

        Employee employee = this.addManager();
        List<Employee> employees = this.addProjectMember();
        Project project = new Project();

        project.setName("테스트 프로젝트");
        project.setManager(employee);
        project.setEmployees(employees);
        project.setContents("테스트 프로젝트 입니다.");
        project.setStartTime(LocalDate.now());
        project.setEndTime(LocalDate.now());

        Project savedProject = projectRepository.save(project);
        System.out.println(savedProject.toString());

    }

}