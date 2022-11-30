package com.groupware.tetris.entity.elecauth;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name="document")
@Getter
@Setter
@ToString
public class Document {

    @Id
    @Column(name = "dc_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String type;

}
