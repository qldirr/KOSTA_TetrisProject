package com.groupware.tetris.repository.attendance;

import com.groupware.tetris.entity.attendance.Hr;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HrRepository extends JpaRepository<Hr, Long> {

    //
    Hr findHrById(Long e_id);
    List<Hr> findHrsByIdOrderByIdDesc(Long e_id);
}
