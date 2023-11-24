package com.kh.muze.calendar.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @NoArgsConstructor
public class Schedule {	

	private int scheduleNo;    // SCHEDULE_NO	NUMBER
	private int userNo;        // USER_NO	NUMBER
	private String scDate;     // SC_DATE	VARCHAR2(50 BYTE)
	private String scTime;     // SC_TIME	DATE
	private String scTitle;    // SC_TITLE	VARCHAR2(100 BYTE)
	private Date scCreateDate; // SC_CREATE_DATE	DATE
	
}
