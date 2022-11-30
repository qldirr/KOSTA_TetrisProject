package com.groupware.tetris.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    @GetMapping("/login")
    public String login(){
        return "/member/customLogin";
    }
    @GetMapping("/loginError")
    public String loginError(Model model){

        return "/member/customLogin";
    }


}
