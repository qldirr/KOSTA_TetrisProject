package com.groupware.tetris.service;

import com.groupware.tetris.dto.user.EmployeeFormDto;
import com.groupware.tetris.entity.user.Department;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.DepartmentRepository;
import com.groupware.tetris.repository.EmployeeRepository;
import lombok.RequiredArgsConstructor;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class EmployeeService {
    private final EmployeeRepository employeeRepository;
    private final DepartmentRepository departmentRepository;


        public Employee saveEmployee(Employee employee, EmployeeFormDto employeeFormDto, Department department ){
        validateDuplicateEmployee(employee,employeeFormDto,department);
        Department findDepartment = departmentRepository.findByName(employeeFormDto.getDepartmentName());
        employee.setDepartment(findDepartment);

        return employeeRepository.save(employee);
    }
    public void validateDuplicateEmployee(Employee employee, EmployeeFormDto employeeFormDto ,Department department)
    {
        Employee findEmployee = employeeRepository.findByEmail(employee.getEmail());
        Department findDepartment = departmentRepository.findByName(employeeFormDto.getDepartmentName());

        if(findEmployee != null){
            throw new IllegalStateException("이미 가입된 회원입니다.");
        }
        else if(findDepartment == null){
            throw new IllegalStateException("존재하지 않는 부서입니다.");
        }


    }


}
