package com.groupware.tetris.repository;

import com.groupware.tetris.entity.chat.ChatRoom;
import com.groupware.tetris.entity.chat.QChatParticipant;
import com.groupware.tetris.entity.chat.QChatRoom;
import com.querydsl.core.QueryResults;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;

import javax.persistence.EntityManager;
import java.util.List;

@RequiredArgsConstructor
public class ChatRoomRepositoryCustomImpl implements ChatRoomRepositoryCustom{

    private final JPAQueryFactory queryFactory;

    public ChatRoomRepositoryCustomImpl(EntityManager em){
        this.queryFactory = new JPAQueryFactory(em);
    }

    @Override
    public List<ChatRoom> findCRoomListByEmployeeId(String employeeId) {
        QChatRoom qChatRoom = QChatRoom.chatRoom;
        QChatParticipant qChatParticipant = QChatParticipant.chatParticipant;

        QueryResults<ChatRoom> results = queryFactory.selectFrom(qChatRoom)
                .join(qChatParticipant.chatRoom, qChatRoom)
                .fetchJoin()
                .where(qChatParticipant.chatRoom.id.eq(qChatRoom.id))
                .fetchResults();
        List<ChatRoom> chatRoomList = results.getResults();

        return chatRoomList;
    }

}
