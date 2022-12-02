package com.groupware.tetris.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class HomeController {

//    @GetMapping("/")
//    public String test(){
//        return "test";
//    }

    @GetMapping("/")
    public String main(){
        return "/main";
    }
}
