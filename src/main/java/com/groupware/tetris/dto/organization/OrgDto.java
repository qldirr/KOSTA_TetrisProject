package com.groupware.tetris.dto.organization;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrgDto {
    private Long e_id;
    private String name;
    private String email;
    private String phonenumber;
    private String birth;
    private String position;
    private String d_name;

    public OrgDto(Long e_id, String name, String email, String phonenumber, String birth, String position, String d_name) {
        this.e_id = e_id;
        this.name = name;
        this.email = email;
        this.phonenumber = phonenumber;
        this.birth = birth;
        this.position = position;
        this.d_name = d_name;
    }
}
