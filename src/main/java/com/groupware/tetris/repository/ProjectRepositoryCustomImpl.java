package com.groupware.tetris.repository;

import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.project.QProject;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.entity.user.QDepartment;
import com.groupware.tetris.entity.user.QEmployee;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import java.util.List;

public class ProjectRepositoryCustomImpl implements ProjectRepositoryCustom{

    private JPAQueryFactory queryFactory;

    public ProjectRepositoryCustomImpl(EntityManager em) {
        this.queryFactory = new JPAQueryFactory(em);
    }

    @Override
    public List<Project> getMyProjectPage(Long employeeId) {

        QProject qProject = QProject.project;
        QEmployee qEmployee = QEmployee.employee;

        JPAQuery<Project> query = queryFactory.selectFrom(qProject)
                .where(qProject.manager.id.eq(employeeId).or(qProject.employees.any().id.eq(employeeId)));

        List<Project> projects = query.fetch();

        return projects;
    }
}
