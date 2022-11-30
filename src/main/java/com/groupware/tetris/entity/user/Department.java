package com.groupware.tetris.entity.user;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="department")

public class Department{
    @Id
    @Column(name = "d_id")
    @GeneratedValue(strategy =GenerationType.AUTO)
    private Long id;
    private String name;
    private String head;


    /*@OneToMany(mappedBy = "department", cascade = CascadeType.ALL,
            orphanRemoval = true,fetch = FetchType.LAZY)
    List<Employee> employees = new ArrayList<>();*/
}
