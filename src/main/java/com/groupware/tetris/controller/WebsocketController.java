package com.groupware.tetris.controller;

import com.groupware.tetris.dto.chat.ChatContentsDto;
import com.groupware.tetris.entity.chat.ChatContents;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class WebsocketController {

    //특정 broker로 메세지 전달
    private final SimpMessagingTemplate template;

    @MessageMapping("/chatting/enter")
    public void enter(ChatContents message){
        message.setContents(message.getSender() + "님이 입장하셨습니다.");
        template.convertAndSend("/sub/chatting/chatroom/" + message.getChatRoom().getId(), message);
    }

    @MessageMapping("/chatting/message")
    public void message(ChatContents message){
        template.convertAndSend("/sub/chatting/chatroom/" + message.getChatRoom().getId(), message);
    }

}
