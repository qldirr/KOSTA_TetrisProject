package com.groupware.tetris.controller;

import com.groupware.tetris.dto.elecauth.ElecAuthDto;
import com.groupware.tetris.service.ElecAuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequiredArgsConstructor
public class ElecAuthController {

    private final ElecAuthService authService;

    @GetMapping(value = "/elecauth/main")
    public String getElecAuthMain(){
        return "/elecauth/main";
    }

    @GetMapping(value = "/elecauth/register")
    public String getElecAuthRegistForm(){
        return "/elecauth/register";
    }

    @PostMapping(value = "/elecauth/register")
    public String registElecAuth(@RequestBody ElecAuthDto elecAuthDto) {
        authService.saveElecAuth(elecAuthDto);
        return "/elecauth/main";
    }

}
