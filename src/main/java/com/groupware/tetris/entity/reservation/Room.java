package com.groupware.tetris.entity.reservation;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import net.bytebuddy.dynamic.loading.InjectionClassLoader;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "Room")
@Getter
@Setter
@ToString
public class Room {

    @Id
    @Column(name = "Room_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private  Long id;

    @Column(nullable = false)
    private String rooNum;

    @Column(nullable = false)
    private String roomNm;

    @Column(nullable = false)
    private String total;


    private LocalDateTime regDate;//등록 일자
    private LocalDateTime modDate;//수정 일자



}
