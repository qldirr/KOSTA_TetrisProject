package com.groupware.tetris.repository;

import com.groupware.tetris.entity.chat.ChatRoom;
import com.groupware.tetris.entity.chat.QChatParticipant;
import com.groupware.tetris.entity.chat.QChatRoom;
import com.querydsl.core.QueryResults;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;

import javax.persistence.EntityManager;
import java.util.List;

public class ChatRoomRepositoryCustomImpl implements ChatRoomRepositoryCustom{

    private JPAQueryFactory queryFactory;

    public ChatRoomRepositoryCustomImpl(EntityManager em){
        this.queryFactory = new JPAQueryFactory(em);
    }

    @Override
    public List<ChatRoom> findCRoomListByEmployeeId(Long empId) {
        QChatRoom qChatRoom = QChatRoom.chatRoom;
        QChatParticipant qChatParticipant = QChatParticipant.chatParticipant;

        QueryResults<ChatRoom> results = queryFactory.selectFrom(qChatRoom)
                .join(qChatParticipant.chatRoom, qChatRoom)
                .fetchJoin()
                .where(qChatParticipant.employee.id.eq(empId))
                .fetchResults();
        List<ChatRoom> chatRoomList = results.getResults();

        return chatRoomList;
    }

}
