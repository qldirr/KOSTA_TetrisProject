package com.groupware.tetris.controller;

import com.groupware.tetris.dto.user.EmployeeFormDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {

    @GetMapping(value = "/new")
    public String register(Model model){
        model.addAttribute("employeeFormDto", new EmployeeFormDto());
        return "/hr/register";
    }
}
