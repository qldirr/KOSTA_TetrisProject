package com.groupware.tetris.entity.reservation;


import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "CarBook")
@Getter
@Setter
public class CarBook {

    @Id
    @Column(name = "carBook_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;








}
