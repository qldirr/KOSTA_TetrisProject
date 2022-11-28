package com.groupware.tetris.repository;

import com.groupware.tetris.entity.suggestions.Suggestions;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SuggestionsRepository extends JpaRepository<Suggestions, Long> {

}