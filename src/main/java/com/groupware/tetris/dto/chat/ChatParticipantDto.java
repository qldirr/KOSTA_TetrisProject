package com.groupware.tetris.dto.chat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatParticipantDto {

    private Long id;
    private String roomId;
    private String e_id;
    private String read;
    private String bookmark;

}
