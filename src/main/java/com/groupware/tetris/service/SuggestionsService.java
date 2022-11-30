package com.groupware.tetris.service;


import com.groupware.tetris.entity.suggestions.Suggestions;
import com.groupware.tetris.repository.SuggestionsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SuggestionsService {

    @Autowired
    private SuggestionsRepository suggestionsRepository;

    public void write(Suggestions suggestions){
        suggestionsRepository.save(suggestions);
    }
















    /*//리스트
    public List<Suggestions> suggestionsList(){

        return suggestionsRepository.findAll();
    }


    public void suggestionsregister(Suggestions suggestions){

        suggestionsRepository.save(suggestions);
    }*/

}
