package com.groupware.tetris.service.attendance;

import com.groupware.tetris.dto.attendance.HrDto;
import com.groupware.tetris.entity.attendance.Hr;
import com.groupware.tetris.repository.attendance.HrRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class HrService {

    private HrRepository hrRepository;

    //출석
    public Long insertAction(HrDto hrDto)throws Exception{


        return null;
    }

    //퇴근


    //외근

    //팀근태정보 불러오기
    public List<HrDto> getHrList(Long e_id){

        //HrDto hrDto =
        return null;
    }

    //
    public HrDto getHr(Long e_id){

        return null;
    }

}
