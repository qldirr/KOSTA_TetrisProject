package com.groupware.tetris.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    @GetMapping("/login")
    public String login(){

        return "/member/customLogin";
    }
    @GetMapping("/login/Error")
    public String loginError(Model model){

        return "/member/customLogin";
    }


}
