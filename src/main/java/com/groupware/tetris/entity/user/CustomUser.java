package com.groupware.tetris.entity.user;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

@Getter
public class CustomUser extends User {
    private static final long serialVersionUID = 1L;

    private Employee employee;

    //    public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
//        super(username, password, authorities);
//    }
    public CustomUser(Employee employee){
        super(employee.getEmail(),employee.getPassword(), AuthorityUtils.createAuthorityList(employee.getRole().toString()));
        this.employee =employee;
    }


//    public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
//        super(username, password, authorities);
//    }
//
//    public CustomUser(Employee em) {
//        super(em.getEmail(), em.getPassword(),);
//    }
}