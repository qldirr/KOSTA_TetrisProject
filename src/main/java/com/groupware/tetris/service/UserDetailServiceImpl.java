package com.groupware.tetris.service;

import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.EmployeeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class UserDetailServiceImpl implements UserDetailsService {

    private final EmployeeRepository employeeRepository;
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Employee employee = employeeRepository.findByEmail(email);

        if(employee == null){
            throw new UsernameNotFoundException(email);
        }

        return User.builder().username(employee.getEmail()).password(employee.getPassword()).roles(employee.getRole().toString()).build();
    }
}
