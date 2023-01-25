<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<style>
	*{
		box-sizing: border-box;
	}
	.main_body{width: 1400px; margin: 0 auto; }
	.itemList{
		width:100%; display:flex; flex-wrap: wrap; justify-content: space-around;
	}
	.itemList a{
		width:28%
	}
	.item_card{
		width:100%; border:1px solid tomato; height: 350px;
	}
	.item_img{
		width:100%; height: 50%
	}
	.item_img img{
		width:100%; height: 100%
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="main_body">
		<h2>'${ searchWord }' 검색 결과</h2>
		<div class="itemList">
			<c:forEach var="l" items="${ list }">
				<a href="productdetail.bo?pno=${ l.proNo }">
					<div class="item_card">
						<div class="item_img">
							<img src="${ l.proChangeImg }">
						</div>
						<div class="item_content">
							<p>${ l.proName }</p>
							<p>${ l.proPrice }원</p>
						</div>					
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>