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
    .store_product_top table tr td:nth-child(1){width: 30px; padding-left: 30px; font-size: 13px; padding-top: 5px; color: rgb(105, 105, 105); padding-left: 80px;}
    .store_product_top table tr td:nth-child(2){font-size: 13px; padding-top: 5px; color: rgb(105, 105, 105);} 
    .store_product_top table tr td:nth-child(3){text-align: right; padding-right: 40px;}
    #product_list{border: 1px solid #dee2e6; width: 100px; padding: 5px; border-radius: 6%; color: rgb(105, 105, 105);} 
    .store_product{display: flex; width:1000px; flex-wrap:wrap; padding-left:60px; padding-bottom:100px;}
    .store_product_list{ margin-top: 10px; margin-left: 50px; }
    .store_product_list img{width: 270px; height: 270px; margin-left: 15px; margin-top: 30px; border: 1px solid #dee2e6;}
    .store_product_card{width: 290px; height: 380px; margin-left: -10px; font-family: 'Pretendard-Regular'; margin-bottom:30px; cursor:pointer;}
    .store_product_seller{margin-left: 25px; margin-top: 5px; font-size: 14px;}
    .store_product_title{margin-left: 25px;  font-size: 17px; font-weight: bold; margin-top: 3px;}
    .store_product_price{margin-left: 25px;  font-size: 20px; font-weight: bold; margin-top: 3px;}
/* -----------------------------------페이징처리 스타일모음----------------------------------- */
    #pagingArea{width:fit-content; margin: auto;}
    .pagination{display: flex; list-style: none; font-family: 'Pretendard-Regular'; margin-bottom:50px;}
    .page-pre{background-color: #21d9cb; width: 25px; height: 20px; text-align: center; margin-right: 20px; border-radius: 5px; cursor: pointer;}
    .page-pre a{color: white; text-decoration: none;}
    .page-next{background-color: #21d9cb; width: 25px; height: 20px; text-align: center; margin-right: 20px; border-radius: 5px; cursor: pointer;}
    .page-next a{color: white; text-decoration: none;}
    .page-number{margin-right: 20px;}
</style>
<body>
	<jsp:include page="../common/header.jsp" />

    <section class="store_body">
        <div class="store_left_category">
            <ul>
                <li class="left_category">카테고리</li>
		        	<li id="left_category"><a class="pcate" data-category-seq="1">침대</a></li>
		            <li id="left_category"><a class="pcate" data-category-seq="2">쇼파</a></li>
		            <li id="left_category"><a class="pcate" data-category-seq="3">식탁</a></li>
		            <li id="left_category"><a class="pcate" data-category-seq="4">의자</a></li>
		            <li id="left_category"><a class="pcate" data-category-seq="5">책상</a></li>
		            <li id="left_category"><a class="pcate" data-category-seq="6">옷장</a></li>
		            <li id="left_category"><a class="pcate" data-category-seq="7">조명</a></li>
		            <li id="left_category"><a class="pcate" data-category-seq="8">화장대</a></li>
            </ul>
        </div>
        <div class="store_product_top">
            <div>
                <table>
                    <tr>
                        <td>전체</td>
                        <td>${ listCount }</td> 
                    </tr>
                </table>
            </div>

            <div class="store_product">
            	<c:forEach var="p" items="${ list }">
	                <div class="store_product_list">
		            		<div class="store_product_card">
		                        <div class="pno" style="display:none ">${ p.proNo }</div>
		                        <div class="store_product_img"><img src="${path}/${ p.proChangeImg }"></div>
		                        <div class="store_product_seller"><p>${ p.selBusName }</p></div>
		                        <div class="store_product_title"><p>${ p.proName }</p></div>
		                        <div class="store_product_price"><p>${ p.proPrice } 원</p></div>
		                        <div class="pcate" style="display:none;"><p>${ p.cateNo }</p></div>
		                    </div>
	                </div>
				</c:forEach>
            </div>
            <!-- 상세페이지 넘기기 -->
            <script>
            	$(function() {
            		$(".store_product_card").click(function(){
            			location.href='productdetail.bo?pno='+ $(this).children(".pno").text();
            		})
            	})
            	$(function() {
            		$(".pcate").click(function(e){
            			var categorySeq = e.target.dataset.categorySeq;
            			location.href='storelist.bo?cateNo='+ categorySeq;
            		})
            	})
            </script>
            
            
           	<!-- 페이징처리 -->
            <div id="pagingArea">
                <ul class="pagination">
                	<!-- 만약에 1페이지면 안보이고 1페이지가 아니면 보여지게하기 -->
                	<c:choose>
                		<c:when test="${ pi.nowPage eq 1 }">
							<li class="page-pre disabled"><a class="page-link" href="#"><</a></li>
	                   	</c:when>
	                   	<c:otherwise>										<!-- cpage=현재페이지 (현재페이지-1)을 해서 바로전페이지를 보여준다 -->
	                   		<li class="page-pre"><a class="page-link" href="storelist.bo?cpage=${ pi.nowPage-1 }"><</a></li>
	                   	</c:otherwise>
	                </c:choose>
	                				<!-- 시작페이지부터 끝페이지까지 출력하시오 -->
	                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    <li class="page-number"><a class="page-link" href="storelist.bo?cpage=${p}">${p}</a></li>
	                </c:forEach>
	                
	                <c:choose>
	                	<c:when test="${ pi.nowPage eq pi.maxPage }">  <!-- 현재페이지가 끝페이지이면 넥스트가 안보이게 -->
	                    	<li class="page-next disabled"><a class="page-link" href="#">></a></li>
	                    </c:when>
	                   	<c:otherwise>										<!-- cpage=현재페이지 (현재페이지+1)을 해서 바로 다음페이지를 보여준다 -->
	                   		<li class="page-next"><a class="page-link" href="storelist.bo?cpage=${ pi.nowPage+1 }">></a></li>
	                   	</c:otherwise>
	                </c:choose>
                </ul>
            </div>

     
    </section>
    
 	<jsp:include page="../common/footer.jsp" />
</body>
</html>