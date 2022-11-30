package com.groupware.tetris.entity.reservation;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="Car")
@Getter
@Setter
@ToString
public class Car {

    @Id
    @Column(name = "Car_id")
    @GeneratedValue(strategy = GenerationType.AUTO )
    private Long id; //차량코드

    @Column(nullable = false)
    private String carNum;//차량번호

    @Column(nullable = false, length = 50)
    private String modelNm; //차량모델명

    @Column(nullable = false)
    private String carType;//차종

    @Column(nullable = false)
    private String carAge; //연식

    private LocalDateTime regDate;//등록 일자
    private LocalDateTime modDate;//수정 일자



}
