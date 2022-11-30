package com.groupware.tetris.repository;


import com.groupware.tetris.entity.reservation.CarImg;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarImgRepository extends JpaRepository<CarImg, Long> {
    List<CarImg> findByCarIdOrderByIdAsc(Long CarId);
}
