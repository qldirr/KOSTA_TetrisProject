package com.groupware.tetris.repository;

import com.groupware.tetris.entity.reservation.Car;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarRepository extends JpaRepository<Car, Long> {

    List<Car> findBy(String modelNm);


}
