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
    /*-------------------------헤더스타일모음--------------------------- */
    *{margin: 0; padding: 0; text-decoration: none;}
    a{text-decoration: none; color: black;  cursor: pointer;}
    .main_logo a {
        font-family: 'SDSamliphopangche_Outline'; color: #21d9cb; font-size: 30px; left: 0;}
    .main_logo li {position: relative; list-style: none;}
    .main_logo li:last-child {position: relative; margin-bottom: 20px;}  
    .top_box{ height:50px;display: flex;  align-items:center; margin-left: 70px; margin: 20px 0 30px 100px;}
    .main_top {height: 50px;  position: absolute; font-family: 'GmarketSansMedium';}
    .main_top ul {list-style: none; text-align: center;} 
    .logo_name { position: absolute; } 
    hr{border-color: rgb(225, 223, 223);} 
    
    /*-------------------------글쓰기 바디 모음--------------------------- */
    .body_box{width: 1140px; margin: 0 auto;}
    .top_title{display: flex; font-family: 'GmarketSansMedium'; margin-top: 60px;}
    .top_title img {width: 40px;}
    .top_title div:nth-child(2){font-size: 20px; margin-top: 12px; margin-left: 10px; font-weight: bolder;}
    .category_box{height: 70px; font-family: 'Pretendard-Regular';}
    .category_form{display: flex; margin-top: 30px;}
    .category_form div:nth-child(1){font-size: 18px; margin-top: 43px; font-weight: bolder;}
    .category_form div:nth-child(2){font-size: 18px; margin-top: 40px; margin-left: 20px;}
    .category_form select{width: 300px; height:35px; font-size:16px; padding: 5px; border: 2px solid rgb(204, 204, 204); color: gray; border-radius: 5px; margin-left: 25px;}
    .product_name{display: flex; height: 70px;}
    .product_name p {font-size: 18px; font-weight: bolder; margin-top: 28px;}
    .product_name div:nth-child(2){margin-top:25px;}
    .product_name textarea{font-size: 16px; width: 700px; padding: 3px; border: 2px solid rgb(204, 204, 204); color: gray; border-radius: 5px; margin-left: 60px; }
    .option{height: 100px;}
    #option_text{font-size: 18px; font-family: 'Pretendard-Regular'; font-weight: bolder; padding-top: 20px;}
    .option_number{display: flex; font-family: 'Pretendard-Regular'; margin-top: 20px;}
    .option_number p{font-size: 16px; font-weight: bolder; margin-top: 8px;}
    .option_number input{font-size: 16px; height:26px; width: 200px; padding: 3px; border: 2px solid rgb(204, 204, 204); color: gray; border-radius: 5px; margin-left: 10px; padding-left: 10px;}
    .option_number div:nth-child(1){margin-left: 40px;}
    .option_number div:nth-child(3){margin-left: 40px;}
    .option_number div:nth-child(5){margin-left: 40px;}
    .main_img{margin-top: 50px; display: flex; }
    .main_img label{font-size: 18px; font-family: 'Pretendard-Regular'; font-weight: bolder;}
    .main_img div:nth-child(2){margin-left: 103px;}
    .main_img input{margin-top: 2px;}
    .detail_img{margin-top: 30px; display: flex;}
    .detail_img label{font-size: 18px; font-family: 'Pretendard-Regular'; font-weight: bolder;}
    .detail_img div:nth-child(2){margin-left: 53px;}
    .btn{display: flex; margin-top: 50px; padding-left: 350px; border: none;}
    .btn button{background-color: #21d9cb; border: 1px solid #21d9cb; color: white; font-size: 20px; width: 200px; padding-top: 10px; padding-bottom: 10px; margin-left: 20px; border-radius: 5px; cursor:pointer;}
</style>
<body>
    <header class="top_box">
        <nav class="main_top">
            <div class="main_logo" >
                <li><a href="">59'HOUSE</a></li>
                <li><a href="" style="color:black; font-size: 20px; margin-left: 45px; margin-top:10px;">오구싶은집</a></li>
            </div> 
        </nav> 
    </header> 
    <hr>  
     
    <section>
        <div class="body_box">
            <div class="top_title">
                <div><img src="${path}/resources/img/write.png"></div>
                <div>판매하는 상품정보를 입력해주세요 ! </div>
            </div>
            <div class="category_box">
                <form id="productWrite" action="proInsert.bo" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="selNo2" value="${ selNo }">
                    <div class="category_form">
                        <div><p>✔ 등록하는 상품의 카테고리를 선택해주세요</p></div>
                        <div>
                            <select name="cateNo">
                                <option>카테고리</option>
                                <option value="1">침대</option>
                                <option value="2">쇼파</option>
                                <option value="3">식탁</option>
                                <option value="4">의자</option>
                                <option value="5">책상</option>
                                <option value="6">옷장</option>
                                <option value="7">조명</option>
                                <option value="8">화장대</option>
                            </select>
                        </div>
                    </div>
                    <div class="product_name">
                        <div><p>✔ 등록하는 상품의 타이틀을 입력해주세요</p></div>
                        <div><textarea name="proName" placeholder=" 상품타이틀" row="2" style="margin-top:3px; resize:none;" ></textarea></div>
                    </div>
                    <div class="option">
                        <div><p id="option_text">✔ 등록하는 상품의 색상별 수량을 입력해주세요</p></div>
                        <div class="option_number">
                            <div><p>□ WHITE</p></div>
                            <div><input type="number" name="proWhiteStock" placeholder="수량을 입력해주세요"></div>
                            <div><p>■ BLACK</p></div>
                            <div><input type="number" name="proBlackStock" placeholder="수량을 입력해주세요"></div>
                            <div><p>💲 개당 가격</p></div>
                            <div><input type="number" name="proPrice" placeholder="가격을 입력해주세요"></div>
                        </div>
                    </div>
                    <div class="main_img">
                        <div><label for="upfile">✔ 메인 이미지를 두 장 선택해주세요</label></div>
                        <div><input type="file" class="main_file_1" name="upfile"></div>
                        <div><input type="file" class="main_file_2" name="upfile"></div>
                    </div>
                    <div class="detail_img">
                        <div><label for="upfile">✔ 상품의 상세 이미지를 한 장 선택해주세요</label></div>
                        <div><input type="file" class="main_file_3" name="upfile"></div>
                    </div>
                    <div class="btn">
                        <button type="submit">등록하기</button>
                        <button type="reset">취소하기</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>
</html>