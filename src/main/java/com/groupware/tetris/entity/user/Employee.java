package com.groupware.tetris.entity.user;

import com.groupware.tetris.constant.Role;
import com.groupware.tetris.dto.user.DepartmentDto;
import com.groupware.tetris.dto.user.EmployeeFormDto;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.persistence.*;
import javax.validation.constraints.Null;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Setter
@Getter
@ToString
@Entity
@Table(name = "employee")

public class Employee {
    @Id
    @Column(name = "e_id")
    @GeneratedValue(strategy =GenerationType.AUTO)
    private Long id;
    private String name;
    @Column(unique = true)
    private String email;
    private String password;
    private String phoneNumber;
    private LocalDateTime hireddate;
    private LocalDateTime resigndate;
    private Integer totalVac;
    private Integer useVac;
    private String birth;
    private String position;
    private boolean Enabled;
        /*private Long d_Id;*/
    @Enumerated(EnumType.STRING)
    private Role role;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "d_id")
    private Department department;

    public static Employee createEmployee(EmployeeFormDto employeeFormDto, DepartmentDto departmentDto, PasswordEncoder passwordEncoder){
        Employee employee = new Employee();
        employee.setName(employeeFormDto.getName());
        employee.setEmail(employeeFormDto.getEmail());
        employee.setPassword(employeeFormDto.getPassword());
        employee.setPhoneNumber(employeeFormDto.getPhoneNumber());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        employee.setHireddate(LocalDateTime.parse(employeeFormDto.getHireddate(),formatter));
        employee.setResigndate(LocalDateTime.parse(employeeFormDto.getResigndate(),formatter));
        employee.setBirth(employeeFormDto.getBirth());
        //employee.setD_Id(departmentDto.getId());
        employee.setRole(Role.ADMIN);
        return employee;
    }
}
