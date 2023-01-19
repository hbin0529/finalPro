<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
     /* ------------------------- 마이페이지 장바구니 메인 스타일모음-------------------------  */
    .mypage_main_body{width: 1200px; margin: 0 auto; display: flex;}
    .mypage_main_body table{ width: 700px; margin-top: 50px; margin-left: 80px; margin-bottom: 50px; font-family: 'Pretendard-Regular';}
    .mypage_cart_table{border: 1px solid rgb(204, 204, 204);}
    .mypage_cart_table img{margin-top: 10px; width: 100px;}
    .mypage_cart_table button{width: 30px; color: black; background-color: rgb(231, 231, 231); border: 1px solid rgb(231, 231, 231); cursor: pointer;}
    #cart_table_title{text-align: center; border-bottom: 1px solid rgb(204, 204, 204); height: 50px; font-weight: bolder;}
    #cart_table_img{width: 100px; padding-right: 5px;}
    #cart_table_product_name{text-align: left; }
    #cart_table_btn{text-align: right; vertical-align: top; padding-right: 20px;}
    #cart_table_price{text-align: right; font-weight: bolder; padding-right: 20px; }
    .mypage_cart_sum{width: 500px; }
    .mypage_cart_sum table{width: 350px; margin: 0 auto; margin-top: 50px; border: 1px solid rgb(204, 204, 204); padding: 10px; font-family: 'Pretendard-Regular';}
    .mypage_cart_sum table tr td:nth-child(1){font-size: 17px; padding: 5px;}
    .mypage_cart_sum table tr td:nth-child(2){text-align: right;}
    .mypage_cart_sum button{background-color: #21d9cb; border: 1px solid #21d9cb; color: white; width: 300px; height: 50px; margin-top: 10px; font-size: 18px; font-weight: bolder; cursor: pointer;}       
        
</style>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/myPageHeader.jsp" />

<section class="mypage_main_body">
    <div class="mypage_cart">
        <table class="mypage_cart_table">
            <tr>
                <td colspan="5" id="cart_table_title">판매처이름</td>
            </tr>
            <tr>
                <td id="cart_table_img" style="padding-left: 10px;"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></td>
                <td id="cart_table_product_name"><a href="">상품이름 상품이름</a></td>
                <td id="cart_table_btn"><button>X</button></td>
            </tr>
            <tr>
                <td colspan="5"><hr style="margin-top: 10px;"></td>
            </tr>
            <tr>
                <td colspan="4" style="font-size: 14px; padding-top: 20px; margin-top: 10px; padding-left: 20px;">옵션 : 블랙</td>
            </tr>
            <tr>
                <td colspan="2" style="padding-bottom: 20px; padding-left: 20px; padding-top: 5px;">
                    <select>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </td>
                <td colspan="3" id="cart_table_price" style="padding-bottom: 20px;">10,000 원</td>
            </tr>
        </table>

        <table class="mypage_cart_table">
            <tr>
                <td colspan="5" id="cart_table_title">판매처이름</td>
            </tr>
            <tr>
                <td id="cart_table_img" style="padding-left: 10px;"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></td>
                <td id="cart_table_product_name"><a href="">상품이름 상품이름</a></td>
                <td id="cart_table_btn"><button>X</button></td>
            </tr>
            <tr>
                <td colspan="5"><hr style="margin-top: 10px;"></td>
            </tr>
            <tr>
                <td colspan="4" style="font-size: 14px; padding-top: 20px; margin-top: 10px; padding-left: 20px;">옵션 : 블랙</td>
            </tr>
            <tr>
                <td colspan="2" style="padding-bottom: 20px; padding-left: 20px; padding-top: 5px;">
                    <select>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </td>
                <td colspan="3" id="cart_table_price" style="padding-bottom: 20px;">10,000 원</td>
            </tr>
        </table>
    </div>

    <div class="mypage_cart_sum">
        <table>
            <tr>
                <td>총 상품금액</td>
                <td>10,000 원</td>
            </tr>
            <tr>
                <td>총 배송비</td>
                <td>+ 0 원</td>
            </tr>
            <tr>
                <td>총 할인금액</td>
                <td>- 0 원</td>
            </tr>
            <tr>
                <td>결제금액</td>
                <td>10,000 원</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button>1개 상품 구매하기</button>
                </td>
            </tr>
        </table>
    </div>
</section>


<jsp:include page="../common/footer.jsp" />
</body>
</html>