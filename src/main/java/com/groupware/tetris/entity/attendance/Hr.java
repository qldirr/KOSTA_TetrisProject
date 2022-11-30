package com.groupware.tetris.entity.attendance;

import com.groupware.tetris.constant.Hr_status;
import com.groupware.tetris.dto.attendance.HrFormDto;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "hr")
@Getter @Setter @ToString
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

    @Column(name = "e_id")
    private Long eid;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "e_id", insertable = false, updatable = false)
    private Employee employee;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "employee_hr",
            joinColumns = @JoinColumn(name = "e_id"),
            inverseJoinColumns = @JoinColumn(name = "hr_num")
    )
    private List<Hr> hrList;

    public static Hr createHr(HrFormDto hrFormDto){
        Hr hr = new Hr();

        hr.setHr_num(hrFormDto.getHr_num());
        hr.setHr_date(hrFormDto.getHr_date());
        hr.setHr_leave(hrFormDto.getHr_leave());
        hr.setHr_status(hrFormDto.getHr_status());

        return hr;
    }
}
