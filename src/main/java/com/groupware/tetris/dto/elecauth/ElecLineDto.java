package com.groupware.tetris.dto.elecauth;

import com.groupware.tetris.constant.LineStatus;
import com.groupware.tetris.entity.elecauth.ElecAuth;
import com.groupware.tetris.entity.elecauth.ElecLine;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ElecLineDto {

    private Long id;
    private Long approverId;
    private String approver;
    private String approver_position;
    private String approver_dept_name;
    private Long seqeunce;
    private LineStatus status;

    public static ElecLineDto toDto(ElecLine line){

        ElecLineDto elecLineDtos = new ElecLineDto();

        elecLineDtos.setId(line.getId());
        elecLineDtos.setSeqeunce(line.getSequence());
        elecLineDtos.setApproverId(line.getApprover().getId());
        elecLineDtos.setApprover(line.getApprover().getName());
        elecLineDtos.setApprover_position(line.getApprover().getPosition());
        elecLineDtos.setApprover_dept_name(line.getApprover().getDepartment().getName());
        elecLineDtos.setStatus(line.getStatus());

        return elecLineDtos;

    }

}
