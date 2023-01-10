package com.house.kh.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class Member {
	
	//일반멤버임
	private String memEmail;
	private String memPwd;
	private String memName;
	private String memphone;
	private int memZipcode;
	private String memAddr;
	private String memDetailAddr;
	private String memGender;
	private int memPermit;
	private String memStatus;
	private String memImg;
	private int memPoint;
	private Date memEnrollDate;
	private Date memDeleteDate;
	private String memEmailF;
	private String memEmailS;
	private String memNick;
}
