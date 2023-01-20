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
<!-- ----------------alert창 제공하는것!!!!---------------- -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- ----------------써머노트 !!!!---------------- -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

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
	     
	    /*------------------------- 마이페이지 메뉴바 스타일모음------------------------- */
	    .mypage_category{ height: 80px; margin: 0 auto;}
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
                        <td><a href="cartlist.ca" id="mypage_menu">장바구니</a></td>
                        
                        <td><a href="myPageOrderlist.bo?id=${ id }" id="mypage_menu">나의쇼핑</a></td>
                        
                        <td><a href="mypagehblist.bo" id="mypage_menu">나의리뷰</a></td>
                        <td><a href="myPage.me" id="mypage_menu">개인정보수정</a></td>
                    </tr>
                </table>
            </div>
        </div>
      <hr>  
    </section> 
</body>
</html>