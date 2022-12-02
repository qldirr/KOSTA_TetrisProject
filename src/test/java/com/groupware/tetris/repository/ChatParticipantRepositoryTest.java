package com.groupware.tetris.repository;

import com.groupware.tetris.entity.chat.ChatParticipant;
import com.groupware.tetris.entity.chat.ChatRoom;
import com.groupware.tetris.entity.user.Employee;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ChatParticipantRepositoryTest {

    @Autowired
    ChatParticipantRepository chatParticipantRepository;

    public Employee addEmployee(){
        Employee employee = new Employee();
        employee.setId(1L);
        return employee;
    }

    @Test
    @DisplayName("채팅방 참여자 입력 테스트")
    public void createChatPartTest(){
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.setTitle("테스트방1");
        chatRoom.setId("1");

        Employee employee = new Employee();
        employee.setId(1L);

        ChatParticipant chatParticipant = new ChatParticipant();
        chatParticipant.setChatRoom(chatRoom);
        chatParticipant.setEmployee(employee);
        chatParticipant.setRead("false");
        chatParticipant.setBookmark("false");
        chatParticipant.setId(1L);
        chatParticipantRepository.save(chatParticipant);
    }

}