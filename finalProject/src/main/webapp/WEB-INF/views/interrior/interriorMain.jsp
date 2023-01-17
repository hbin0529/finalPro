<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <title>Document</title>
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
        *{margin: 0; padding: 0; text-decoration: none; box-sizing: border-box;}
        a{text-decoration: none; color: black;  cursor: pointer;}
        .main_logo a {
            font-family: 'SDSamliphopangche_Outline'; color: #21d9cb; font-size: 38px;}
        .main_logo li {position: relative; right:70px; list-style: none;} 
        .top_box{ width: 1400px; height: 120px;  margin: 0 auto; display: flex; justify-content: center; align-items:center;}
        .main_top {display: flex; height: 40px;  position: relative; font-family: 'GmarketSansMedium';}
        .main_top ul {list-style: none; text-align: center;} 
        .logo_name { position: absolute; left: -170px; } 
        .main_category ul {display: flex; }
        .main_category ul li {margin-right: 20px; font-size: 18px; font-weight: bold; position: relative; left: 5px; top: 18px;}
        .main_category ul li a:hover{color: #21d9cb;}
        .main_search ul{display: flex;}    
        .main_login ul{display: flex; margin-left: 50px;}
        .main_login ul li {margin-right: 20px; position: relative; left: 60px; font-size: 14px; top: 12px;}
        .main_login ul li:first-child{top: 3px;}
        .main_login ul li:last-child{top: 2px;}
        .main_login ul li a{cursor: pointer;}
        .main_login img {width: 26px;}
        #login_cart{width: 32px;}
        .main_search input {width: 300px; height: 40px; border: 1px solid rgb(215, 213, 213); border-radius: 5px; font-size: 16px; position: relative; left: 60px; padding-left: 10px;}
        .main_search button {width: 50px; height: 40px; border: none; background-color: #21d9cb; color: white; border-radius: 3px; position: relative; left: 60px; cursor: pointer;}
        hr{border-color: white;} 
        #header_store{ height: 65px; width: 100px;} 
    
        /*------------------------- 마이페이지 메뉴바 스타일모음------------------------- */
        .mypage_category{width: 1400px; height: 80px; margin: 0 auto;}
        .mypage_category table {width: 700px; height: 80px; margin: 0 auto; text-align: center; font-weight: bolder;}
        #mypage_menu{font-family: 'GmarketSansMedium';}
        #mypage_menu:hover{color: #21d9cb;}    
    
    
        /*-------------------------* 드롭다운 스타일모음 /*-------------------------*/
        .header_store_dropdown{width: 1400px;margin: 0 auto; display: none; }
        .header_store_dropdown table{width: 700px; margin-left: 380px; }
        #store_dropdown_img{width: 40px;}
        .header_store_dropdown tr:first-child{ text-align: center; }
        .header_store_dropdown tr:last-child{text-align: center; font-family: 'GmarketSansMedium'}
        .header_store_bar{width: 2500px; margin-left: -900px;}
    
        /*----------------------------------- 푸터 스타일 모음-------------------------------------------- */
        a{text-decoration: none; color: black;}
        footer {height: 300px; background-color: #f6fdfd;}
        footer ul li{list-style: none;}
        .bottom_box{display: flex;  align-items: center;}
        .footer_wrap{display: flex; margin: 0 auto;}
        .footer_callcenter{width: 300px; font-size: 12px;}
        .footer_callcenter ul li{margin-bottom: 5px;}
        #callcenter{font-size: 22px; font-weight: bold; font-family: 'GmarketSansMedium';} 
        #callcenter_number{font-family: 'SDSamliphopangche_Outline'; font-size: 30px; color: #21d9cb; padding-top: 10px; padding-bottom: 10px;}
        .footer_category{width: 700px;display: flex; }
        .footer_sns{width: 400px; font-size: 12px;}
        .footer_sns table {margin: 0 auto;}
        .footer_sns img{width: 30px; height: 30px;padding-left: 20px;}
        #category_name{text-align: center; font-size: 15px; font-weight: bold; padding-bottom: 20px; font-family: 'GmarketSansMedium';}
        #category_text{font-size: 11px; padding-bottom: 10px; }
        #footer_logo_top {font-family: 'SDSamliphopangche_Outline'; font-size: 40px; color: #21d9cb; text-align: center; padding-top: 20px;}
        #footer_logo_bottom {font-family: 'SDSamliphopangche_Outline'; text-align: center; font-size: 20px;}
    
        /* --------------------- 본문 --------------------- */
        .container{
            width: 1260px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            padding: 30px 0;
        }
        .section{
            width: 100%;
            padding: 20px 0; display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .item{
            width: 27%;
            height: 350px; border: 1px solid rgba(0, 0, 0, 0.144);
            border-radius: 6px; box-shadow: 0px 0px 10px rgb(218, 216, 216);
        }
        .itemCardImg{
            width: 100%;
            height: 70%;
        }
        .searchBarSection{
            width: 90%; margin: 20px auto;
            border: 1.5px solid rgb(33, 217, 203); border-radius: 25px;
            height: 50px; display: flex; align-items: center;
            padding: 10px; box-shadow: 0px 0px 3px rgba(133, 127, 127, 0.795);
        }
        .searchWord{
            width: 85%; 
            font-size: 20px; height: 100%; border: 0px solid; outline: 0px solid;
            font-family: 'Pretendard-Regular';
        }
        .searchImg{
            margin: 0 30px 0 20px;
        }
        .searchButton{
            border: 0; background-color: white;
            font-size: 18px; font-weight: bold; font-family: 'GmarketSansMedium';
        }
        .itemTxt{
            width: 100%;
            padding: 14px;
        }
        .interiorTitle, .interiorContent{display: block;}
        .interiorTitle{
            font-size: 20px;
            margin-bottom: 7px; font-family: 'GmarketSansMedium';
        }
        .interiorContent{
            font-size: 12px;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <!-- 본문 -->
    <section class="container">
        <form action="">
            <div class="searchBarSection">
                <img src="${ path }/resources/img/search.png" alt="돋보기" class="searchImg">
                <input type="text" class="searchWord" placeholder='"거실이 넓은 집에 맞는 인테리어 추천해 줘"'>
                <button class="searchButton">검색하기</button>
            </div>
        </form>
        <div class="itemSection">
            <div class="section">
                <div class="item">
                    <a href="interior_detail.html">
                        <img src="img/interior.jpg" alt="" class="itemCardImg">
                        <div class="itemTxt">
                            <span class="interiorTitle">인테리어 업체 1</span>
                            <span class="interiorContent">싱크대/도배 찬장, 모던한 분위기의 색감..</span>
                        </div>
                    </a>
                </div>
                <div class="item">
                    <img src="img/interior2.jpg" alt="" class="itemCardImg">
                    <div class="itemTxt">
                        <span class="interiorTitle">인테리어 업체 1</span>
                        <span class="interiorContent">싱크대/도배 찬장, 모던한 분위기의 색감..</span>
                    </div>
                </div>
                <div class="item">
                    <img src="img/interior3.jpg" alt="" class="itemCardImg">
                    <div class="itemTxt">
                        <span class="interiorTitle">인테리어 업체 1</span>
                        <span class="interiorContent">싱크대/도배 찬장, 모던한 분위기의 색감..</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>