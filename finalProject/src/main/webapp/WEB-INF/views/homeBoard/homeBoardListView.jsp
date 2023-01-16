<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/homeboard.css"
	rel="stylesheet" type="text/css">
<body>
	<jsp:include page="../common/header.jsp" />

	<form action="" method="" id="room_select_option">
		<div>
			<select name="room_select_option">
				<option value="none">주거형태</option>
				<option value="english">원룸&오피스텔</option>
				<option value="chinese">아파트</option>
			</select>
		</div>
		<div>
			<select name="family_style">
				<option value="name">선택해주세요.</option>
				<option value="single_life">싱글라이프</option>
				<option value="married">신혼부부</option>
			</select>
		</div>
		<!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼 -->
		<c:if test="${ not empty id }">
		<a class="btn btn-outline-primary" style="padding:10px 30px; margin:20px 0  0 860px;" href="enrollForm.bo">글쓰기</a> 
		</c:if>
	</form>

	<main>
		<div class="total_count" style="position: relative; left: 1px; top:50px;">전체
			${ listCount }</div>

		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"> 
					<c:forEach var="h" items="${ list }">
						<div class="col">
							<div id="col_body">
								<div class="card shadow-sm">
									<p id="bno" style="display:none;">${ h.boardNo }</p>
									<img src="${path}/${ h.boardMainimgChange }" width="100%" height="225">
									<div class="card-body">
										<p class="card-text_title">${ h.boardTitle }</p>
										<p class="card-text_name">
											<img src="${path}/resources/img/logo_user.png" width="22px" style="margin-right: 7px;">${ h.memNick }
										</p>
										<div class="d-flex justify-content-between align-items-center">
											<small class="text-muted">조회수 : ${ h.boardCount }회</small>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach> 
				</div>
			</div>
		</div>

		<!-- 상세페이지 -->
		<script>
			$(function() {
				$(".col>#col_body>div").click(function() { 
					console.log($(this).children("#bno").text())
					location.href = 'detail.bo?bno=' + $(this).children("#bno").text();
				})
				$(".col>#col_body>div").children().click(function() { 
					console.log($(this).siblings("#bno").text())
					location.href = 'detail.bo?bno=' + $(this).siblings("#bno").text();
				})
			})
		</script>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
