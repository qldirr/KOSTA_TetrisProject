package com.groupware.tetris.entity.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "employee")
@Getter @Setter
@ToString
public class Employee {
    @Id
    @Column(name = "e_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String email;
    private String password;
    private String phoneNumber;
    private Timestamp hireddate;
    private Timestamp resigndate;
    private Integer totalVac;
    private Integer useVac;
    private String birth;
    private String position;
    private boolean Enabled;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "d_id")
    private Department department;

}
