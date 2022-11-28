package com.groupware.tetris.dto.project;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class BoardAttachDto {

    private Long id;
    private String attachName;
    private String oriAttachName;
    private String attachPath;
    private String type;

}
