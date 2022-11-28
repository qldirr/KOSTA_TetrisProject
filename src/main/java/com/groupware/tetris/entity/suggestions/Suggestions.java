package com.groupware.tetris.entity.suggestions;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "suggestions")
@Getter
@Setter
@ToString
public class Suggestions {

    @Id
    @Column(name = "s_num")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long s_num;
    private String e_id;
    private String s_title;
    private String s_contents;
    private LocalDateTime regTime;
    private LocalDateTime updateTime;
}