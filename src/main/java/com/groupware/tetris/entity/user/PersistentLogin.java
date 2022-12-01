package com.groupware.tetris.entity.user;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.parameters.P;
import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
@Entity
@Getter
@Setter
@Table(name = "persistent_logins")
public class PersistentLogin implements Serializable {

    @Id
    @Column(length = 64)
    private String series;

    @Column(nullable = false, length = 64)
    private String username;
    @Column(nullable = false, length = 64)
    private String token;
    @Column(name = "last_used",nullable = false, length = 64)
    private LocalDateTime lastused;


}
