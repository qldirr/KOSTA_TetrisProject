package com.groupware.tetris.entity.suggestions;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Data
@Table(name = "suggestions")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Suggestions {

    @Id
    @Column(name = "s_num")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long s_num;
    private String e_id;
    private String s_title;
    private String s_contents;
    private LocalDateTime regDate;
    private LocalDateTime modDate;
}