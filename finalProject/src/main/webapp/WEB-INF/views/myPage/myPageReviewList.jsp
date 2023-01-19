<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

       /*------------------------- 마이페이지 메뉴바 스타일모음------------------------- */
    .mypage_category{width: 1400px; height: 80px; margin: 0 auto;}
    .mypage_category table {width: 700px; height: 80px; margin: 0 auto; text-align: center; font-weight: bolder;}
    #mypage_menu{font-family: 'GmarketSansMedium';}
    #mypage_menu:hover{color: #21d9cb;}

    /*------------------------- 마이페이지 나의리뷰 메뉴바 스타일모음------------------------- */
    .mypage_review_category{width: 1400px; height: 70px; margin: 0 auto;}
    .mypage_review_category table {width: 400px; height: 70px; margin: 0 auto; text-align: center; font-size: 16px;}
    #mypage_review_menu{font-family: 'GmarketSansMedium';}
    #mypage_review_menu:hover{color: #21d9cb;}  
    
    /* ------------------------- 마이페이지 나의리뷰 상품리뷰 스타일모음-------------------------  */
    .mypage_main_body{width: 1200px; margin: 0 auto; }
    .mypage_main_body table{ width: 1000px; margin-top: 50px; margin-left: 80px; margin-bottom: 50px; margin: 0 auto; border: 1px solid rgb(212, 212, 212); margin-top: 40px; padding: 20px; margin-bottom: 40px; border-radius: 10px;} 
    .mypage_product_review_table{font-family: 'Pretendard-Regular';}
    .mypage_product_review_table button{width: 50px; height: 30px; font-size: 15px; color: white; background-color: #21d9cb; border: 1px solid #21d9cb; cursor: pointer; border-radius: 5px; font-family: 'Pretendard-Regular';}
    .mypage_product_review_table button:hover{background-color: #21d9cb; color: white;}
    .product_review_paging{text-align: center; margin-bottom: 50px; padding-top: 20px; font-family: 'Pretendard-Regular';}
    
    
</style>
<link href="${pageContext.request.contextPath}/resources/css/homeboard.css" rel="stylesheet" type="text/css"> 
</head>
<body>

<jsp:include page="../common/header.jsp" /> 
<jsp:include page="../common/myPageHeader.jsp" /> 
<jsp:include page="../common/myPageReviewHeader.jsp" /> 

<section class="mypage_main_body">
<form action="reviewdelete.bo" method="post">
        <div class="mypage_product_review">
           
      <c:forEach var="order" items="${ o }">
        <input type="hidden" name="reviewNo" value="${ order.reviewNo }">   
            <table class="mypage_product_review_table">
                <tr>
                    <td colspan="2" style="text-align: right;">
                         <button type ="submit">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="font-size: 20px; font-weight: bolder;"><a href="">${ p.proName }</a></td>
                </tr>
                <tr>
                    <td colspan="2" >옵션 | ${ order.ordOption }</td>
                </tr>
                <tr>
                    <td width="25px" style="font-size: 25px; color: #21d9cb;">${ order.reviewStar }</td>
                    <td style="padding-top: 5px; color: rgb(172, 172, 172);">주문일자 ${ order.reviewDate }</td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-top: 10px; padding-bottom: 20px;">${ order.reviewContent }
                    </td>
                </tr>
            </table>
           </c:forEach>  
        </div>  
      </form>  
    </section> 
    
<jsp:include page="../common/footer.jsp"/> 

</body>
</html>