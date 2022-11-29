package com.groupware.tetris.entity.chat;

import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
public class ChatParticipant {

    @Id
    @Column(name = "cp_num")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cr_id")
    private ChatRoom chatRoom;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "e_id")
    private Employee employee;

    @Column(name = "cp_read")
    private String read;

    @Column(name = "cp_isbookmark")
    private String bookmark;

    public void updateFavor(){
        if(this.bookmark.equals("false")){
            this.bookmark = "true";
        }else{
            this.bookmark = "false";
        }
    }

}
