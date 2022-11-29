package com.groupware.tetris.repository;

import com.groupware.tetris.entity.chat.ChatContents;
import com.groupware.tetris.entity.chat.QChatContents;
import com.querydsl.core.QueryResults;
import com.querydsl.jpa.impl.JPAQueryFactory;

import javax.persistence.EntityManager;
import java.util.List;

public class ChatContentsRepositoryCustomImpl implements ChatContentsRepositoryCustom{

    private JPAQueryFactory queryFactory;

    public ChatContentsRepositoryCustomImpl(EntityManager em){
        this.queryFactory = new JPAQueryFactory(em);
    }

    @Override
    public List<ChatContents> findAllByRoomId(String roomId) {
        QChatContents qChatContents = QChatContents.chatContents;
        QueryResults<ChatContents> results = queryFactory.selectFrom(qChatContents)
                .where(qChatContents.chatRoom.id.eq(roomId))
                .orderBy(qChatContents.regdate.asc())
                .fetchResults();
        List<ChatContents> chatContentsList = results.getResults();

        return chatContentsList;
    }
}
