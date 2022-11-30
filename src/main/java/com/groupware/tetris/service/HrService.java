package com.groupware.tetris.service;

import com.groupware.tetris.constant.Hr_status;
import com.groupware.tetris.dto.attendance.HrDto;
import com.groupware.tetris.dto.attendance.HrDto2;
import com.groupware.tetris.dto.attendance.HrFormDto;
import com.groupware.tetris.dto.attendance.VacDto;
import com.groupware.tetris.entity.attendance.Hr;
import com.groupware.tetris.repository.HrRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class HrService {

    private final HrRepository hrRepository;

    @Transactional(readOnly = true)
    public Hr getHr(Long e_id)throws Exception{

        Hr hr = hrRepository.findHrByEid(e_id);
        return hr;
    }

    //출석
    public Long startDate(HrDto hrDto)throws Exception{
        Long e_id = hrDto.getE_id();
        Hr hr = hrRepository.getHrByEid(e_id);

        Hr hr2 = Hr.createHr(hrDto);
        hrRepository.save(hr);
        return hr2.getEid();
    }

    //퇴근
    public Long endDate(HrDto hrDto)throws Exception{
        Long e_id = hrDto.getE_id();
        Hr hr = hrRepository.getHrByEid(e_id);

        hrRepository.save(hr);
        return hr.getEid();
    }

    //외근
    public Long outDate(HrDto hrDto)throws Exception{
        Long e_id = hrDto.getE_id();
        Hr hr = hrRepository.getHrByEid(e_id);

        hr.setHr_status(Hr_status.외근);
        hrRepository.save(hr);
        return hr.getEid();
    }

    //팀근태정보 불러오기
    @Transactional(readOnly = true)
    public List<Hr> getHrList(Long e_id){
        List<Hr> hrList = hrRepository.findHrsByEid(e_id);

        return hrList;
    }

    //
    public List<HrDto> getHrWithPaging(Pageable pageable){
        return null;
    };

    public int getTotal(Pageable pageable){

        return 0;
    }

    public List<HrDto> getPersonal(Long e_id){

        return null;
    }

    public HrDto2 getAttendance(Long e_id){

        return null;
    }

    public List<VacDto> getVac(Long e_id){
        return null;
    }

    public HrDto2 getHrVA(Long e_id){
        return null;
    };

    @Transactional
    public Page<Hr> HrList(Pageable pageable){
        return hrRepository.findAll(pageable);
    }

//    public void findAll(Pageable pageable){
//        hrRepository.findHrsByIdOrderByIdDesc(createUser(), pageable).stream().map(PageDTO::from);
//    }

}
