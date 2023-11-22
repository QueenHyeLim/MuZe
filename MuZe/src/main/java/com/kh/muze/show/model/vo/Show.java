package com.kh.muze.show.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Show {
	
	private String fcltynm; // 시설명
	private String mt10id; // 시설 ID
	private String mt13cnt; // 공연장 수
	private String sidonm; // 지역(시도)
	private String gugunnm; // 지역(구군)
	private String opende; // 개관연도
}
