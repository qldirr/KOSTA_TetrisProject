package com.groupware.tetris.repository;

import com.groupware.tetris.entity.project.BoardReply;
import com.groupware.tetris.entity.project.ProjectBoard;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardReplyRepository extends JpaRepository<BoardReply, Long>, BoardReplyRepositoryCustom {

    List<BoardReply> findBoardRepliesByProjectBoard_IdOrderByIdDesc(Long boardId);

}
