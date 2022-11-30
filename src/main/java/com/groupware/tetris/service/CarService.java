package com.groupware.tetris.service;


import com.groupware.tetris.dto.reservation.CarFormDto;
import com.groupware.tetris.entity.reservation.Car;
import com.groupware.tetris.entity.reservation.CarImg;
import com.groupware.tetris.repository.CarImgRepository;
import com.groupware.tetris.repository.CarRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class CarService {

    private final CarRepository carRepository;
    private final CarImgService carImgService;
    private final CarImgRepository carImgRepository;

    public Long savedCar(CarFormDto carFormDto, List<MultipartFile> carImgFileList)throws  Exception{

        //차량등록
        Car car = carFormDto.createCar();
        carRepository.save(car);

        //이미지등록
        for (int i =0 ; i<carImgFileList.size();i++){
            CarImg carImg = new CarImg();
            carImg.setCar(car);
            if (i == 0)
                carImg.setRepImgYn("Y");
            else
                carImg.setRepImgYn("N");
            carImgService.savedItemImg(carImg, carImgFileList.get(i));
        }

        return car.getId();

    }




}
