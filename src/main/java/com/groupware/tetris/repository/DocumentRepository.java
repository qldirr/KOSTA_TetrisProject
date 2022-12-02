package com.groupware.tetris.repository;

import com.groupware.tetris.entity.elecauth.Document;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DocumentRepository extends JpaRepository<Document, Long> {
}
