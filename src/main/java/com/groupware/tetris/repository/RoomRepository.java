package com.groupware.tetris.repository;


import com.groupware.tetris.entity.reservation.Room;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoomRepository extends JpaRepository<Room, Long> {

    List<Room> findByRoomNm(String roomNm);

}
