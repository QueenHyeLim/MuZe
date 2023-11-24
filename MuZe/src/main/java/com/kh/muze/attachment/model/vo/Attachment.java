package com.kh.muze.attachment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @ToString
public class Attachment {

	private int attNo;            // ATT_NO	NUMBER
	private int contentNo;        // CONTENT_NO	NUMBER
	private String originName;    //ORIGIN_NAME	VARCHAR2(1000 BYTE)
	private String modifiedName;  // MODIFIED_NAME	VARCHAR2(1000 BYTE)
	private int attLevel;         // ATT_LEVEL	NUMBER
	private int attCategoryNo;    //ATT_CATEGORY_NO	NUMBER
}
