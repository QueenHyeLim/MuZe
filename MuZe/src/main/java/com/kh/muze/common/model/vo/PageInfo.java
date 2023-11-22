package com.kh.muze.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PageInfo {
	
	private int listCount;
	private int currentPage;
	private int boardLimit;
	private int pateLimit;
	
	private int maxPage;
	private int startPage;
	private int endPage;
}