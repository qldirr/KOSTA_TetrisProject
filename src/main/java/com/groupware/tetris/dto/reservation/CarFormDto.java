package com.groupware.tetris.dto.reservation;

import com.groupware.tetris.entity.reservation.Car;
import lombok.Getter;
import lombok.Setter;
import org.modelmapper.ModelMapper;

import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
public class CarFormDto {

    private  Long id;

    @NotNull(message = "차량 모델명은 필수 입력 값입니다.")
    private  String modelNm;

    @NotNull(message = "차종은 필수 입력 값입니다.")
    private String carType;//차종

    @NotNull(message = "연식은 필수 입력 값입니다.")
    private String carAge; //연식

    //상품 저장 후 수정할 때 상품 이미지 정보를 저장하는 리스트입니다.
    private List<CarImgDto> carImgDtoList = new ArrayList<>();

    //상품의 이미지 아이디를 저장하는 리스트로 수정시에 이미지 아이디를 담아둘 용도로 사용합니다.
    private  List<Long>  carImgIds = new ArrayList<>();

    private  static ModelMapper modelMapper = new ModelMapper();

    public Car createCar(){
        return modelMapper.map(this, Car.class);
    }

    public static CarImgDto of(Car car){
        return modelMapper.map(car, CarImgDto.class);

    }

}
