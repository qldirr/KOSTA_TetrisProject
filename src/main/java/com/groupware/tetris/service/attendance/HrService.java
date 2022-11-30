package com.groupware.tetris.service.attendance;

import com.groupware.tetris.repository.attendance.HrRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class HrService {

    private final HrRepository hrRepository;




}
