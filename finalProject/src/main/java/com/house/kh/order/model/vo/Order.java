package com.house.kh.order.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Order {

	// 주문번호
	private int orderNo;
	// 주문자 이메일(아이디)
	private String orderEmail;
	// 주문날짜 
	private Date orderDate;
	private String orderZipcode;
	private String orderAddr;
	private String orderDetailAddr;
	private String orderName;
	private int orderPhone;
	// 주문자 요청사항
	private int orderRequest;
	
}
