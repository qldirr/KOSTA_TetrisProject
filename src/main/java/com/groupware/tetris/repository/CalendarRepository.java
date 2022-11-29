package com.groupware.tetris.repository;

import com.groupware.tetris.entity.calendar.Calendar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository

public interface CalendarRepository extends JpaRepository<Calendar,Long> {
    @Query(value = "select * from Calendar c where c.e_id=:id order by c.cl_num desc", nativeQuery = true)
    List<Calendar> findByeid(@Param("id") Long id);

    @Modifying
    @Transactional
    @Query(value = "delete from Calendar c where c.employee.id=:e_id")
    void deleteByeid(@Param("e_id") Long e_id);
}
