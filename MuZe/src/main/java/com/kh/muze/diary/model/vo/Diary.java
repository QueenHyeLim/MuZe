package com.kh.muze.diary.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @NoArgsConstructor
public class Diary {
	
	private int userNo;           //USER_NO
	private int diaryNo;          //DIARY_NO
	private String diaryName;     //DIARY_NAME
	private String diaryTitle;    //DIARY_TITLE
	private String diaryContent;  //DIRAY_CONTENT
	private String diaryStatus;   //DIARY_YN
	private String attStatus;     //ATT_YN

}