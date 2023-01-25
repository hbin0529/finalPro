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
<style> 
</style>
<link href="${pageContext.request.contextPath}/resources/css/homeboard.css" rel="stylesheet" type="text/css"> 
<body>
 <jsp:include page="../common/header.jsp"/> 
<main> 
       <div class="detail_img"><img src="${path}/${ h.boardMainimgChange }"></div>
    <section>
        <div>
            <div class="detail_title"><h2>${ h.boardTitle }</h2></div> 
                <div class="detail_title_author_img">
               <c:if test="${empty h.memImg}"> 
                      <a href="#"><img class="image" src="${path}/resources/img/logo_user.png"></a>
                </c:if>
              <c:if test="${!empty h.memImg}"> 
                       <a href="#"><img class="image" src="${path}${h.memImg}" style="width:50px; height:50px; border-radius: 50%;"></a>
               </c:if>
                 
                     <div class="detail_title_author_name">${ h.memNick }</div>
                      <div class="detail_title_author_date">${ h.boardDate }</div> 
                </div>  
        </div>
          <c:if test="${ id eq h.memId }">
               <div class="del_upd_button">
                   <!---수정하기, 삭제하기 버튼은 이글이 본인 글일 경우만 보여져야됨 -->
                   <a class="update_button" onclick="postFormSubmit(1);">수정하기</a>&ensp;
                   <a class="delete_button" onclick="postFormSubmit(2);">삭제하기</a>
               </div>
         </c:if>
         
          <!-- 수정, 삭제시 post방식으로 넘겨주기 -->
          <form action="" method="post" id="postBoard">
            <input type="hidden" name= "bno" value="${ h.boardNo }">
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
          <table class="project-detail-metadata_table"> 
                <tr class="project-detail-metadata_table_detail_1">
                  <td><img src="${path}/resources/img/apart_img.png" width="25px"></td>
                  <td>${ h.homeOption }</td>
              </tr>
         
                <tr class="project-detail-metadata_table_detail_2">
                  <td><img src="${path}/resources/img//home_board_location.png" width="25px"></td>
                  <td>${outputAddr}</td>
                </tr>
        
              <tr class="project-detail-metadata_table_detail_3">
                <td><img src="${path}/resources/img/married_img.png" width="25px"></td>
                  <td>${ h.homeFamilyv }</td>
                </tr> 
        </table>
      </div>
       
      <div class="detail_content_text">
          <p>${ h.boardContent }</p>
          <br>  

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
       $(function() {
          selectReplyList();
       })
       
       function selectReplyList() {
          $.ajax({
             url:"rlist.bo",
             data: {bno:${h.boardNo}},
             success:function(list) {
                let value= "";
                for(let i in list) {
                   value += "<tr>"
                       +    "<th>" + list[i].memNick + "</th>" 
                        +    "<td>" + list[i].homeReplyContent + "</td>"
                        +    "<td>" + list[i].homeReplyDate 
                      
                        if(list[i].memNick==$("#nicknick").val()){
                           value += "&ensp;<button value='"+ list[i].homeReplyNo +"' class='testSpan' onclick='a(this.value)'>삭제</button></td>"
                           		+"</tr>";
                        } 
                       
                      value  += "</td>" 
                        +  "</tr>"; 
                }
                $("#replyArea tbody").html(value);
                $("#rcount").text(list.length);
             },
             error:function() {
                console.log("댓글 리스트 조회용 ajax 통신 실패");
             }
          })
       }
       
       function addReply() {
             if($("#content").val().trim().length != 0) {
                $.ajax({
                   url:"rinsert.bo",
                   data:{
                      refBno:${h.boardNo},
                      homeReplyContent:$("#content").val(),
                      memId:"${id}"
                   },
                   success:function(result) {
                      if(result == "success") {
                         selectReplyList();
                         $("#content").val(""); 
                      }
                   },
                   error:function() {
                      console.log("댓글 작성 ajax 통신 실패");
                   }
                });
             } else {
                alertify.alert("댓글 작성후 등록해 주세요");
             }
          }
       
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