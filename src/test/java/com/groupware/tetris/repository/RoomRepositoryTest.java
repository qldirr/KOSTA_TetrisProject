package com.groupware.tetris.repository;


import com.groupware.tetris.entity.reservation.Room;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

import java.time.LocalDateTime;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@TestPropertySource(locations = "classpath:application-test.properties")
class RoomRepositoryTest {

    @Autowired
    RoomRepository roomRepository;

    /*@Test
    @DisplayName("회의실 저장테스트")
    public void createCarTest(){
        Room room = new Room();
        room.setRooNum("RS001");
        room.setRoomNm("블록");
        room.setTotal("7명");
        room.setRegDate(LocalDateTime.now());
        room.setModDate(LocalDateTime.now());

        Room savedroom = roomRepository.save(room);

        System.out.println(savedroom.toString());
    }
*/
    public  void createRoomList(){
        for (int i = 1; i<10; i++){
            Room room = new Room();
            room.setRooNum("테스트 회의실번호" + i);
            room.setRoomNm("테스트 회의실이름 "+ i);
            room.setTotal("테스트 회의실 인원수"+ i);
            room.setRegDate(LocalDateTime.now());
            room.setModDate(LocalDateTime.now());

            Room savedroom = roomRepository.save(room);


        }
    }

    @Test
    @DisplayName("회의실조회 테스트")
    public void findByModelNmtest(){
        this.createRoomList();
        List<Room> roomList = roomRepository.findByRoomNm("테스트 회의실이름1");
        for (Room room: roomList){
            System.out.println(room.toString());
        }
    }

}