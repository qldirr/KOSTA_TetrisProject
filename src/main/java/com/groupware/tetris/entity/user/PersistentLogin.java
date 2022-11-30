package com.groupware.tetris.entity.user;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.parameters.P;
import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
@Entity
@Getter
@Table(name = "persistent_logins")
public class PersistentLogin implements Serializable {

    @Id
    private String series;

    private String username;

    private String token;

    private Date lastUsed;

    protected PersistentLogin(){

    }

    private PersistentLogin(final PersistentRememberMeToken token){
        this.series = token.getSeries();
        this.username = token.getUsername();
        this.token = token.getTokenValue();
        this.lastUsed =token.getDate();
    }

    public static  PersistentLogin from(final PersistentRememberMeToken token){

        return  new PersistentLogin(token);
    }
    public void updateToken(final String tokenValue, final Date lastUsed){
        this.token =tokenValue;
        this.lastUsed = lastUsed;
    }
}
