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
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>
    $(function(){
        $("#header_store").mouseover(function(){
            $(".header_store_dropdown").stop().fadeIn(300);
        })
        $(".header_store_dropdown").mouseleave(function(){
            $(".header_store_dropdown").stop().fadeOut(300);
        })
    })
</script>  
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
    /*-------------------------헤더스타일모음--------------------------- */
    *{margin: 0; padding: 0; text-decoration: none;}
    a{text-decoration: none; color: black;  cursor: pointer;}
    .main_logo a {
        font-family: 'SDSamliphopangche_Outline'; color: #21d9cb; font-size: 38px;}
    .main_logo li {position: relative; right:70px; list-style: none;} 
    .main_logo li:last-child{top: -2px;}
    .top_box{ width: 1200px; height: 120px;  margin: 0 auto; display: flex; justify-content: center; align-items:center;}
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
    .main_login ul li:last-child{top: 3px;}
    .main_login ul li a{cursor: pointer;}
    .main_login img {width: 26px;}
    #login_cart{width: 32px;}
    .main_search input {width: 300px; height: 40px; border: 1px solid rgb(215, 213, 213); border-radius: 5px; font-size: 16px; position: relative; left: 60px; padding-left: 10px;}
    .main_search button {width: 50px; height: 40px; border: none; background-color: #21d9cb; color: white; border-radius: 3px; position: relative; left: 60px; cursor: pointer;}
    /*-------------------------카테고리코드모음--------------------------- */
    #header_store{ height: 65px; width: 100px;} 
    /* 드롭다운 스타일모음 */
    .header_store_dropdown{width: 1400px;margin: 0 auto; display: none;}
    .header_store_dropdown table{width: 700px; margin-left: 380px; }
    #store_dropdown_img{width: 40px;}
    .header_store_dropdown tr:first-child{ text-align: center; }
    .header_store_dropdown tr:last-child{text-align: center; font-family: 'GmarketSansMedium'}
    .header_store_bar{width: 2500px; margin-left: -900px;}    
</style>
<body>
    <header class="top_box">
        <nav class="main_top">
            <div class="main_logo" >
                <li><a href="">59'HOUSE</a></li>
                <li><a href="" style="color:black; font-size: 20px; margin-left: 80px;">오구싶은집</a></li>
            </div>
            <div class="main_category">
                <ul>
                     <li><a href=""  style="color:#21d9cb">집들이</a></li>
                     <li id="header_store"><a href="" >스토어</a></li>
                     <li><a href="">인테리어</a></li>
                 </ul>
             </div>
             <div class="main_search">
                <input id="search_bar" type="text" placeholder="통합검색">
                <button>검색</button>
             </div>
            <div class="main_login">
                <ul>
                    <li><a href=""><img id="login_cart" src="${path}/resources/img/main_cart.png"></a></li>
                    <li><a href="">로그인</a></li>
                    <li>|</li>
                    <li><a href="">회원가입</a></li>
                    <li><a href=""><img src="${path}/resources/img/main_chat.png"></a></li>
                </ul>
            </div> 
        </nav> 
    </header> 
    <hr> 
    <div class="header_store_dropdown" >
      <table class="">
          <tr class="">
              <td><a href=""><img src="${path}/resources/img/category_bed.png" id="store_dropdown_img"></a></td>
              <td><a href=""><img src="${path}/resources/img/category_sofa.png" id="store_dropdown_img"></a></td>
              <td><a href=""><img src="${path}/resources/img/category_table.png" id="store_dropdown_img"></a></td>
              <td><a href=""><img src="${path}/resources/img/category_chair.png" id="store_dropdown_img"></a></td>
              <td><a href=""><img src="${path}/resources/img/category_desk.png" id="store_dropdown_img"></a></td>
              <td><a href=""><img src="${path}/resources/img/category_closet.png" id="store_dropdown_img"></a></td>
              <td><a href=""><img src="${path}/resources/img/category_ledlemp.png" id="store_dropdown_img"></a></td>
              <td><a href=""><img src="${path}/resources/img/category_makeup.png" id="store_dropdown_img"></a></td>
          </tr>
          <tr>
              <td><a href="">침대</a></td>
              <td><a href="">쇼파</a></td>
              <td><a href="">식탁</a></td>
              <td><a href="">의자</a></td>
              <td><a href="">책상</a></td>
              <td><a href="">옷장</a></td>
              <td><a href="">조명</a></td>
              <td><a href="">화장대</a></td>
          </tr>
      </table>
      <hr class="header_store_bar">
    </div> 
</body>
</html>