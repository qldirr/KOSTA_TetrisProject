package com.groupware.tetris.controller;


import com.groupware.tetris.dto.project.ProjectFormDto;
import com.groupware.tetris.service.EmployeeService;
import com.groupware.tetris.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
public class ProjectController {

    private final ProjectService projectService;

    private final EmployeeService employeeService;

    @GetMapping(value = "/project/main")
    public String listProject(){
        return "/project/main";
    }

    @GetMapping(value = "/project/register")
    public String registerProjectForm(){
        return "/project/register";
    }

    @PostMapping(value = "/project/register")
    public String registerProject(@Valid ProjectFormDto projectFormDto, BindingResult bindingResult, Model model) throws Exception {

        if (bindingResult.hasErrors()) {
            return "/project/register";
        }

        try {
           projectService.saveProject(projectFormDto);
        } catch (Exception e) {
            e.printStackTrace();
            return  "/project/register";
        }

        return "/project/main";

    }

    @GetMapping(value = "/project/member")
    public void getListEmployees(Model model) {

        model.addAttribute("dept", employeeService.getListDepartment());
        model.addAttribute("employees", employeeService.getListEmployees());
    }

}
