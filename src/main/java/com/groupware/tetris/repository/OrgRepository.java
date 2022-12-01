package com.groupware.tetris.repository;

import com.groupware.tetris.entity.user.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrgRepository extends JpaRepository<Employee,Long> {
    @Query("select e.id,e.name,e.email,e.phoneNumber,e.birth,e.position,d.name from Employee e join Department d " +
    " on e.department.id = d.id order by e.id desc ")
    List<Employee> findBydid();

    @Query("select e.id,e.name,e.email,e.phoneNumber,e.birth,e.position,d.name from Employee e join Department d " +
            " on e.department.id = d.id where e.position like %:position% order by e.id desc ")
    List<Employee> searchByPosition(@Param("position") String position);
}
