package com.groupware.tetris.service;

import com.groupware.tetris.dto.reservation.CarBookDto;
import com.groupware.tetris.entity.reservation.Car;
import com.groupware.tetris.entity.reservation.CarBook;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.CarBookRepository;
import com.groupware.tetris.repository.CarRepository;
import com.groupware.tetris.repository.EmployeeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class CarBookService {

    private  final CarRepository carRepository;
    private  final EmployeeRepository employeeRepository;
    private  final CarBookRepository carBookRepository;

    public Long CarBook(CarBookDto carBookDto, String email){
        Car car = carRepository.findById(carBookDto.getCarId())
                .orElseThrow(EntityNotFoundException::new);
        Employee employee = employeeRepository.findByEmail(email);

        List<CarBook> carBookList= new ArrayList<>();
        CarBook carBook = CarBook.createCarBook(car);
        carBookList.add(carBook);

        return carBook.getId();
    }
}
