package com.groupware.tetris.entity.elecauth;

import com.groupware.tetris.constant.LineStatus;
import com.groupware.tetris.entity.BaseTimeEntity;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name="elecline")
@Getter
@Setter
@ToString
public class ElecLine extends BaseTimeEntity {

    @Id
    @Column(name = "l_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "el_id")
    private ElecAuth auth;

    private LineStatus status;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "e_id")
    private Employee approver;

    private Long sequence;

}
