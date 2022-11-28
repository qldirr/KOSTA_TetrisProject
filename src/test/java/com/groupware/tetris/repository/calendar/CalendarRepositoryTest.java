package com.groupware.tetris.repository.calendar;

import com.groupware.tetris.entity.calendar.Calendar;
import com.groupware.tetris.repository.CalendarRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CalendarRepositoryTest {
    @Autowired
    CalendarRepository calendarRepository;

    @Test
    @DisplayName("일정 저장 테스트")
    public void createCalendarTest(){
        Calendar calendar = new Calendar();
        calendar.setCl_num(1L);
        calendar.setCl_name("회식");
        calendar.setCl_startdate("2022-10-30");
        calendar.setCl_starttime("19:00");
        calendar.setCl_enddate("2022-10-30");
        calendar.setCl_endtime("20:00");
        calendar.setCl_color("red");
        calendar.setCl_contents("고기집");

        Calendar saveCalendar = calendarRepository.save(calendar);
        System.out.println(saveCalendar.toString());
    }


}