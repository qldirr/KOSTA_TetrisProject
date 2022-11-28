package com.groupware.tetris.entity.user;

import com.groupware.tetris.dto.user.DepartmentDto;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="department")
@Getter @Setter
@ToString
public class Department{
    @Id
    @Column(name = "d_id")
    @GeneratedValue(strategy =GenerationType.AUTO)
    private Long id;
    private String name;
    private String head;

    @OneToMany(mappedBy = "department", cascade = CascadeType.ALL,
            orphanRemoval = true,fetch = FetchType.LAZY)
    List<Employee> employees = new ArrayList<>();

    public static Department createDepartment(DepartmentDto departmentDto){
        Department department = new Department();
        department.setId(departmentDto.getId());
        department.setName(departmentDto.getName());
        department.setHead(departmentDto.getHead());
        return department;
    }
}
