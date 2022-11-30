package com.groupware.tetris.controller;

import com.groupware.tetris.entity.suggestions.Suggestions;
import com.groupware.tetris.service.SuggestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDateTime;

@Controller
public class SuggestionsController {

    @Autowired
    private SuggestionsService suggestionsService;

    @GetMapping("/suggestions/suggestionsregister")
    public String suggestions(Model model) {
        Suggestions suggestions = new Suggestions();
        /*suggestions.setS_num(1);
        suggestions.setE_id("gdong123");
        suggestions.setS_title("건의사항 입니다.");
        suggestions.setS_contents("건의사항 입니다.");
        suggestions.setRegTime(LocalDateTime.now());
        suggestions.setUpdateTime(LocalDateTime.now());*/

        model.addAttribute("suggestionsregister", suggestions);
        return "suggestions/suggestionsregister";
    }

    @PostMapping("/suggestions/suggestionspro")
    public String suggestionspro(Suggestions suggestions){

        suggestionsService.suggestions(suggestions);

        return "";
    }

    @GetMapping("/suggestions/suggestionslist")
    public String suggestionslist(Model model){

        model.addAttribute("List", suggestionsService.suggestionsList());

        return "/suggestions/suggestionslist";
    }


}

