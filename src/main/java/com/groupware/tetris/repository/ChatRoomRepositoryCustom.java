package com.groupware.tetris.repository;

import com.groupware.tetris.entity.chat.ChatRoom;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ChatRoomRepositoryCustom {

    List<ChatRoom> findCRoomListByEmployeeId(String employeeId);

}
