package com.groupware.tetris.repository;

import com.groupware.tetris.entity.elecauth.ElecAuth;
import com.groupware.tetris.entity.project.BoardAttach;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ElecAuthRepository extends JpaRepository<ElecAuth, Long> {
}
