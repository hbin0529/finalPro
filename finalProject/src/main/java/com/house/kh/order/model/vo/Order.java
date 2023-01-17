package com.house.kh.order.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
public class Order {

	// 주문번호
	private int orderNo;
	// 주문자 이메일(아이디)
	private String orderEmail;
	// 주문날짜 
	private Date orderDate;
	// 우편번호
	private String orderZipcode;
	// 회원주소
	private String orderAddr;
	// 상세주소
	private String orderDetailAddr;
	// 수령자 이름
	private String cusName;
	// 수령자 전화번호
	private int cusPhone;
	// 주문자 요청사항
	private int orderRequest;
	
}
