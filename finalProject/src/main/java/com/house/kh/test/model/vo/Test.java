package com.house.kh.test.model.vo;

import com.house.kh.seller.model.vo.Seller;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
public class Test {
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
	
	//리뷰테이블
	private int reviewNo;
	private int ordNo;
	private String memEmail;
	private String reviewImgOrigin;
	private String reviewImgChange;
	private String reviewContent;
	private String reviewDate;
	private String reviewStar;
	private String memNick;
	private String ordOption;
	
	// 문의테이블
	private int proQueNo;
	private String memId;
	private String proQueType;
	private String proQueContent;
	private String proQueResult;
	private String proQueDate;
	private String proQueIspublic;
	
	// 답변테이블
	private int queReplyNo;
	private String queReplyContent;
	private String queReplyDate;
	private String pqrStatus;
}


