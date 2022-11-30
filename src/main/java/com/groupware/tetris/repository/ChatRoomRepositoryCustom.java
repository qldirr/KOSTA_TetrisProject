package com.groupware.tetris.repository;

import com.groupware.tetris.entity.chat.ChatRoom;

import java.util.List;

public interface ChatRoomRepositoryCustom {

    List<ChatRoom> findCRoomListByEmployeeId(Long empId);

}
