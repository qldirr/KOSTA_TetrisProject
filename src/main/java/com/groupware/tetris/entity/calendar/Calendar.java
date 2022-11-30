package com.groupware.tetris.entity.calendar;

import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "calendar")
@Getter
@Setter
@ToString
public class Calendar {
    @Id
    @Column(name = "cl_num")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long cl_num;

    @Column(name = "cl_name")
    private String cl_name;

    @Column(name = "cl_startdate")
    private String cl_startdate;

    @Column(name = "cl_enddate")
    private String cl_enddate;

    @Column(name = "cl_starttime")
    private String cl_starttime;

    @Column(name = "cl_endtime")
    private String cl_endtime;

    @Column(name = "cl_color")
    private String cl_color;

    @Lob
    @Column(nullable = true, name = "cl_contents")
    private String cl_contents;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "e_id")
    private Employee employee;


}
