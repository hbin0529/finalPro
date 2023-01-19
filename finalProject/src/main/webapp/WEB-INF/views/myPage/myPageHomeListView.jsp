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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
     /* -------------------------마이페이지 나의리뷰 집들이 스타일모음------------------------- */
   
    .mypage_home_review{width: 1050px; margin: 0 auto; display: flex;   flex-wrap: wrap;  }
   .home_review{padding-bottom: 50px; display: flex; } 
    .home_review_card img{width: 330px; height: 200px;  margin-top:60px; cursor: pointer;  border-radius:6px}
    .home_review_card{font-family: 'Pretendard-Regular'; padding:6px; margin-left:5px}
    .total_count{ width:100px; margin-left:475px; top:55px; position: absolute; top:303px; font-size:13px}
</style>
<body>

<jsp:include page="../common/header.jsp" /> 
<jsp:include page="../common/myPageHeader.jsp" /> 
<jsp:include page="../common/myPageReviewHeader.jsp" />  

     
           <section class="mypage_main_body">
                <div class="mypage_home_review"> 
               <c:forEach var="h" items="${ list }">
                  <c:if test="${ id eq h.memId }">  
                   <div class="home_review">
                      <div class="home_review_list">
                        <div class="home_review_card">
                           <div class="card shadow-sm">
                            <p id="bno"  style="display:none;" >${ h.boardNo }</p>
	                          <img src="${path}/${ h.boardMainimgChange }"> 
	                       <div class="card-body">
	                           <p class="card-text_title"><strong>${ h.boardTitle }</strong></p>
	                       </div>
	                    </div>    
                       </div>
                   </div>
                 </div>  
              </c:if> 
          </c:forEach>
         </div> 
    </section>  
  <!-- 상세페이지 -->
		<script>
			$(function() {
				$(".home_review_list>.home_review_card>div").click(function() { 
					console.log($(this).children("#bno").text())
					location.href = 'mypagehbdetail.bo?bno=' + $(this).children("#bno").text();
				})
				
			})
		</script>
          
<jsp:include page="../common/footer.jsp"/> 
</body>
</html>