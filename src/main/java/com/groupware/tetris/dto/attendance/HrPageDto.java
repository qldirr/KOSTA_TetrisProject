package com.groupware.tetris.dto.attendance;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

@Getter @Setter @ToString
public class HrPageDto {

    private int startPage;
    private int endPage;
    private boolean prev, next;

    private int total;
    private Pageable pageable;

    public HrPageDto(Pageable pageable, int total){

        this.pageable = pageable;
        this.total = total;
        this.endPage = (int) (Math.ceil(pageable.getPageNumber() / 10.0)) * 10;

        this.startPage = this.endPage - 9;

        int realEnd = (int) (Math.ceil((total * 1.0) / pageable.getPageSize()));

        if (realEnd <= this.endPage) {
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;

        this.next = this.endPage < realEnd;
    }
}
