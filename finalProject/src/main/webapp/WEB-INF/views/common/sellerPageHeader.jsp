<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/*------------------------- 판매자페이지 메뉴바 스타일모음------------------------- */
	.mypage_category{width: 1400px; height: 80px; margin: 0 auto;} 
	.mypage_category table {width: 700px; height: 80px; margin: 0 auto; text-align: center; font-weight: bolder;}
	#mypage_menu{font-family: 'GmarketSansMedium';}
	#mypage_menu:hover{color: #21d9cb;}
</style>
<body>
<!--마이페이지 메뉴바-->
<section>
    <div class="mypage_body">
        <div class="mypage_category">
            <table>
                <tr>
                    <td><a href="sellerProduct.se?selNo=${ s.selNo }" id="mypage_menu">판매상품</a></td>
                    <td><a href="sellerOrderList.or?selNo=${ s.selNo }" id="mypage_menu">주문내역</a></td>
                    <td><a href="rArrayList.bo" id="mypage_menu">답변내역</a></td>
                    <td><a href="sellerInfoUpdate.se?selNo=${ s.selNo }" id="mypage_menu">개인정보수정</a></td>
                </tr>
            </table>
        </div>
    </div>
    <hr>
</section>
</body>
</html>