package com.groupware.tetris.dto.reservation;


import com.groupware.tetris.entity.reservation.CarImg;
import lombok.Getter;
import lombok.Setter;
import org.modelmapper.ModelMapper;

@Setter
@Getter
public class CarImgDto {
    //차량정보 등록 후 차량 이미지에 대한 데이터를 전달할 DTO 클래스

    private Long id;

    private String imgName; //이미지 파일명

    private String oriImgName; // 원본 이미지 파일명

    private  String imgUrl; // 이미지 조회 경로

    private  String repImgYn; //대표 이미지여부

    //ModelMapper는 서로 다른 클래스의 값을 필드의 이름과 자료형이 같으면 setter,getter를 통해 값을 복사해서 객체를 반환해줍니다.
    private static ModelMapper modelMapper = new ModelMapper();

    public static CarImgDto of(CarImg carImg){
        return modelMapper.map(carImg,CarImgDto.class);
    }


}
