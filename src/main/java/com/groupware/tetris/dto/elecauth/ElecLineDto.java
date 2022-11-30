package com.groupware.tetris.dto.elecauth;

import com.groupware.tetris.constant.LineStatus;
import com.groupware.tetris.entity.elecauth.ElecLine;
import lombok.Getter;
import lombok.Setter;

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


}
