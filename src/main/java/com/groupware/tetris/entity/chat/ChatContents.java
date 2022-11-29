package com.groupware.tetris.entity.chat;

import com.groupware.tetris.dto.chat.ChatContentsDto;
import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
public class ChatContents {

    @Id
    @Column(name = "cc_num")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "e_id")
    private Employee employee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cr_id")
    private ChatRoom chatRoom;

    @Column(name = "cc_sender")
    private String sender;

    @Column(name = "cc_uuid")
    private String uuid;

    @Column(name = "cc_contents")
    private String contents;

    @Column(name = "cc_size")
    private Long size;

    @Column(name = "cc_regdate")
    private LocalDateTime regdate;

    @Column(name = "cc_read")
    private String read;

    @Column(name = "cc_image")
    private String image;

    @Column(name = "cc_path")
    private String path;

    @Column(name = "cc_file")
    private String file;

    public static ChatContents createChatContents(ChatContentsDto chatContentsDto, Employee employee, ChatRoom chatRoom){
        ChatContents chatContents = new ChatContents();
        chatContents.setContents(chatContentsDto.getMessage());
        chatContents.setChatRoom(chatRoom);
        chatContents.setFile(chatContentsDto.getFile());
        chatContents.setImage(chatContentsDto.getImage());
        chatContents.setPath(chatContentsDto.getPath());
        chatContents.setRead(chatContentsDto.getRead());
        chatContents.setSize(chatContentsDto.getSize());
        chatContents.setRegdate(LocalDateTime.now());
        chatContents.setUuid(chatContentsDto.getUuid());
        chatContents.setSender(chatContentsDto.getSenderName());
        chatContents.setEmployee(employee);

        return chatContents;
    }

}
