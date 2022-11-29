package com.groupware.tetris.repository;

import com.groupware.tetris.entity.chat.ChatParticipant;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChatParticipantRepository extends JpaRepository<ChatParticipant, Long> {
}
