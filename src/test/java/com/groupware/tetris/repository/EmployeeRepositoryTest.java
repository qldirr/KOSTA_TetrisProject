package com.groupware.tetris.repository;

import com.groupware.tetris.entity.user.Department;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.entity.user.QDepartment;
import com.groupware.tetris.entity.user.QEmployee;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@TestPropertySource(locations = "classpath:application-test.properties")
class EmployeeRepositoryTest {

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    DepartmentRepository departmentRepository;

    @PersistenceContext
    EntityManager em;

    public Department addDeptAndEmployees() {

        List<Employee> employees = new ArrayList<>();

        for (int i = 0; i < 3; i++) {
            Employee employee = new Employee();
            employee.setName("테스트 멤버" + i);
            employees.add(employee);
        }

        Department department = new Department();
        department.setName("개발부");
        department.setHead("김길동");
        department.setEmployees(employees);

        return department;
    }


    @Test
    @DisplayName("Querydsl 사원 정보 조회 테스트")
    public void queryDslEmployeeInfoTest() {

        /*Department department = this.addDeptAndEmployees();
        departmentRepository.save(department);
        System.out.println(department.toString());*/

        JPAQueryFactory queryFactory = new JPAQueryFactory(em);
        QEmployee qEmployee = QEmployee.employee;
        QDepartment qDepartment = QDepartment.department;

        JPAQuery<Employee> query = queryFactory.selectFrom(qEmployee)
                .join(qDepartment).on(qEmployee.department.id.eq(qDepartment.id))
                .where(qDepartment.name.eq("개발부")).orderBy(qEmployee.id.desc());

        List<Employee> employees = query.fetch();

        for (Employee employee : employees) {
            System.out.println(employee.toString());
        }

    }


}