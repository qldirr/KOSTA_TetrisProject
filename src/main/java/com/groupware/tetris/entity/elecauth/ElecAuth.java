package com.groupware.tetris.entity.elecauth;

import com.groupware.tetris.constant.ElecStatus;
import com.groupware.tetris.dto.elecauth.ElecAuthDto;
import com.groupware.tetris.entity.BaseTimeEntity;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="elecauth")
@Getter
@Setter
@ToString
public class ElecAuth extends BaseTimeEntity {

    @Id
    @Column(name = "el_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "dc_id")
    private Document document;

    private String title;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "e_id")
    private Employee writer;

    private String contents;
    private LocalDate startDate;
    private LocalDate endDate;

    @OneToMany(mappedBy = "auth", cascade = CascadeType.ALL)
    private List<ElecLine> elecLine = new ArrayList<>();

    private ElecStatus status;

    public static ElecAuth createElecAuth(ElecAuthDto elecAuthDto) {

        ElecAuth auth = new ElecAuth();
        auth.setTitle(elecAuthDto.getTitle());
        auth.setContents(elecAuthDto.getContents());
        auth.setStartDate(elecAuthDto.getStartDate());
        auth.setEndDate(elecAuthDto.getEndDate());
        auth.setStatus(ElecStatus.UNSIGNED);

        return auth;
    }


}
