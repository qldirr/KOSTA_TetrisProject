package com.groupware.tetris.dto.calendar;

import com.groupware.tetris.entity.calendar.Calendar;
import org.modelmapper.ModelMapper;

public class CalendarDto {
    private Long cl_num;
    private String cl_name;
    private String cl_startdate;
    private String cl_enddate;
    private String cl_starttime;
    private String cl_endtime;
    private String cl_color;
    private String cl_contents;

    private static ModelMapper modelMapper = new ModelMapper();

    public Calendar createCalendar(){
        return modelMapper.map(this,Calendar.class);
    }

    public static CalendarDto of(Calendar calendar){
        return modelMapper.map(calendar,CalendarDto.class);
    }

}
