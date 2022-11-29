package com.groupware.tetris.repository;

import com.groupware.tetris.entity.chat.ChatContents;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChatContentsRepository extends JpaRepository<ChatContents, Long>, ChatContentsRepositoryCustom {



}
