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
	private int ordNo;
	// 주문자 이메일(아이디)
	private String ordEmail;
	// 주문날짜 
	private Date ordDate;
	// 우편번호
	private String ordZipcode;
	// 회원주소
	private String ordAddr;
	// 상세주소
	private String ordDetailAddr;
	// 수령자 이름
	private String cusName;
	// 수령자 전화번호
	private String cusPhone;
	// 주문자 요청사항
	private String ordRequest;
	
	
	// DB 테이블에 존재하지 않는 데이터
	// 주문 총 가격(상품 가격 * 주문수량)
	private int totalPrice;
	// 판매물품번호
	private int proNo;
	// 주문 수량
	private int ordCount;
	// 주문 가격 (하나당 가격)
	private int ordPrice;
	// 판매자 처리상태
	private String ordStatus;
	// 주문 옵션 블랙 / 화이트
	private String ordOption;
}
