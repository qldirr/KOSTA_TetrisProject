package com.groupware.tetris.controller.attendance;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/attendance")
public class HrController {


    @GetMapping("/person")
    public void get(Model model){

        //model.addAttribute();
    }

    //출근
    @PostMapping("/insertAction.do")
    public String insertAction(){

        return "";
    }

    //외근
    @PostMapping("/outAction.do")
    public String outAction(){

        return "";
    }

    //퇴근
    @PostMapping("/endAction.do")
    public String endAction(){

        return "";
    }

    //개인근태페이지
    @GetMapping("/personal")
    public void getPersonal(){

    }

    @GetMapping("/personAll")
    public void getAll(){

    }


}
