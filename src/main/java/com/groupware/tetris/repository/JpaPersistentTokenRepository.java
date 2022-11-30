package com.groupware.tetris.repository;

import com.groupware.tetris.entity.user.PersistentLogin;
import lombok.RequiredArgsConstructor;
import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import java.util.Date;

public class JpaPersistentTokenRepository implements PersistentTokenRepository {

    private final PersistentLoginRepository repository;

    public JpaPersistentTokenRepository(final PersistentLoginRepository repository) {
        this.repository = repository;
    }

    @Override
    public void createNewToken(PersistentRememberMeToken token) {
        repository.save(PersistentLogin.from(token));
    }

    @Override
    public void updateToken(final String series,final String tokenValue,final Date lastUsed) {
        repository.findBySeries(series).ifPresent(persistentLogin -> {
            persistentLogin.updateToken(tokenValue, lastUsed);
            repository.save(persistentLogin);
        });
    }

    @Override
    public PersistentRememberMeToken getTokenForSeries(String seriesId) {


        return repository.findBySeries(seriesId)
                .map(persistentLogin-> new PersistentRememberMeToken(
                        persistentLogin.getUsername(),
                        persistentLogin.getSeries(),
                        persistentLogin.getToken(),
                        persistentLogin.getLastUsed()))
                .orElseThrow(IllegalAccessError::new);
    }

    @Override
    public void removeUserTokens(final String username) {
        repository.deleteAllInBatch(repository.findByUsername(username));
    }
}
