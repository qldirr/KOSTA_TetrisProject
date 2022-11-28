package com.groupware.tetris.dto.chat;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.socket.WebSocketSession;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
public class ChatRoomDto {

    private String roomId;
    private String roomTitle;
//    private Set<WebSocketSession> sessions = new HashSet<>();
//
//    public static ChatRoomDto create(String roomTitle){
//        ChatRoomDto chatRoom = new ChatRoomDto();
//
//        chatRoom.roomId = UUID.randomUUID().toString();
//        chatRoom.roomTitle = roomTitle;
//        return chatRoom;
//    }

}
