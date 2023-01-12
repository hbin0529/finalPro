package com.house.kh.charge.model.vo;

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
public class Charge {
	
	// 충전이력번호, 충전이메일(아이디), 충전금액, 충전날짜, 충전처리상태
	private int chargeNo;
	private String chargeEmail;
	private int chargeAmount;
	private Date chargeDate;
	private String chargeStatus; 
}
