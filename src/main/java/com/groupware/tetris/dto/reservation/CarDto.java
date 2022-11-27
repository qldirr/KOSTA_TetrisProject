package com.groupware.tetris.dto.reservation;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Getter
@Setter
public class CarDto {


    private Long id; //차량코드

    private String modelNm; //차량모델명

    private String carType;//차종

    private String carAge; //연식

    private LocalDateTime regDate;//등록 일자
    private LocalDateTime modDate;//수정 일자
}
