package com.groupware.tetris.dto.reservation;

import com.groupware.tetris.entity.reservation.Car;
import lombok.Getter;
import lombok.Setter;
import org.modelmapper.ModelMapper;

import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
public class CarFormDto {

    private  Long id;

    @NotBlank(message = "차량번호는 필수 입력 값입니다.")
    private  String carNum;

    @NotBlank(message = "차량 모델명은 필수 입력 값입니다.")
    private  String modelNm;

    @NotBlank(message = "차종은 필수 입력 값입니다.")
    private String carType;//차종

    @NotBlank(message = "연식은 필수 입력 값입니다.")
    private String carAge; //연식

    //차량 저장 후 수정할 때 차량 이미지 정보를 저장하는 리스트입니다.
    private List<CarImgDto> carImgDtoList = new ArrayList<>();

    //차량의 이미지 아이디를 저장하는 리스트로 수정시에 이미지 아이디를 담아둘 용도로 사용합니다.
    private  List<Long>  carImgIds = new ArrayList<>();

    private  static ModelMapper modelMapper = new ModelMapper();

    public Car createCar(){
        return modelMapper.map(this, Car.class);
    }

    public static CarFormDto of(Car car){
        return modelMapper.map(car, CarFormDto.class);

    }

}
