package com.groupware.tetris.controller;

import com.groupware.tetris.dto.reservation.CarDto;
import com.groupware.tetris.dto.reservation.CarFormDto;
import com.groupware.tetris.dto.reservation.CarImgDto;
import com.groupware.tetris.entity.reservation.Car;
import com.groupware.tetris.service.CarService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityNotFoundException;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class CarController {

    private final CarService carService;


    @GetMapping(value = "/reservation/listcar")
    public String rescarMain (Model model){
        CarDto carlist = new CarDto();
        carlist.setModelNm("테스트모델 1");
        carlist.setCarType("테스트타입 1");
        carlist.setCarAge("테스트연식 1");
        carlist.setRegDate(LocalDateTime.now());
        carlist.setModDate(LocalDateTime.now());

        model.addAttribute("carlist",carlist);
        return "reservation/listcar";
    }


    @GetMapping(value = "/reservation/registercar")
    public String carForm(Model model){
        return "/reservation/registercar";
    }

    @PostMapping(value = "/reservation/registercar")
    public  String CarNew(@Valid CarFormDto carFormDto,
                          BindingResult bindingResult, Model model,
                          @RequestParam("carImgFile")List<MultipartFile>carImgFileList)throws  Exception{

        if (bindingResult.hasErrors()){
            return "/reservation/registercar";

        }
        if (carImgFileList.get(0).isEmpty() && carFormDto.getId() == null){
            model.addAttribute("errorMessage","이미지는 필수 입력 값 입니다.");
            return "/reservation/registercar";
        }

        try {
            carService.savedCar(carFormDto,carImgFileList);
        }catch (Exception e){
            model.addAttribute("errorMessage","차량 등록 중 에러가 발생하였습니다.");
            return "/reservation/registercar";
        }
         return "/reservation/listcar";
    }

   /* @GetMapping(value = "/reservation/readcar/{carId}")
    public String CarDtl(@PathVariable("carId")Long carId, Model model){
        try {
            CarFormDto carFormDto = carService.getCarDtl(carId);
            model.addAttribute("carFormDto",carFormDto);
        }catch (EntityNotFoundException e){
            model.addAttribute("errorMessage","존재하지 않는 상품입니다.");
            model.addAttribute("carFormDto",new CarFormDto());
            return "/reservation/readcar/";
        }

        return "/reservation/readcar/";

    }*/

    @GetMapping(value = "/reservation/rescarmain")
    public String rescarmain(Optional<Integer> page, Model model){
        Pageable pageable = PageRequest.of(page.isPresent()?page.get():0,6);
/*        page<CarDto> cars= carService.getCarListPage(carService,pageable);
        model.addAttribute("list",carlist)*/;
        model.addAttribute("maxPage",5);
        return "/reservation/rescarmain";
    }

    @GetMapping(value = "/reservation/readcar/{carId}")
    public String CarDtl(@PathVariable("carId")Long carId, Model model){
     CarFormDto carFormDto = carService.getCarDtl(carId);
     model.addAttribute("carFormDto",carFormDto);

        return "/reservation/readcar";

    }


}
