package com.groupware.tetris.repository;

import com.groupware.tetris.entity.reservation.Car;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

import java.time.LocalDateTime;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@TestPropertySource(locations = "classpath:application-test.properties")
class CarRepositoryTest {

    @Autowired
    CarRepository carRepository;

   /* @Test
    @DisplayName("상품 저장테스트")
    public void createCarTest(){
        Car car = new Car();
        car.setModelNm("볼보S60");
        car.setCarType("중형세단");
        car.setCarAge("2022");
        car.setRegDate(LocalDateTime.now());
        car.setModDate(LocalDateTime.now());

        Car savedCar = carRepository.save(car);

        System.out.println(savedCar.toString());
    }*/

   /* public  void createCarList(){
        for (int i = 1; i<10; i++){
            Car car = new Car();
            car.setModelNm("테스트 차량" + i);
            car.setCarType("테스트 차종"+ i);
            car.setCarAge("테스트 연식"+ i);
            car.setRegDate(LocalDateTime.now());
            car.setModDate(LocalDateTime.now());

            Car savedCar = carRepository.save(car);


        }
    }*/

    @Test
    @DisplayName("차량조회 테스트")
    public void findByModelNmTest(){
        //this.createCarList();
        List<Car> carList = carRepository.findByModelNm("볼보60");
        for (Car car: carList){
            System.out.println(car.toString());

        }
    }



}