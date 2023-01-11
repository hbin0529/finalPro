package com.house.kh.storeBoard.model.vo;

import com.house.kh.seller.model.vo.Seller;

import lombok.AllArgsConstructor;
import lombok.Data;
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
	private String proOriginDetailimg;
	private String proChangeDetailimg;
	private String status;
	private String selBusName;
}


