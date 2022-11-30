package com.groupware.tetris.service;

import com.groupware.tetris.dto.calendar.CalendarDto;
import com.groupware.tetris.entity.calendar.Calendar;
import com.groupware.tetris.repository.CalendarRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class CalendarService {
    private final CalendarRepository calendarRepository;

    public Long saveCalendar(CalendarDto calendarDto) throws Exception{
        Calendar calendar = calendarDto.createCalendar();
        calendarRepository.save(calendar);
        return calendar.getCl_num();
    }


}
