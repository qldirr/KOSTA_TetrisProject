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

    @Autowired
    OrgRepository orgRepository;

    @PersistenceContext
    EntityManager em;

    public Department addDeptAndEmployees() {

        /*List<Employee> employees = new ArrayList<>();

        Employee employee = new Employee();
        employee.setId(1L);
        employee.setName("김길동");
        employee.setEmail("gdong123@gmail.com");
        employee.setBirth("1975-10-08");
        employee.setPhoneNumber("010-6964-8447");
        employee.setPosition("사장");
        employee.getDepartment().setId(1L);


        Department department = new Department();
        department.setId(1L);
        department.setName("개발부");
        department.setHead("김길동");
        department.setEmployees(employees);

        return department;*/

        List<Employee> employees = new ArrayList<>();

        for (int i = 0; i < 3; i++) {
            Employee employee = new Employee();
            employee.setName("테스트 멤버" + i);
            employee.setPosition("부장");
            employees.add(employee);
        }

        Department department = new Department();
        department.setName("개발부");
        department.setHead("김길동");
        department.setEmployees(employees);

        for (int i = 3; i < 6; i++) {
            Employee employee = new Employee();
            employee.setName("테스트 멤버" + i);
            employee.setPosition("사원");
            employees.add(employee);
        }

        Department department2 = new Department();
        department2.setName("기획부");
        department2.setHead("김희동");
        department2.setEmployees(employees);

        return department;
    }


    @Test
    @DisplayName("Querydsl 사원 정보 조회 테스트")
    public void queryDslEmployeeInfoTest() {

        Department department = this.addDeptAndEmployees();
        departmentRepository.save(department);
        System.out.println(department.toString());

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

    @Test
    @DisplayName("Querydsl 사원 정보 조회 테스트")
    public void findbydid(){
        Department department = this.addDeptAndEmployees();
        departmentRepository.save(department);

        List<Employee> employees = orgRepository.findBydid();
        for (Employee employee:employees){
            System.out.println(employee.toString());
        }
    }

    @Test
    @DisplayName("Querydsl 사원 검색 테스트")
    public void searchemployeetest(){
        Department department = this.addDeptAndEmployees();
        departmentRepository.save(department);
        System.out.println(department.toString());

        JPAQueryFactory queryFactory = new JPAQueryFactory(em);
        QEmployee qEmployee = QEmployee.employee;
        QDepartment qDepartment = QDepartment.department;

        JPAQuery<Employee> query = queryFactory.selectFrom(qEmployee)
                .join(qDepartment).on(qEmployee.department.id.eq(qDepartment.id))
                .where(qEmployee.position.like("%"+"부"+"%")).orderBy(qEmployee.id.desc());

        List<Employee> employees = query.fetch();

        for (Employee employee : employees) {
            System.out.println(employee.toString());
        }
    }

    @Test
    @DisplayName("Querydsl 사원 검색 테스트")
    public void searchbyposition(){
        Department department = this.addDeptAndEmployees();
        departmentRepository.save(department);

        List<Employee> employees = orgRepository.searchByPosition("부");
        for (Employee employee:employees){
            System.out.println(employee.toString());
        }
    }
}