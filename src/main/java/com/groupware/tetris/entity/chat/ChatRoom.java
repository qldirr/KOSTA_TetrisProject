package com.groupware.tetris.entity.chat;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
public class ChatRoom {

    @Id
    @Column(name = "cr_id")
    private String id;

    @Column(name = "cr_title")
    private String title;

}
