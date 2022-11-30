package com.groupware.tetris.dto.attendance;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class HrDto2 {

    private long workingHour;
    private long working_day;
    private long late_day;
    private long skip_day;
    private long holi_day;
    private long e_totalvac;
    private long e_usevac;
    private long left_holiday = e_totalvac - e_usevac;
}
