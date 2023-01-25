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
    /* 로고폰트 */
    @font-face {
        font-family: 'SDSamliphopangche_Outline';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        } 
    /* 메뉴폰트 */
        @font-face {
        font-family: 'GmarketSansMedium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        }
    /* 본문내용폰트 */
        @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
        }
    /* -------------------------판매자페이지 판매상품 스타일모음------------------------- */
    .product_count{width: 950px; margin: 0 auto; display: flex; margin-top: 30px; font-weight: bolder; font-size: 18px;}
    .product_count div:nth-child(1){font-family: 'GmarketSansMedium'; padding-top: 10px;}
    .product_count div:nth-child(2){font-family: 'GmarketSansMedium'; color: #21d9cb; margin-left: 5px; padding-top: 10px;}
    .product_count div:nth-child(3){font-family: 'Pretendard-Regular'; font-size:15px; padding-top:10px; width: 100px; height: 25px; margin-left:720px; text-align: center; background-color: #21d9cb; border-radius:5px; cursor:pointer;}
    .product_count div a{text-decoration:none; color:white;} 
    .sellerpage_main_body{padding-top: 20px;}
    .sellerpage_product_list{width:1000px; margin: 0 auto; display: flex; flex-wrap: wrap;}
    .product_list{ width: 300px;  padding-top: 50px; padding-bottom: 50px; display: flex; padding-left: 16px; padding-right: 17px;} 
    .product_list_img{text-align: center; width: 300px;}
    .product_list_card{cursor:pointer;}
    .product_list_card img{width:270px; height: 270px; border: 1px solid #dee2e6;}
    .product_list_title{text-align: center; font-family: 'Pretendard-Regular'; font-size: 16px; margin-top: 10px;}
    .product_review_paging{width: 950px; margin: 0 auto; text-align: center; margin-top: 30px; margin-bottom: 60px;}
</style>

<body>
<!-- 헤더 -->
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/sellerPageHeader.jsp" />

<section class="sellerpage_main_body">
    <div class="product_count">
        <div><p>판매상품</p></div>
        <div><p>${ listCount }</p></div>
        <div><a href="productWrite.bo">상품 올리기</a></div>
    </div>

    <div class="sellerpage_product_list">
    	<c:forEach var="p" items="${ list }">
	        <div class="product_list">
	            <div class="product_list_card">
	                <div class="product_list_img"><img src="${path}/${p.proChangeImg}"></div>
	                <div class="product_list_title">${ p.proName }</p></div>
	                <div class="pno" style="display:none">${ p.proNo }</div>
	            </div>
	        </div>
        </c:forEach>
    </div>
	<script>
	$(function() {
		$(".product_list_card").click(function(){
			location.href='productdetail.bo?pno='+ $(this).children(".pno").text();
		})
	})
	</script>
    <!-- 페이징처리 -->
    <div class="product_review_paging">
        1  2  3  4  5
    </div>
</section>

<!-- 푸터 -->
<jsp:include page="../common/footer.jsp" />
</body>
</html>