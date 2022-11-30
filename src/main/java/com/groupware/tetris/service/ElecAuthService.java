package com.groupware.tetris.service;

import com.groupware.tetris.constant.ElecStatus;
import com.groupware.tetris.constant.LineStatus;
import com.groupware.tetris.dto.elecauth.ElecAuthDto;
import com.groupware.tetris.dto.elecauth.ElecLineDto;
import com.groupware.tetris.entity.elecauth.Document;
import com.groupware.tetris.entity.elecauth.ElecAuth;
import com.groupware.tetris.entity.elecauth.ElecLine;
import com.groupware.tetris.entity.project.BoardAttach;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.DocumentRepository;
import com.groupware.tetris.repository.ElecAuthRepository;
import com.groupware.tetris.repository.ElecLineRepository;
import com.groupware.tetris.repository.EmployeeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import javax.security.auth.message.AuthStatus;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
@RequiredArgsConstructor
public class ElecAuthService {

    private final ElecAuthRepository authRepository;

    private final ElecLineRepository lineRepository;

    private final EmployeeRepository employeeRepository;

    private final DocumentRepository documentRepository;


    public Long saveElecAuth(ElecAuthDto elecAuthDto){

        ElecAuth auth = ElecAuth.createElecAuth(elecAuthDto);
        Employee writer = employeeRepository.getEmployeeById(2L);
        auth.setWriter(writer);
        Document document = documentRepository.findById(elecAuthDto.getDoc_id())
                .orElseThrow(EntityNotFoundException::new);
        auth.setDocument(document);

        authRepository.save(auth);
        List<Employee> employees = elecAuthDto.getLineIds().stream()
                .map(id -> employeeRepository.findById(id).orElseThrow(EntityNotFoundException::new))
                .collect(Collectors.toList());

        ElecLineDto lineDto = new ElecLineDto();
        lineDto.setStatus(LineStatus.UNSIGNED);

        for (int i = 0; i < employees.size(); i++) {

            ElecLine line = ElecLine.createElecLine(lineDto);
            line.setAuth(auth);
            line.setApprover(employees.get(i));
            line.setSequence(Long.valueOf(i + 1));
            lineRepository.save(line);

        }

        return auth.getId();
    }

    public ElecAuthDto readElecAuth(Long authId){

        ElecAuth auth = authRepository.findById(authId)
                .orElseThrow(EntityNotFoundException::new);
        List<ElecLineDto> elecLineDtos = auth.getElecLine().stream().map(line -> ElecLineDto.toDto(line))
                .collect(Collectors.toList());

        ElecAuthDto elecAuthDto = ElecAuthDto.toDto(auth, elecLineDtos);

        return elecAuthDto;
    }

    public List<ElecAuthDto> getListUncheckedElecAuths(Long employeeId) {

        List<ElecAuth> auths = authRepository.findUncheckedElecAuthList(employeeId);
        List<ElecAuthDto> authDtos = new ArrayList<>();

        for (ElecAuth auth : auths) {

            Long authId = auth.getId();
            List<ElecLineDto> lineDtos
                    = lineRepository.findElecLinesByAuth_Id(authId).stream().map(line -> ElecLineDto.toDto(line))
                    .collect(Collectors.toList());

            ElecAuthDto authDto = ElecAuthDto.toDto(auth, lineDtos);
            authDtos.add(authDto);

        }

        return authDtos;
    }


    public List<ElecAuthDto> getListElecAuths(Long employeeId, ElecStatus status) {


        List<ElecAuth> auths = (status.equals(ElecStatus.DONE))?
                authRepository.findElecAuthsByWriter_IdAndStatusIsNot(employeeId, ElecStatus.DONE):
                authRepository.findElecAuthsByWriter_IdAndStatusIs(employeeId, ElecStatus.DISAPPROVED);

        List<ElecAuthDto> authDtos = new ArrayList<>();

        for (ElecAuth auth : auths) {

            Long authId = auth.getId();
            List<ElecLineDto> lineDtos
                    = lineRepository.findElecLinesByAuth_Id(authId).stream().map(line -> ElecLineDto.toDto(line))
                    .collect(Collectors.toList());

            ElecAuthDto authDto = ElecAuthDto.toDto(auth, lineDtos);
            authDtos.add(authDto);

        }

        return authDtos;
    }


    public int updateElecLineStatus(Long authId, ElecLineDto elecLineDto) {

        Long approverId = elecLineDto.getApproverId();
        LineStatus lineStatus = elecLineDto.getStatus();
        ElecLine line = lineRepository.findElecLineByAuth_IdAndApprover_Id(authId, approverId);
        ElecAuth auth = authRepository.findById(authId).orElseThrow(EntityNotFoundException::new);

        if (line != null) {
            line.updateElecLineStatus(lineStatus);

            if(lineStatus.equals(LineStatus.DISAPPROVED)){
                auth.updateElecAuthStatus(ElecStatus.DISAPPROVED);
            } else {
                int count = lineRepository.countElecLinesByAuth_IdAndStatus(authId, LineStatus.UNSIGNED);

                switch(count){
                    case 0:
                        auth.updateElecAuthStatus(ElecStatus.DONE);
                        break;

                    default:
                        auth.updateElecAuthStatus(ElecStatus.ONGOING);
                }
            }

            return 1;
        }

        return 0;
    }

    public int updateElecAuth(ElecAuthDto elecAuthDto) {

        Long authId = elecAuthDto.getId();
        ElecAuth auth = authRepository.findById(authId).orElseThrow(EntityNotFoundException::new);
        auth.updateElecAuth(elecAuthDto);

        for (ElecLine line : auth.getElecLine()) {
            line.resetElecLine();
        }

        return 1;

    }

}
