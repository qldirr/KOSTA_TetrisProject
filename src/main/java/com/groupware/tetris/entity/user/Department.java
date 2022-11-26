package com.groupware.tetris.entity.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="department")
@Getter @Setter
@ToString
public class Department{
    @Id
    @Column(name = "d_id")
    @GeneratedValue(strategy =GenerationType.AUTO)
    private Long id;
    private String name;
    private String head;

    @OneToMany(mappedBy = "department", cascade = CascadeType.ALL,
            orphanRemoval = true,fetch = FetchType.LAZY)
    List<Employee> employees = new ArrayList<>();

}
