package com.groupware.tetris.repository;

import com.groupware.tetris.dto.reservation.CarFormDto;
import com.groupware.tetris.entity.reservation.Car;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface CarRepositoryCustom {

    Page<Car> getCarListPage(CarFormDto carFormDto,Pageable pageable);
}
