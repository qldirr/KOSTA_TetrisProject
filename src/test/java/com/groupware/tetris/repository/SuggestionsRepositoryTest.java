package com.groupware.tetris.repository;

import com.groupware.tetris.entity.suggestions.Suggestions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

import java.time.LocalDateTime;

@SpringBootTest
@TestPropertySource(locations = "classpath:application-test.properties")
class SuggestionsRepositoryTest {

    @Autowired
    SuggestionsRepository suggestionsRepository;

    @Test
    @DisplayName("건의사항 저장 테스트")
    public void createSuggestionsTest(){
        Suggestions suggestions = new Suggestions();
        suggestions.setS_num(1);
        suggestions.setE_id("gdong123");
        suggestions.setS_title("건의사항 입니다.");
        suggestions.setS_contents("건의사항 입니다.");
        suggestions.setRegTime(LocalDateTime.now());
        suggestions.setUpdateTime(LocalDateTime.now());
        Suggestions saveSuggestions = suggestionsRepository.save(suggestions);
        System.out.println(saveSuggestions.toString());
    }
}



