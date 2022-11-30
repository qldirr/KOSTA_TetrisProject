package com.groupware.tetris.repository;

import com.groupware.tetris.entity.suggestions.Suggestions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@SpringBootTest
//@TestPropertySource(locations = "classpath:application-test.properties")
class SuggestionsRepositoryTest {

    @Autowired
    SuggestionsRepository suggestionsRepository;

    /*@Test
    @DisplayName("저장 테스트")
    public void registerTest(){
        Suggestions suggestions = new Suggestions();
        suggestions.setS_num(2);
        suggestions.setE_id("gdong123");
        suggestions.setS_title("건의사항 입니다.");
        suggestions.setS_contents("건의사항 입니다.");
        suggestions.setRegDate(LocalDateTime.now());
        suggestions.setModDate(LocalDateTime.now());
        Suggestions saveSuggestions = suggestionsRepository.save(suggestions);
        System.out.println(saveSuggestions.toString());
    }*/

    /*@Test
    @Transactional(readOnly = true)
    @DisplayName("리스트 테스트")
    public void listTest(){
        List<Suggestions> suggestionsList = suggestionsRepository.findAll();
        for (Suggestions suggestions:suggestionsList){
            System.out.println(suggestions.toString());
        }
    }*/

    /*@Test
    @DisplayName("수정 테스트")
    public void modify(){
        Optional<Suggestions> suggestions = suggestionsRepository.findById(1L);

        suggestions.ifPresent(selectedSuggestions ->{
            selectedSuggestions.setS_title("건의사항 제목qqqqq수정");
            selectedSuggestions.setS_contents("건의사항 내용qqqqq수정");
            suggestionsRepository.save(selectedSuggestions);
        });
        System.out.println(suggestions);
    }*/


    @Test
    @DisplayName("삭제 테스트")
    public void delete(){
            suggestionsRepository.deleteById(1L);
        }
    }



