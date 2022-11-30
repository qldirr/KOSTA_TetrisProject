package com.groupware.tetris.repository;

import com.groupware.tetris.dto.reservation.CarDto;
import com.groupware.tetris.dto.reservation.CarFormDto;
import com.groupware.tetris.entity.reservation.Car;
import com.groupware.tetris.entity.reservation.QCar;
import com.groupware.tetris.entity.reservation.QCarImg;
import com.querydsl.core.QueryResults;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import java.util.List;

public class CarRepositoryCustomImPl implements CarRepositoryCustom{
    private JPAQueryFactory queryFactory;


    @Override
    public Page<Car> getCarListPage(CarFormDto carFormDto, Pageable pageable) {
      /*  QCar car = QCar.car;
        QCarImg carImg = QCarImg.carImg;

        QueryResults<CarDto> results = queryFactory
                .select(
                       *//* new QCarDto(*//*
                                car.id,
                                car.carNum,
                                car.modelNm,
                                car.carType,
                                car.carAge,
                        )
                .from(carImg)
                .join(carImg.car,car)
                .where(carImg.repImgYn.eq("Y"))
                .orderBy(car.id.desc())
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .fetchResults();


        List<CarDto> content = results.getResults();
        long total = results.getTotal();
*/
        return null;
    }
}
