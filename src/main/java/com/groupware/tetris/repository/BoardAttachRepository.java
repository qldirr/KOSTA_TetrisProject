package com.groupware.tetris.repository;

import com.groupware.tetris.entity.project.BoardAttach;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardAttachRepository extends JpaRepository<BoardAttach, Long>{
    List<BoardAttach> findBoardAttachesByProjectBoard_Id(Long boardId);
}
