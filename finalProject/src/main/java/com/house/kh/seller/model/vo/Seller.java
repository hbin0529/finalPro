package com.house.kh.seller.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class Seller {
	
	
	private int selNo;
	private String selEmailF;
	private String selEmailS;
	private String selEmail;
	private String selPwd;
	private String selName;
	private String selBusName;
	private String selPhone;
	private String selBusNo;
	private int selZipcode;
	private String selAddr;
	private String selDetailAddr;
	private int memPermit;
	private int selPoint;
	private String selStatus;
	private String selInter;
	private String selInterIntroduce;
	
	//사라짐?
	
}
