package com.groupware.tetris.controller;

import com.groupware.tetris.dto.user.EmployeeFormDto;
import com.groupware.tetris.entity.user.Department;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.DepartmentRepository;
import com.groupware.tetris.service.EmployeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@RequestMapping("/admin")
@RequiredArgsConstructor
@Controller
public class AdminController {
    private final PasswordEncoder passwordEncoder;
    private final EmployeeService employeeService;

    private final DepartmentRepository departmentRepository;
    @GetMapping(value = "/new")
    public String register(Model model){
        model.addAttribute("employeeFormDto", new EmployeeFormDto());
        return "/hr/register";
    }
    @PostMapping(value = "/new")
    public String register(@Valid EmployeeFormDto employeeFormDto, BindingResult bindingResult,Model model){
        if(bindingResult.hasErrors()){
            return "/hr/register";
        }
    try {
        Employee employee = Employee.createEmployee(employeeFormDto, passwordEncoder);
        Department department = departmentRepository.findByName(employeeFormDto.getDepartmentName());
        employeeService.saveEmployee(employee, employeeFormDto, department);
    }catch (IllegalStateException e){
        model.addAttribute("errorMessage", e.getMessage());
        System.out.println(e.getMessage());
            return "/hr/register";

    }
    return "redirect:/";
    }
}
