package com.groupware.tetris.repository;

import com.groupware.tetris.constant.ElecStatus;
import com.groupware.tetris.entity.elecauth.ElecAuth;
import com.groupware.tetris.entity.project.BoardAttach;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ElecAuthRepository extends JpaRepository<ElecAuth, Long> {

    @Query(value = "select distinct e.* from elecauth e join elecline l on e.el_id = l.el_id where e.el_id in " +
                    "(select l.el_id from " +
                    "(select el_id, status, lag(status, 1) over (partition by el_id order by sequence asc) beforestatus, sequence, e_id from elecline) l " +
                    "where (l.beforestatus = 2 or l.beforestatus is null) and l.status = 0 and l.e_id = :employeeId)", nativeQuery = true)
    List<ElecAuth> findUncheckedElecAuthList(@Param("employeeId") Long employeeId);

    List<ElecAuth> findElecAuthsByWriter_IdAndStatusIsNot(Long employeeId, ElecStatus status);

    List<ElecAuth> findElecAuthsByWriter_IdAndStatusIs(Long employeeId, ElecStatus status);

}
