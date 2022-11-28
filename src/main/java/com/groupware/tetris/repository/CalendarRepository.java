package com.groupware.tetris.repository;

import com.groupware.tetris.entity.calendar.Calendar;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CalendarRepository extends JpaRepository<Calendar,Long> {
}
