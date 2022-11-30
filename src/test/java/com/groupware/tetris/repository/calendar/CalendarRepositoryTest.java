package com.groupware.tetris.repository;

import com.groupware.tetris.entity.calendar.Calendar;
import com.groupware.tetris.entity.user.Employee;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@SpringBootTest

class CalendarRepositoryTest2 {
    @Autowired
    CalendarRepository calendarRepository;

    public Employee addEmployee(){
        Employee employee = new Employee();
        employee.setId(1L);
        return employee;
    }
    @Test
    @DisplayName("일정 저장 테스트")
    public void createCalendarTest(){
        Employee employee = this.addEmployee();
        Calendar calendar = new Calendar();
        calendar.setCl_num(1L);
        calendar.setCl_name("회의");
        calendar.setCl_startdate("2022-11-24");
        calendar.setCl_starttime("19:00");
        calendar.setCl_enddate("2022-11-24");
        calendar.setCl_endtime("20:00");
        calendar.setCl_color("red");
        calendar.setCl_contents("회의실1");
        calendar.setEmployee(employee);
        Calendar saveCalendar = calendarRepository.save(calendar);
        System.out.println(saveCalendar.toString());
    }

    @Test
    @Transactional(readOnly = true)
    @DisplayName("일정 조회 테스트")
    public void findByeidTest(){
        List<Calendar> calendarList = calendarRepository.findByeid(1L);
        for (Calendar calendar:calendarList){
            System.out.println(calendar.toString());
        }
    }

    @Test
    @DisplayName("일정 수정 테스트")
    public void updateCalendarTest(){
        Optional<Calendar> calendar = calendarRepository.findById(2L);
        calendar.ifPresent(selectCalendar->{
            selectCalendar.setCl_name("여행");
            selectCalendar.setCl_contents("일본");
            calendarRepository.save(selectCalendar);
        });

    }

    @Test
    @Transactional
    @DisplayName("일정 삭제 테스트")
    public void deleteCalendarTest(){
        calendarRepository.deleteByeid(2L);
    }

}