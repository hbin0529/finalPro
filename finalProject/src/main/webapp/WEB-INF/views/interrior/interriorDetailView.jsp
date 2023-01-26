<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의집 > ${ i.interTitle } </title>
<!-- 파비콘 로고 -->
<link rel="icon" href="${path}/resources/img/pavilogo.png">
</head>
<style>
	 .detail_content_text img{
	 	max-width: 720px;
	 }
	 main{
	 	width: 1400px; margin: 0 auto;
	 }
	 .detail_img img{
	 	max-width: 1400px;
	 }
</style>
<link href="${pageContext.request.contextPath}/resources/css/homeboard.css" rel="stylesheet" type="text/css"> 
<body>
 <jsp:include page="../common/header.jsp"/> 
<main> 
       <div class="detail_img"><img src="${path}/${ i.interMainimgChange }"></div>
    <section>
        <div>
            <div class="detail_title"><h2>${ i.interTitle }</h2></div> 
                <div class="detail_title_author_img">
                      <a href="#"><img class="image" src="${path}/resources/img/logo_user.png"></a>
                     <div class="detail_title_author_name">${ i.selBusName }</div>
                      <div class="detail_title_author_date">${ i.interDate }</div> 
                </div>  
        </div>
          <c:if test="${ id eq h.memId and not empty id }">
               <div class="del_upd_button">
                   <!---수정하기, 삭제하기 버튼은 이글이 본인 글일 경우만 보여져야됨 -->
                   <a class="update_button" onclick="postFormSubmit(1);">수정하기</a>&ensp;
                   <a class="delete_button" onclick="postFormSubmit(2);">삭제하기</a>
               </div>
         </c:if>
         
          <!-- 수정, 삭제시 post방식으로 넘겨주기 -->
          <form action="" method="post" id="postBoard">
            <input type="hidden" name= "bno" value="${ i.interNo }">
            <input type="hidden" name="filePath" value="${ h.boardMainimgChange }">         
         </form> 
         
        <script>
            function postFormSubmit(num) {
               if(num == 1) {
                  $("#postBoard").attr("action", "updateForm.bo").submit();
               } else {
                  $("#postBoard").attr("action", "deleteBoard.bo").submit();
               }
            }
         </script>
        
        <div class="project-detail-metadata">
			<table class="project-detail-metadata_table" style="padding-left: 15%;"> 
                <tr class="project-detail-metadata_table_detail_1">
					<td><img src="${path}/resources/img/apart_img.png" width="25px"></td>
					<td>${ i.interHome }</td>
				</tr>
				<tr class="project-detail-metadata_table_detail_3">
					<td><img src="${path}/resources/img/married_img.png" width="25px"></td>
					<td>${ i.interFamily }</td>
				</tr> 
			</table>
      </div>
       
		<div class="detail_content_text">
          <p>${ i.interContent }</p>
          <br>  
		</div>
       <div style="margin-top: 60px;"><h3 style="color: #21d9cb; font-family: 'Pretendard-Regular'; font-weight: bold; font-size:30px;">⚡️오늘의 집 회원 PICK!</h3></div>
 <!-- Swiper -->
    <div class="swiper mySwiper"> 
          <div class="swiper-wrapper">
            <div class="swiper-slide">
            <img src="${path}/resources/img/detail_content_buy_img01.jpeg" width="130px">
            <img src="${path}/resources/img/detail_content_buy_img02.jpeg" width="130px"> 
          </div>
        </div>   
     </div>  
      <div class="protect_buttom">
           <img src="${path}/resources/img/protect_buttom.PNG"><div>  
      </div>   
       
        <%--  <!-- 수정, 삭제시 post방식으로 넘겨주기 -->
         <form action="" method="post" id="postForm">
            <input type="hidden" name= "bno" value="${ b.boardNo }">
            <input type="hidden" name="filePath" value="${ b.changeName }">         
         </form>
      
       --%> 
      
       <!-- 댓글 창 -->    
         <table class="table" id="replyArea" style="padding-bottom: 40px;margin-bottom: 5px;">
      
                <thead>  
                           <tr class="detail_content_comment_1">
                              <td style="width: 5000px;  display: inline-block; margin-top: 40px">댓글(<span id="rcount">0</span>)</td> 
                            </tr>
                
                     <c:choose>
                     <c:when test="${ empty id }">
                          <td><img src="${path}/resources/img/logo_user.png" width="40px"></td>
                           <td><textarea class="form-control" id="content" style="width: 600px; height:45px; padding-left: 6px; border: 1px solid rgb(208, 207, 207); padding-top: 10px; margin-left:8px; border-radius: 3px; font-family: 'Pretendard-Regular'; font-size:16px">로그인한 사용자만 이용가능합니다.</textarea></td>
                           <td><button style="padding:15px; font-size:15px" disabled>입력</button></td>
                     </c:when>
                     <c:otherwise>  
                             <tr>
                                   <td><img src="${path}/resources/img/logo_user.png" width="40px"></td>
                                  <td><textarea class="form-control" id="content" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)" style="width: 600px; height:45px; padding-left: 6px; border: 1px solid rgb(208, 207, 207); padding-top: 10px; margin-left:8px; border-radius: 3px;"></textarea></td>
                                   <td><button onclick="addReply();" style="border-style:none; background-color:white; color:black; font-size:18px; cursor: pointer;">입력</button></td>
                               </tr>  
                       </c:otherwise>
                     </c:choose>  
                 </thead>  
             <tbody style="font-family: 'Pretendard-Regular';"> 
              </tbody>  
               <hr>     
         </table>     
         <form id="postForm" action="delete.bo">
            <input name="rbno" type="hidden" id="test23123">
            <input name="bno" type="hidden" value="${h.boardNo}">
         </form>
 <input type="hidden" value="${ nick }" id="nicknick">	
   </section>
</main>   
         
      <!-- 댓글 ajax -->
    <script type="text/javascript">
     	function a(no){
            $("#postForm #test23123").val(no)
            //$("#postForm").attr("action", "delete.bo").submit();
            $("#postForm").submit();
     	}
       
       $(function(){
          $(document).on("click",$(".testSpan"), function(){
        	 /*
             console.log($(".testSpan").text())
             var inputVal = $(this).siblings("p").val();
             console.log(inputVal)
             $("#postForm #test23123").val(inputVal)
             //$("#postForm").attr("action", "delete.bo").submit();
             //$("#postForm").submit();
             */
          })
       })  
     </script> 
    <jsp:include page="../common/footer.jsp"/>
     
</body>
</html>