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
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
           /* 로고폰트 */
            @font-face {
            font-family: 'SDSamliphopangche_Outline';
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
            align-items: left;
            flex-wrap: wrap;
        }
        .item{
            width: 31%; margin-bottom: 30px;
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
        <!-- 반복돌릴자리 -->
	<c:forEach var="s" items="${ sellList }">
	       	<div class="item">
	            <a href="interior_detail.in?selNo=${ s.selNo }&selBusName=${s.selBusName}&selInterIntroduce=${s.selInterIntroduce}">
	            <c:if test="${ not empty s.interMainimgChange}">
	                <img src="${ path }/${s.interMainimgChange}" alt="나중에추가" class="itemCardImg">
                </c:if>
                <c:if test="${ empty s.interMainimgChange}">
	                <img src="${ path }/resources/img/logo_user.png" alt="나중에추가" class="itemCardImg">
                </c:if>
	                <div class="itemTxt">
	                    <span class="interiorTitle">${ s.selBusName }</span>
	                    <span class="interiorContent">${ s.selInterIntroduce }</span>
	                </div>
	            </a>
	        </div>
	</c:forEach>
            </div>
        </div>
    </section>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>