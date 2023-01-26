<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구싶은집 > 집들이</title>
<!-- 파비콘 로고 -->
<link rel="icon" href="${path}/resources/img/pavilogo.png">
</head> 
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/homeboard.css"
	rel="stylesheet" type="text/css">
<body>
	<jsp:include page="../common/header.jsp" />

	<!-- <form action="" method="" id="room_select_option">
		<div>
			<select name="homeOption">
				 <option value="none">선택해주세요.</option>
                 <option value="원룸">원룸</option>
                 <option value="오피스텔">오피스텔</option>
                 <option value="아파트">아파트</option>
			</select>
		</div>
		<div>
			<select name="homeFamilyv">
				<option value="none">선택해주세요.</option>
		       <option value="싱글라이프">싱글라이프</option>
                <option value="신혼부부">신혼부부</option>
			</select>
		</div> -->
		<!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼 -->
		<c:if test="${ not empty id }">
		<a class="btn btn-outline-primary" style="padding:10px 30px; margin:10px 0 0 1480px;" href="enrollForm.bo">글쓰기</a> 
		</c:if>
	</form>

	<main>
		<div class="total_count" style="position: relative; left: 1px; top:40px;">전체
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
										<p class="card-text_title"><strong>${ h.boardTitle }</strong></p>
										<p class="card-text_name">
										<c:if test="${empty h.memImg}">  
											<img src="${path}/resources/img/logo_user.png" width="30px" style="margin-right: 7px;">${ h.memNick }
										</c:if>
										<c:if test="${!empty h.memImg}"> 
										<img src="${path}${h.memImg}" style="margin-right: 7px; width:30px; height:30px; border-radius: 50%;">${ h.memNick }
										</c:if>
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
		
		<!-- 페이징처리 -->
       <div id="pagingArea">
           <ul class="pagination">
           	<!-- 만약에 1페이지면 안보이고 1페이지가 아니면 보여지게하기 -->
	           	<c:choose>
	           		<c:when test="${ pi.nowPage eq 1 }">
					<li class="page-pre disabled"><a class="pageLink" href="#"><</a></li>
	               	</c:when>
	               	<c:otherwise>										<!-- cpage=현재페이지 (현재페이지-1)을 해서 바로전페이지를 보여준다 -->
	               		<li class="page-pre"><a class="pageLink" href="list.bo?cpage=${ pi.nowPage-1 }"><</a></li>
	               	</c:otherwise>
	            </c:choose>
            				<!-- 시작페이지부터 끝페이지까지 출력하시오 -->
	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                <li class="page-number"><a class="pageLink" href="list.bo?cpage=${p}">${p}</a></li>
	            </c:forEach>
            
	            <c:choose>
	            	<c:when test="${ pi.nowPage eq pi.maxPage }">  <!-- 현재페이지가 끝페이지이면 넥스트가 안보이게 -->
	                	<li class="page-next disabled"><a class="pageLink" href="#">></a></li>
	                </c:when>
	               	<c:otherwise>										<!-- cpage=현재페이지 (현재페이지+1)을 해서 바로 다음페이지를 보여준다 -->
	               		<li class="page-next"><a class="pageLink" href="list.bo?cpage=${ pi.nowPage+1 }">></a></li>
	               	</c:otherwise>
	            </c:choose>
           </ul>
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
