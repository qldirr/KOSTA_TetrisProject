package com.groupware.tetris.controller;

import com.groupware.tetris.constant.ElecStatus;
import com.groupware.tetris.dto.elecauth.ElecAuthDto;
import com.groupware.tetris.dto.elecauth.ElecLineDto;
import com.groupware.tetris.service.ElecAuthService;
import com.groupware.tetris.service.EmployeeService;
import lombok.Getter;
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

    @GetMapping(value = "/elecauth/uncheckedList")
    public String getUncheckedAuths(Model model) {

        Long employeeId = 2L;
        model.addAttribute("authlist", authService.getListUncheckedElecAuths(employeeId));

        return "/elecauth/uncheckedList";
    }


    @GetMapping(value = "/elecauth/writtenList")
    public String getWrittenAuths(Model model) {

        Long employeeId = 2L;
        ElecStatus status = ElecStatus.DONE;
        model.addAttribute("authlist", authService.getListElecAuths(employeeId, status));

        return "/elecauth/writtenList";
    }


    @GetMapping(value = "/elecauth/disapprovedList")
    public String getDisapprovedAuths(Model model) {

        Long employeeId = 2L;
        ElecStatus status = ElecStatus.DISAPPROVED;
        model.addAttribute("authlist", authService.getListElecAuths(employeeId, status));

        return "/elecauth/disapprovedList";
    }


    @PostMapping(value = "/elecauth/check/{authId}")
    public  @ResponseBody int modifyElecLineStatus(@PathVariable Long authId, @RequestBody ElecLineDto elecLineDto) {
        return authService.updateElecLineStatus(authId, elecLineDto);
    }


    @GetMapping(value = "/elecauth/modify/{authId}")
    public String getElecAuthUpdateForm(@PathVariable Long authId, Model model) {
        ElecAuthDto authDto = authService.readElecAuth(authId);
        model.addAttribute("auth", authDto);
        return "/elecauth/draftUpdateForm";
    }


    @PostMapping(value = "/elecauth/modify")
    public @ResponseBody int modifyElecAuth(@RequestBody ElecAuthDto elecAuthDto) {
        return authService.updateElecAuth(elecAuthDto);
    }


}
