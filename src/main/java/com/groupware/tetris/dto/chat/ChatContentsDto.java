package com.groupware.tetris.dto.chat;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class ChatContentsDto {

    private String roomId;
    private String senderId;
    private String senderName;
    private String uuid;
    private String message;
    private Long size;
    private LocalDateTime regdate;
    private String read;
    private String image;
    private String path;
    private String file;

}
