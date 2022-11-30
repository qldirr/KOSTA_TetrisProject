package com.groupware.tetris.service;

import com.groupware.tetris.dto.elecauth.ElecAuthDto;
import com.groupware.tetris.entity.elecauth.ElecAuth;
import com.groupware.tetris.repository.ElecAuthRepository;
import com.groupware.tetris.repository.ElecLineRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class ElecAuthService {

    private final ElecAuthRepository authRepository;

    private final ElecLineRepository lineRepository;

    public Long saveElecAuth(ElecAuthDto elecAuthDto){

        ElecAuth auth = ElecAuth.createElecAuth(elecAuthDto);
        authRepository.save(auth);

        return auth.getId();
    }

}
