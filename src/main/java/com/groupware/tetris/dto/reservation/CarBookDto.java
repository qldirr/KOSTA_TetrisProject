package com.groupware.tetris.dto.reservation;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Getter
@Setter
public class CarBookDto {

    @NotNull(message = "차량 아이디는 필수 입력 값입니다.")
    private Long carId;

    private LocalDateTime startDate;
    private LocalDateTime endDate;

    private LocalDateTime startTime;
    private LocalDateTime endTime;
}
