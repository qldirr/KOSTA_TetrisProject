package com.groupware.tetris.repository;

import com.groupware.tetris.entity.project.*;
import com.groupware.tetris.entity.user.QEmployee;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;

import javax.persistence.EntityManager;
import java.util.List;

public class BoardAttachRepositoryCustomImpl implements BoardAttachRepositoryCustom{

    private JPAQueryFactory queryFactory;

    public BoardAttachRepositoryCustomImpl(EntityManager em) {
        this.queryFactory = new JPAQueryFactory(em);
    }


    @Override
    public List<BoardAttach> getListTotalBoardAttaches(Long projectId) {

        QProject qProject = QProject.project;
        QProjectBoard qProjectBoard = QProjectBoard.projectBoard;
        QBoardAttach qBoardAttach = QBoardAttach.boardAttach;

        JPAQuery<BoardAttach> query = queryFactory.selectFrom(qBoardAttach).join(qProjectBoard)
                .on(qBoardAttach.projectBoard.id.eq(qProjectBoard.id))
                .where(qProjectBoard.project.id.eq(projectId));

        List<BoardAttach> attaches = query.fetch();

        return attaches;
    }
}
