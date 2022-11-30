package com.groupware.tetris.repository;

import com.groupware.tetris.entity.attendance.Hr;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HrRepository extends JpaRepository<Hr, Long> {

    //
    Hr findHrByEid(Long e_id);
    List<Hr> findHrsByEid(Long e_id);
}
