package com.groupware.tetris.repository;

import com.groupware.tetris.entity.elecauth.ElecAuth;
import com.groupware.tetris.entity.elecauth.ElecLine;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ElecLineRepository  extends JpaRepository<ElecLine, Long> {
}
