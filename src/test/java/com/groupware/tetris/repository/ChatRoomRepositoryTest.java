package com.groupware.tetris.repository;

import com.groupware.tetris.entity.chat.ChatRoom;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

import java.util.List;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ChatRoomRepositoryTest {

    @Autowired
    ChatRoomRepository chatRoomRepository;

    @Test
    @DisplayName("채팅방 생성 테스트")
    public void createChatRoomTest(){
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.setId("1");
        chatRoom.setTitle("테스트방1");
        chatRoomRepository.save(chatRoom);
        System.out.println(chatRoom);
    }

    @Test
    @DisplayName("방목록 호출 테스트")
    public void getListCRoomTest(){
        Long empId = 1L;
        List<ChatRoom> chatRoomList = chatRoomRepository.findCRoomListByEmployeeId(empId);
        System.out.println(chatRoomList);
    }

}