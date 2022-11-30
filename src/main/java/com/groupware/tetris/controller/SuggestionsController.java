package com.groupware.tetris.controller;

import com.groupware.tetris.entity.suggestions.QSuggestions;
import com.groupware.tetris.entity.suggestions.Suggestions;
import com.groupware.tetris.service.SuggestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class SuggestionsController {

    @Autowired
    private SuggestionsService suggestionsService;

    @GetMapping("/suggestions/suggesionsregister")
    public String suggestWriteForm(){

        return "/suggestions/suggesionsregister";
    }

    @PostMapping("/suggesions/writepro")
    public String suggestionsWritePro(Suggestions suggestions){
        suggestionsService.write(suggestions);
        return "";
    }

















    /*//리스트
    @GetMapping("/suggestions/suggestionslist")
    public String suggestionslist(Model model){

        model.addAttribute("List", suggestionsService.suggestionsList());

        return "/suggestions/suggestionslist";
    }

    //글 추가
    @RequestMapping("/suggestions/suggestionsregister")
    public String suggestionsregister(Model model){
        return "/suggestions/suggestionsregister";
    }

    //글 상세보기
    /*@RequestMapping("/suggestions/suggestionsget")
    public String suggestionsget(Long s_num, Model model){
        model.addAttribute("Modify", suggestionsService.findById(s_num));
        return "/suggestions/suggestionsget";
    }*/

    //글 수정하기
   /* @RequestMapping("/suggestions/suggestionsmodify/{s_num}")
    public String suggestionsmodify(@PathVariable Long s_num, Model model){
        model.addAttribute("Modify", suggestionsService.findById(s_num));
        return "/suggestions/suggestionsmodify";
    }*/



    /*@GetMapping("/suggestions/suggestionsregister")
    public String suggestions(Model model) {
        Suggestions suggestions = new Suggestions();

        model.addAttribute("suggestionsregister", suggestions);
        return "suggestions/suggestionsregister";
    }

    @PostMapping("/suggestions/suggestionspro")
    public String suggestionspro(Suggestions suggestions){

        suggestionsService.suggestions(suggestions);

        return "";
    }*/

}

