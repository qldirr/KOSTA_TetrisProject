package com.groupware.tetris.controller;

import com.groupware.tetris.dto.chat.ChatContentsDto;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class WebsocketController {

    //특정 broker로 메세지 전달
    private final SimpMessagingTemplate template;

//    @MessageMapping("/chatting/enter")
//    public void enter(ChatContentsDto message){
//        message.setMessage(message.getSenderName() + "님이 입장하셨습니다.");
//        template.convertAndSend("/sub/chatting/chatroom/" + message.getRoomId(), message);
//    }
//
//    @MessageMapping("/chatting/message")
//    public void message(ChatContentsDto message){
//        template.convertAndSend("/sub/chatting/chatroom/" + message.getRoomId(), message);
//    }

}
