package com.groupware.tetris.controller;

import com.groupware.tetris.dto.elecauth.ElecAuthDto;
import com.groupware.tetris.service.ElecAuthService;
import com.groupware.tetris.service.EmployeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class ElecAuthController {

    private final ElecAuthService authService;

    private final EmployeeService employeeService;

    @GetMapping(value = "/elecauth/main")
    public String getElecAuthMain(){
        return "/elecauth/main";
    }

    @GetMapping(value = "/elecauth/register")
    public String getElecAuthRegistForm(){
        return "/elecauth/register";
    }

    @PostMapping(value = "/elecauth/register")
    @ResponseBody
    public Long registElecAuth(@RequestBody ElecAuthDto elecAuthDto) {
        Long authId =authService.saveElecAuth(elecAuthDto);

        return authId;
    }

    @GetMapping(value = "/elecauth/line")
    public void getListEmployees(Model model) {
        model.addAttribute("dept", employeeService.getListDepartment());
        model.addAttribute("employees", employeeService.getListEmployees());
    }

    @GetMapping(value = "/elecauth/{authId}")
    public String getRecentDoc(@PathVariable Long authId, Model model){
        ElecAuthDto authDto = authService.readElecAuth(authId);
        model.addAttribute("auth", authDto);

        int docType = authDto.getDoc_id().intValue();
        String draft = "/elecauth/draftResult";
        String vacation = "/elecauth/vacationResult";

        switch (docType) {
            case 1:
                return draft;
            case 2:
                return vacation;
        }
        return null;
    }

}
