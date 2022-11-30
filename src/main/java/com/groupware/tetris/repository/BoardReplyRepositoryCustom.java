package com.groupware.tetris.repository;

import com.groupware.tetris.entity.project.BoardReply;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardReplyRepositoryCustom {

    List<BoardReply> getTotalBoardReply(Long projectId);

}
