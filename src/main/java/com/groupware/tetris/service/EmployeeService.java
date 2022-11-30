package com.groupware.tetris.service;

import com.groupware.tetris.entity.user.Department;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.DepartmentRepository;
import com.groupware.tetris.repository.EmployeeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class EmployeeService {

    private final DepartmentRepository departmentRepository;

    private final EmployeeRepository employeeRepository;

    public List<Department> getListDepartment() {
        return departmentRepository.findAll();
    }

    public List<Employee> getListEmployees() {
        return employeeRepository.findAll();
    }

    public Employee saveEmployee(Employee employee){
        validateDuplicateEmployee(employee);
        return employeeRepository.save(employee);
    }
    public void validateDuplicateEmployee(Employee employee)
    {
        Employee findEmployee = employeeRepository.findByEmail(employee.getEmail());
        if(findEmployee != null){
            throw new IllegalStateException("이미 가입된 회원입니다.");
        }

    }

}