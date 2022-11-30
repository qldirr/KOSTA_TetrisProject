package com.groupware.tetris.dto.project;

import com.groupware.tetris.entity.user.Employee;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter @Setter
public class MemberFormDto {

    private Long managerId;
    private List<Long> memberIds = new ArrayList<>();

}
