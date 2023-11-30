package com.kh.muze.bookmark.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @NoArgsConstructor
public class Bookmark {
	
	private int userNo;        // USER_NO	NUMBER
	private String musId;      // MUS_ID	VARCHAR2(1000 BYTE)
	private Date bookmarkDate; // BOOKMARK_DATE	DATE

}
