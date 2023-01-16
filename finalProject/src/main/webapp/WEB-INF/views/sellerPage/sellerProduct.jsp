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
    /*------------------------- 판매자페이지 메뉴바 스타일모음------------------------- */
    .mypage_category{width: 1400px; height: 80px; margin: 0 auto;} 
    .mypage_category table {width: 700px; height: 80px; margin: 0 auto; text-align: center; font-weight: bolder;}
    #mypage_menu{font-family: 'GmarketSansMedium';}
    #mypage_menu:hover{color: #21d9cb;}


    /* -------------------------판매자페이지 판매상품 스타일모음------------------------- */
    .product_count{width: 950px; margin: 0 auto; display: flex; margin-top: 30px; font-weight: bolder; font-size: 18px;}
    .product_count div:nth-child(1){font-family: 'GmarketSansMedium'; padding-top: 10px;}
    .product_count div:nth-child(2){font-family: 'GmarketSansMedium'; color: #21d9cb; margin-left: 5px; padding-top: 10px;}
    .product_count div:nth-child(3){font-family: 'GmarketSansMedium'; width: 820px; text-align: right;}
    .product_count div a{width: 120px; height: 40px;cursor: pointer; border-radius: 5px;  font-size: 16px; border: 1px solid #21d9cb; background-color: #21d9cb; color: white; font-family: 'Pretendard-Regular';}
    .sellerpage_main_body{padding-top: 20px;}
    .sellerpage_product_list{display: flex; width:1000px; margin: 0 auto;}
    .product_list{ width: 300px;  margin: 0 auto; padding-top: 50px; padding-bottom: 50px;} 
    .product_list_img{text-align: center; width: 300px;}
    .product_list_card img{width: 270px; height: 270px; border: 1px solid #dee2e6;}
    .product_list_title{text-align: center; font-family: 'Pretendard-Regular'; font-size: 16px; margin-top: 10px;}
    .product_review_paging{width: 950px; margin: 0 auto; text-align: center; margin-top: 30px; margin-bottom: 60px;}
</style>
<body>
	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />

	<!--셀러페이지 메뉴바-->
    <section>
        <div class="mypage_body">
            <div class="mypage_category">
                <table>
                    <tr>
                        <td><a href="" id="mypage_menu" style="color: #21d9cb;">판매상품</a></td>
                        <td><a href="" id="mypage_menu">주문내역</a></td>
                        <td><a href="" id="mypage_menu">답변내역</a></td>
                        <td><a href="" id="mypage_menu">개인정보수정</a></td>
                    </tr>
                </table>
            </div>
        </div>
        <hr>
    </section>
    
    <section class="sellerpage_main_body">
        <div class="product_count">
            <div><p>판매상품</p></div>
            <div><p>1,234</p></div>
            <div><a href="productWrite.bo">상품 올리기</a></div>
        </div>

        <div class="sellerpage_product_list">
            <div class="product_list">
                <div class="product_list_card">
                    <a href="">
                    <div class="product_list_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                    <div class="product_list_title">상품타이틀 상품타이틀</p></div>
                    </a>
                </div>
            </div>
            <div class="product_list">
                <div class="product_list_card">
                    <a href="">
                    <div class="product_list_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                    <div class="product_list_title">상품타이틀 상품타이틀</p></div>
                    </a>
                </div>
            </div>
            <div class="product_list">
                <div class="product_list_card">
                    <a href="">
                    <div class="product_list_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                    <div class="product_list_title">상품타이틀 상품타이틀</p></div>
                    </a>
                </div>
            </div>
        </div>

        <div class="sellerpage_product_list">
            <div class="product_list">
                <div class="product_list_card">
                    <a href="">
                    <div class="product_list_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                    <div class="product_list_title">상품타이틀 상품타이틀</p></div>
                    </a>
                </div>
            </div>
            <div class="product_list">
                <div class="product_list_card">
                    <a href="">
                    <div class="product_list_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                    <div class="product_list_title">상품타이틀 상품타이틀</p></div>
                    </a>
                </div>
            </div>
            <div class="product_list">
                <div class="product_list_card">
                    <a href="">
                    <div class="product_list_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                    <div class="product_list_title">상품타이틀 상품타이틀</p></div>
                    </a>
                </div>
            </div>
        </div>

        <!-- 페이징처리 -->
        <div class="product_review_paging">
            1  2  3  4  5
        </div>
    </section>



	<!-- 푸터 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>