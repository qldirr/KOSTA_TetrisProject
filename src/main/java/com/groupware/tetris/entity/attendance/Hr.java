package com.groupware.tetris.entity.attendance;

import com.groupware.tetris.constant.Hr_status;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "Hr")
@Getter @Setter
public class Hr {

    @Id
    @GeneratedValue
    @Column(name = "hr_num")
    private Long hr_num;

    private LocalDateTime hr_date;

    private LocalDateTime hr_leave;

    @Enumerated(EnumType.STRING)
    private Hr_status hr_status;

    private String hr_note;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "e_id")
    private Employee employee;
}
