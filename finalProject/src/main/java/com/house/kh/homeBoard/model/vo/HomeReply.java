package com.house.kh.homeBoard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString 
public class HomeReply {
	private int homeReplyNo;
	private int refBno;
	private String memId;
	private String homeReplyContent;
	private String homeReplyDate;
	private int homeReplyLike; 
	private String status;
	private String memEmail;
	private String memNick;
}
