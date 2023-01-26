<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
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
/* -----------------------------------메인바디 상품리스트 스타일모음----------------------------------- */
    .store_body{width: 1400px; margin: 0 auto; display: flex;}
    .store_product_top{width: 1400px; margin: 0 auto;} 
    .store_product_top table{margin-top:30px; width: 1400px; height: 100px; margin-left: 50px; font-size: 20px; font-weight: bolder; font-family: 'GmarketSansMedium';}
    #product_list{border: 1px solid #dee2e6; width: 100px; padding: 5px; border-radius: 6%; color: rgb(105, 105, 105);} 
    .store_product{display: flex; width:1400px; flex-wrap:wrap;  padding-bottom:60px;}
    .store_product_list{ margin-top: 10px; margin-left: 50px; }
    .store_product_list img{width: 270px; height: 270px; margin-top: 30px; border: 1px solid #dee2e6;}
    .store_product_card{width: 290px; height: 380px; font-family: 'Pretendard-Regular'; margin-bottom:30px;}
    .store_product_seller{margin-top: 5px; font-size: 14px;}
    .store_product_title{ font-size: 17px; font-weight: bold; margin-top: 3px;}
    .store_product_price{ font-size: 20px; font-weight: bold; margin-top: 3px;}
    .store_body{height: 400px;}
    .noproduct{width:1400px; height:200px; font-family: 'GmarketSansMedium'; margin-top:150px; text-align:center;}

</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>


<div class="store_product_top">
    <div>
        <table>
            <tr>
                <td>'${ searchWord }' 검색결과 입니다 !</td>
            </tr>
        </table>
    </div>
	<div class="store_product">
		<c:if test="${fn:length(list) < 1}">
   			<div class="noproduct">
   				<h1>안타깝지만 찾으시는 '${ searchWord }' 상품의 검색결과가 없습니다 ㅠ.ㅠ</h1>
   			</div>
   		</c:if>
	    <c:forEach var="l" items="${ list }">
	        <div class="store_product_list">
	            <div class="store_product_card">
	                <a href="productdetail.bo?pno=${ l.proNo }">
	                <div class="store_product_img"><img src="${ l.proChangeImg }"></div>
	                <%-- <div class="store_product_seller"><p>${ l.selBusName }</p></div> --%>
	                <div class="store_product_title"><p>${ l.proName }</p></div>
	                <div class="store_product_price"><p>${ l.proPrice }원</p></div>
	                </a>
	            </div>
	        </div>
	    </c:forEach>
	</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>