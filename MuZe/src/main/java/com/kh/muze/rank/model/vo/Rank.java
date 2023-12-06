package com.kh.muze.rank.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class Rank {
	
	private int userNo;
	private int rowNum;
	private String rankCategory;
	private int ranking;          //RANKING
	private String musId;         //MUS_ID,
    private String musTitle;      //MUS_TITLE,
    private String startDate;     //START_DATE,
    private String endDate;       //END_DATE,
    private String poster;        //POSTER,
    private String showStatus;    //STATUS,
    private String theatherName;  //THEATHER_NAME
    private String genre;         //GENRE
    private int count;
}
