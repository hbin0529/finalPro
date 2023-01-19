package com.house.kh.cart.model.vo;

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
public class Cart {
	//카트
	private int cartNo;
	private String memEmail;
	private int cartAmount;
	private String cartOption;
	private String cartDate;
	private String cartStatus;
	
	//상품테이블
	private int proNo;
	private int selNo;
	private int cateNo;
	private String cateName;
	private int proWhiteStock;
	private int proBlackStock;
	private String proName;
	private int proPrice;
	private String proUpDate;
	private String proOriginImg;
	private String proChangeImg;
	private String proOriginImg1;
	private String proChangeImg1;
	private String proOriginDetailimg;
	private String proChangeDetailimg;
	private String status;
	private int proCount;
	
	//판매자테이블
	private String selBusName;
	private String selEmail;
	private String selName;
	private String selPhone;
	private String selAddr;
	private String selDetailAddr;
	private String selBusNo;

}
