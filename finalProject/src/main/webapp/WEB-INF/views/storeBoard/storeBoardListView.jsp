<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* -----------------------------------메인바디 좌측 카테고리 스타일 모음----------------------------------- */
    .store_body{width: 1400px; margin: 0 auto; display: flex;}
    .store_body a{width: 10px;}
    .store_left_category ul li{list-style: none;  width: 150px; text-align: center; font-family: 'GmarketSansMedium'; margin-left: 80px;}
    .left_category{border-bottom: 1px solid rgb(190, 190, 190); font-weight: bolder; height: 70px; padding-top: 50px;}
    #left_category{height: 50px; padding-top: 25px; width: 150px;}
    #left_category a:hover{color:#21d9cb; border-bottom: 1px solid #dee2e6; } 

/* -----------------------------------메인바디 상품리스트 스타일모음----------------------------------- */
    .store_product_top{width: 1250px; } 
    .store_product_top table{ width: 1100px; padding-top: 70px; margin: 0 auto;}
    .store_product_top table tr td:nth-child(1){width: 30px; padding-left: 30px; font-size: 13px; padding-top: 5px; color: rgb(105, 105, 105);}
    .store_product_top table tr td:nth-child(2){font-size: 13px; padding-top: 5px; color: rgb(105, 105, 105);} 
    .store_product_top table tr td:nth-child(3){text-align: right; padding-right: 40px;}
    #product_list{border: 1px solid #dee2e6; width: 100px; padding: 5px; border-radius: 6%; color: rgb(105, 105, 105);} 
    .store_product{display: flex;}
    .store_product_list{ margin-top: 10px; padding-left: 85px;}
    .store_product_list img{width: 270px; height: 270px; margin-left: 15px; margin-top: 30px; border: 1px solid #dee2e6;}
    .store_product_card{width: 300px; height: 400px; margin-left: -20px; font-family: 'Pretendard-Regular';}
    .store_product_seller{margin-left: 25px; margin-top: 5px; font-size: 14px;}
    .store_product_title{margin-left: 25px;  font-size: 17px; font-weight: bold; margin-top: 3px;}
    .store_product_price{margin-left: 25px;  font-size: 20px; font-weight: bold; margin-top: 3px;}
</style>
<body>
	<jsp:include page="../common/header.jsp" />

    <section class="store_body">
        <div class="store_left_category">
            <ul>
                <li class="left_category">카테고리</li>
                <li id="left_category"><a href="" style="color: #21d9cb;">침대</a></li>
                <li id="left_category"><a href="">쇼파</a></li>
                <li id="left_category"><a href="">식탁</a></li>
                <li id="left_category"><a href="">의자</a></li>
                <li id="left_category"><a href="">책상</a></li>
                <li id="left_category"><a href="">옷장</a></li>
                <li id="left_category"><a href="">조명</a></li>
                <li id="left_category"><a href="">화장대</a></li>
            </ul>
        </div>
        <div class="store_product_top">
            <div>
                <table>
                    <tr>
                        <td>전체</td>
                        <td>${ listCount }개</td>
                        <td>
                            <select id="product_list">
                                <option>최신순</option>
                                <option>조회순</option>
                                <option>판매순</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="store_product">
            
            	<c:forEach var="p" items="${ list }">
	                <div class="store_product_list">
	                    <div class="store_product_card">
	                        <a href="">
	                        <div class="store_product_img"><img src="${path}/resources/img/product/${ p.proName }1.png"></div>
	                        <div class="store_product_seller"><p>${ p.selBusName }</p></div>
	                        <div class="store_product_title"><p>${ p.proName }</p></div>
	                        <div class="store_product_price"><p>${ p.proPrice }</p></div>
	                        </a>
	                    </div>
	                </div>
				</c:forEach>
				<!--  
                <div class="store_product_list">
                    <div class="store_product_card">
                        <a href="">
                        <div class="store_product_img"><img src="../FINAL/img/머스크템바보드소파테이블2.JPG"></div>
                        <div class="store_product_seller">판매처</p></div>
                        <div class="store_product_title"><p>가구이름 가구이름</p></div>
                        <div class="store_product_price"><p>10,000</p></div>
                        </a>
                    </div>
                </div>

                <div class="store_product_list">
                    <div class="store_product_card">
                        <a href="">
                        <div class="store_product_img"><img src="../FINAL/img/모딜리아니대리석골드4인식탁테이블1.JPG"></div>
                        <div class="store_product_seller">판매처</p></div>
                        <div class="store_product_title"><p>가구이름 가구이름</p></div>
                        <div class="store_product_price"><p>10,000</p></div>
                        </a>
                    </div>
                </div>
            </div>

            <div class="store_product">
                <div class="store_product_list">
                    <div class="store_product_card">
                        <a href="">
                        <div class="store_product_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                        <div class="store_product_seller">판매처</p></div>
                        <div class="store_product_title"><p>가구이름 가구이름</p></div>
                        <div class="store_product_price"><p>10,000</p></div>
                        </a>
                    </div>
                </div>

                <div class="store_product_list">
                    <div class="store_product_card">
                        <a href="">
                        <div class="store_product_img"><img src="../FINAL/img/머스크템바보드소파테이블2.JPG"></div>
                        <div class="store_product_seller">판매처</p></div>
                        <div class="store_product_title"><p>가구이름 가구이름</p></div>
                        <div class="store_product_price"><p>10,000</p></div>
                        </a>
                    </div>
                </div>

                <div class="store_product_list">
                    <div class="store_product_card">
                        <a href="">
                        <div class="store_product_img"><img src="../FINAL/img/모딜리아니대리석골드4인식탁테이블1.JPG"></div>
                        <div class="store_product_seller">판매처</p></div>
                        <div class="store_product_title"><p>가구이름 가구이름</p></div>
                        <div class="store_product_price"><p>10,000</p></div>
                        </a>
                    </div>
                </div>
            </div>

            <div class="store_product">
                <div class="store_product_list">
                    <div class="store_product_card">
                        <a href="">
                        <div class="store_product_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                        <div class="store_product_seller">판매처</p></div>
                        <div class="store_product_title"><p>가구이름 가구이름</p></div>
                        <div class="store_product_price"><p>10,000</p></div>
                        </a>
                    </div>
                </div>

                <div class="store_product_list">
                    <div class="store_product_card">
                        <a href="">
                        <div class="store_product_img"><img src="../FINAL/img/머스크템바보드소파테이블2.JPG"></div>
                        <div class="store_product_seller">판매처</p></div>
                        <div class="store_product_title"><p>가구이름 가구이름</p></div>
                        <div class="store_product_price"><p>10,000</p></div>
                        </a>
                    </div>
                </div>

                <div class="store_product_list">
                    <div class="store_product_card">
                        <a href="">
                        <div class="store_product_img"><img src="../FINAL/img/모딜리아니대리석골드4인식탁테이블1.JPG"></div>
                        <div class="store_product_seller">판매처</p></div>
                        <div class="store_product_title"><p>가구이름 가구이름</p></div>
                        <div class="store_product_price"><p>10,000</p></div>
                        </a>
                    </div>
                </div>
                -->
            </div>
            
            
            
            
    </section>
    
 	<jsp:include page="../common/footer.jsp" />
</body>
</html>