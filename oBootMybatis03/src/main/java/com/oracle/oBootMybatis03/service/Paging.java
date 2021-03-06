package com.oracle.oBootMybatis03.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Paging {
	private int currentPage = 1;	private int rowPage   = 10;
	private int pageBlock = 10;		
	private int start;				private int end;
	private int startPage;			private int endPage;
	private int total;				private int totalPage;
    //                 140                12
	public Paging(int total, String currentPage1) {
		this.total = total;    // 140
		if (currentPage1 != null) {
			this.currentPage = Integer.parseInt(currentPage1);			
		}
		start = (currentPage - 1) * rowPage + 1; 				 // 시작시 1     11   111
		end   = start + rowPage - 1;              				// 시작시 10    20   120
		totalPage = (int) Math.ceil((double)total / rowPage);  	// 시작시 2  5  14
		            //    12          12 -> 11
		startPage = currentPage - (currentPage - 1) % pageBlock; // 시작시 1   11
		endPage = startPage + pageBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}

}
