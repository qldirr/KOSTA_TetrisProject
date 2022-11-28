//package com.groupware.tetris.repository;
//
//import com.groupware.tetris.entity.chat.ChatRoom;
//import org.junit.jupiter.api.DisplayName;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.TestPropertySource;
//
//import java.util.List;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//@SpringBootTest
//@TestPropertySource(locations = "classpath:application-test.properties")
//class ChatRoomRepositoryTest {
//
//    @Autowired
//    ChatRoomRepository chatRoomRepository;
//
//    @Test
//    @DisplayName("방목록 호출 테스트")
//    public void getListCRoomTest(){
//        String employeeId = "gdong123";
//        List<ChatRoom> chatRoomList = chatRoomRepository.findCRoomListByEmployeeId(employeeId);
//        System.out.println(chatRoomList);
//    }
//
//}