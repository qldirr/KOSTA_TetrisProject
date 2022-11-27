package com.groupware.tetris.repository;

import com.groupware.tetris.entity.project.*;
import com.groupware.tetris.entity.user.QEmployee;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;

import javax.persistence.EntityManager;
import java.util.List;

public class BoardReplyRepositoryCustomImpl implements BoardReplyRepositoryCustom{

    private JPAQueryFactory queryFactory;

    public BoardReplyRepositoryCustomImpl(EntityManager em) {
        this.queryFactory = new JPAQueryFactory(em);
    }

    @Override
    public List<BoardReply> getTotalBoardReply(Long projectId) {

        QProject qProject = QProject.project;
        QProjectBoard qProjectBoard = QProjectBoard.projectBoard;
        QBoardReply qBoardReply = QBoardReply.boardReply;

        JPAQuery<BoardReply> query = queryFactory.selectFrom(qBoardReply).join(qProjectBoard)
                .on(qBoardReply.projectBoard.id.eq(qProjectBoard.id))
                .where(qProjectBoard.project.id.eq(projectId)).orderBy(qBoardReply.id.desc());

        List<BoardReply> replies = query.fetch();

        return replies;
    }
}
