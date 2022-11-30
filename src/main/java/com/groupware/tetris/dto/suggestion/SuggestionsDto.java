package com.groupware.tetris.dto.suggestion;

import com.groupware.tetris.entity.suggestions.Suggestions;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.modelmapper.ModelMapper;

import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
public class SuggestionsDto {
    private long s_num;
    private String e_id;
    private String s_title;
    private String s_contents;
    private LocalDateTime regDate;
    private LocalDateTime modDate;

}
