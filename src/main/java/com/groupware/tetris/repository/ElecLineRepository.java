package com.groupware.tetris.repository;

import com.groupware.tetris.constant.LineStatus;
import com.groupware.tetris.entity.elecauth.ElecAuth;
import com.groupware.tetris.entity.elecauth.ElecLine;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ElecLineRepository  extends JpaRepository<ElecLine, Long> {

    List<ElecLine> findElecLinesByAuth_Id(Long authId);
    ElecLine findElecLineByAuth_IdAndApprover_Id(Long authId, Long approverId);

    int countElecLinesByAuth_IdAndStatus(Long authId, LineStatus status);

}
