package com.groupware.tetris.entity.reservation;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "Car_img")
@Getter
@Setter
public class CarImg {

    @Id
    @Column(name = "Car_img_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String imgName; //이미지 파일명

    private String oriImgName; // 원본 이미지 파일명

    private  String imgUrl; // 이미지 조회 경로

    private  String repImgYn; //대표 이미지여부

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Car_id")
    private Car car;

    public void updateCarImg(String imgName, String oriImgName, String imgUrl) {
        this.imgName = imgName;
        this.oriImgName = oriImgName;
        this.imgUrl = imgUrl;
    }
}
