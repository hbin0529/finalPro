<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

  /* -------------------------판매자페이지 판매상품 스타일모음------------------------- */
    .order_count{width: 950px; margin: 0 auto; display: flex; margin-top: 30px; font-weight: bolder; font-size: 18px; margin-bottom: 50px;}
    .order_count div:nth-child(1){font-family: 'GmarketSansMedium';}
    .order_count div:nth-child(2){font-family: 'GmarketSansMedium'; color: #21d9cb; margin-left: 5px;}
    .sellerpage_main_body{padding-top: 20px; width: 950px; margin: 0 auto;}
    .order_list_paging{width: 950px; margin: 0 auto; text-align: center; margin-top: 60px; margin-bottom: 60px;}

</style>
<link href="${pageContext.request.contextPath}/resources/css/homeboard.css" rel="stylesheet" type="text/css"> 
<body>

<jsp:include page="../common/header.jsp" /> 
<jsp:include page="../common/myPageHeader.jsp" />  


       <section class="sellerpage_main_body">      
        <div class="order_list">
            <div class="order_list_detail"> 
                <div class="detail_top">
                    <div>주문일자 2022.01.06</div>
                    <p class="buy_over">구매완료</p>
                    
                </div>
                <div class="detail_body">
                    <div><img src="./img/detail_content_buy_img02.jpeg"></div>
                    <div class="detail_body_category">
                        <div>카테고리 | 쇼파</div>
                        <div>상품이름 상품이름 상품이름</div>
                    </div>
                    <div class="detail_body_option">
                        <div>옵션 | 블랙</div>
                        <div>10,000원 | 1개</div>
                    </div>
                    <div class="detail_body_button">
                        <div><button>리뷰작성</button></div>
                    </div>
                </div>
                <div class="detail_bottom">
                    <div>판매자 | 한샘샘</div>
                    <div>판매자 연락처 | 010-7925-7631</div>
                </div>

                <div class="detail_top">
                    <div>주문일자 2022.01.06</div>
                    <p class="buy_over">구매완료</p>
                </div>
                <div class="detail_body">
                    <div><img src="./img/detail_content_buy_img01.jpeg"></div>
                    <div class="detail_body_category">
                        <div>카테고리 | 식탁</div>
                        <div>상품이름 상품이름 상품이름</div>
                    </div>
                    <div class="detail_body_option">
                        <div>옵션 | 블랙</div>
                        <div>10,000원 | 1개</div>
                    </div>
                    <div class="detail_body_button">
                        <div><button>구매확정</button></div>
                        <div><button style="color: #21d9cb; background-color: #fff;">주문취소</button></div>
                    </div>
                </div>
                <div class="detail_bottom">
                    <div>판매자 | 한샘샘</div>
                    <div>판매자 연락처 | 010-7925-7631</div>
                </div>


                <div class="detail_top">
                    <div>주문일자 2022.01.06</div>
                    <p class="buy_back">구매철회</p>
                </div>
                <div class="detail_body">
                    <div><img src="./img/detail_content_buy_img03.jpeg"></div>
                    <div class="detail_body_category">
                        <div>카테고리 | 식탁</div>
                        <div>상품이름 상품이름 상품이름</div>
                    </div>
                    <div class="detail_body_option">
                        <div>옵션 | 블랙</div>
                        <div>10,000원 | 1개</div>
                    </div>
                    <div class="detail_body_button">
                        <div><button style="display: none;">판매확정</button></div>
                        <div><button style="display: none;">주문취소</button></div>
                    </div>
                </div>
                <div class="detail_bottom">
                    <div>판매자 | 한샘샘</div>
                    <div>판매자 연락처 | 010-7925-7631</div>
                </div>


            </div>
        </div> 
    </section>
    
    
<jsp:include page="../common/footer.jsp"/>   
    
         

</body>
</html>