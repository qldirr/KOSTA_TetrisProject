package com.groupware.tetris.entity.reservation;


import com.groupware.tetris.constant.BookingStatus;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "CarBook")
@Getter
@Setter
public class CarBook {

    @Id  @GeneratedValue
    @Column(name = "CarBook_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "e_id")
    private Employee employee;

    @ManyToOne
    @JoinColumn(name = "car_id")
    private  Car car;

    private LocalDateTime startDate;
    private LocalDateTime endDate;

    private LocalDateTime startTime;
    private LocalDateTime endTime;


    @Enumerated(EnumType.STRING)
    private BookingStatus bookingStatus; //예약상태

    private LocalDateTime regDate;//등록 일자
    private LocalDateTime modDate;//수정 일자

    public static  CarBook createCarBook(Car car){
        CarBook carBook = new CarBook();
        carBook.setCar(car);

        return carBook;
    }















}
