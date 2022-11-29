package com.groupware.tetris.repository;

import com.groupware.tetris.entity.chat.ChatContents;

import java.util.List;

public interface ChatContentsRepositoryCustom {

    List<ChatContents> findAllByRoomId(String roomId);

}
