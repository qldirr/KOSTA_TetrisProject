package com.groupware.tetris.entity.chat;

import com.groupware.tetris.dto.chat.ChatRoomDto;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Getter
@Setter
public class ChatRoom {

    @Id
    @Column(name = "cr_id")
    private String id;

    @Column(name = "cr_title")
    private String title;

    public static ChatRoom createChatRoom(ChatRoomDto chatRoomDto){
        ChatRoom chatRoom = new ChatRoom();
        String cr_id = UUID.randomUUID().toString();
        chatRoom.setId(cr_id);
        chatRoom.setTitle(chatRoomDto.getRoomTitle());

        return chatRoom;
    }

}
