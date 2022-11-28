package com.groupware.tetris.dto.reservation;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import java.time.LocalDateTime;

@Getter
@Setter
public class RoomDto {


    private Long id; //회의실 코드

    private String rooNum; //회의실 번호

    private String roomNm; //회의실 이름

    private String total; //회의실 수용인원


    private LocalDateTime regDate;//등록 일자
    private LocalDateTime modDate;//수정 일자

}
