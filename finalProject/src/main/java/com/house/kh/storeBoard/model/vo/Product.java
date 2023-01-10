package com.house.kh.storeBoard.model.vo;

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

public class Product {
	private int proNo;
	private int selNo;
	private int cateNo;
	private int proWhiteStock;
	private int proBlackStock;
	private String proName;
	private int proPrice;
	private String proUpDate;
	private String proOriginImg;
	private String proChangeImg;
	private String proOriginDetailImg;
	private String proChangeDetailImg;
	private String status;
	
}


