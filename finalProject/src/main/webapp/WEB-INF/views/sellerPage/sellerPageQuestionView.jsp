<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구싶은집 > 판매자 답변내역</title>
<!-- 파비콘 로고 -->
<link rel="icon" href="${path}/resources/img/pavilogo.png">
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
 <style>

    /* -------------------------마이페이지 나의리뷰 문의내역 스타일모음------------------------- */
    .mypage_question_review{width:1000px;margin: 0 auto;}
    .mypage_question_review table{font-family: 'Pretendard-Regular'; padding: 30px; margin-top: 40px; border: 1px solid #dee2e6; border-radius: 5px; margin-bottom: 50px;}
    .question_review_table tr td{padding-bottom: 6px;}
    #table_left{text-align: center; padding-right: 10px; height: 20px;}
    #answer_box{color: white; height: 30px; padding-top: 10px; font-weight: bolder; border-radius: 5px;}
    #table_qa{padding-top: 20px;}
    #update_delete{width: 1000px;  text-align: right;}
    #update_delete button{width: 80px; height: 40px; margin-top: 10px; cursor: pointer; border-radius: 5px;  font-size: 16px; border: 2px solid #21d9cb; background-color: white; font-weight: bolder; font-family: 'Pretendard-Regular';}
    #update_delete button:hover{background-color: #21d9cb; color: white;}
     /*----------------------------------- 모달창 -----------------------------------*/
    
    .modal-body{ font-family: 'Pretendard-Regular'; color: black;}
    .modal-title{text-align: center; font-weight: bolder;}
    .reply_content_title{font-size: 16px; font-weight: bold;}
    .reply_content{margin-top: 20px;}
    .reply_content_detail textarea{width: 560px; height: 250px; padding: 6px; margin-top: 10px; border-color: #d3d3d3; border-radius: 3px; font-size: 17px;}
    .reply_content_detail input{width: 560px; height: 50px; background-color: #21d9cb; color: white; border-style: none; border-radius: 5px; font-weight: bold; font-size: 16px;}
    
 
</style>
  
<body>

<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/sellerPageHeader.jsp" />
 
   <section class="mypage_main_body">
        <div class="mypage_question_review">
   <c:forEach var="p" items="${ list }">   
       <c:choose>
       <c:when test="${  p.proQueResult eq 'Y' }">
    <table class="question_review_table">
                <tr>
                    <td id="table_left" style="width: 80px;"><div id="answer_box" style="background-color: #21d9cb; border: 1px solid #21d9cb; ">답변완료</div></td>
                    <td style="font-size: 18px;"><strong>${ p.proQueType }</strong></td>
                    <td style="text-align: right; color: rgb(160, 160, 160); font-size: 15px;">${ p.proQueDate }</td>
                </tr>
                <tr>
                    <td id="table_left"><strong>|</strong>&ensp;${ p.proQueType }</td>
                    <td colspan="2" style="font-weight: bolder;"><a href="" style="border-bottom: 2px solid #21d9cb;">${ p.proName }${ p.proQueNo }</a></td>
                </tr> 
                <tr>
                    <td id="table_qa" style="vertical-align: top; color: #21d9cb; text-align: center;"><strong>Q</strong></td>
                    <td id="table_qa" colspan="2">${ p.proQueContent } 
                    </td>
                </tr>
                <tr>
                    <td id="table_qa" style="vertical-align: top; color: #21d9cb; text-align: center;"><strong>A</strong></td>
                    <td id="table_qa" colspan="2">${ p.queReplyContent } 
                    </td>
                </tr>  
                <tr>
                    <td colspan="3" id="update_delete">
                    <button type="button" data-toggle="modal" data-target="#myModal"  disabled="disabled" style="cursor:no-drop; background-color:lightgray; color:white; border-style:none;"  id="button_not">답변완료</button>
                    </td>
                </tr>
            </table>                 
                    
                </c:when>
                <c:otherwise> 
                   <table class="question_review_table">
                <tr>
                    <td id="table_left" style="width: 80px;"><div id="answer_box" style="background-color: gray; border: 1px solid gray;">답변중</div></td>
                    <td style="font-size: 18px;"><strong>${ p.proQueType }</strong></td>
                    <td style="text-align: right; color: rgb(160, 160, 160); font-size: 15px;">${ p.proQueDate }</td>
                </tr>
                <tr>
                    <td id="table_left"><strong>|</strong>&ensp;${ p.proQueType }</td>
                    <td colspan="2" style="font-weight: bolder;"><a href="" style="border-bottom: 2px solid #21d9cb;">${ p.proName }${ p.proQueNo }</a></td>
                </tr>
                 <tr>
                    <td id="table_qa" style="vertical-align: top; color: #21d9cb; text-align: center;"><strong>Q</strong></td>
                    <td id="table_qa" colspan="2">${ p.proQueContent }
                    </td>
                </tr>
                <tr>
                    <td colspan="3" id="update_delete">
                      <button type="button" data-value="${ p.proQueNo }" onclick="addReply(this)"  data-toggle="modal" data-target="#myModal" class="open-reply">답변하기</button>
                    </td>
                </tr>
            </table> 
                </c:otherwise>
            </c:choose>  
            
             <!-- 부트스트랩의 모달 창을 사용할려면 아래의 class 이름들을 그대로 사용해야 한다. 변경하면 모양이 달라진다.-->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog"> <!-- 사용자 지정 부분① : id명 -->
    <div class="modal-dialog">  

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">답변하기</h4> <!-- 사용자 지정 부분② : 타이틀 -->
         </div> 
         
        <div class="modal-body">  
           <form action="replyinsert.bo" method="post">
                 <input type="hidden"  name="proQueNo" value="${ p.proQueNo }" id="proQueNo">  
                 <input type="hidden"  name="selNo" value="${ p.selNo }" id="selNo">
                   <div class="reply_content"> 
                    <h5 class="reply_content_title">답변내용</h5>  
                     <div class="reply_content_detail">
                    <textarea name="queReplyContent" placeholder="답변할 내용을 입력해주세요."></textarea>
                    <input type="submit" value="완료">
                </div>   
              </div> 
             </form> 
            </div>  
   </div>
  </div>
</div>           
                     
         </c:forEach>  
         
        </div> 
        
        <script type="text/javascript">
        
         function addReply(arg0){ 
        	 var r = $(arg0).data("value"); 
        	 $("#proQueNo").val(r);
         }
        
        </script>
         
  
    </section>
<jsp:include page="../common/footer.jsp"/>   

</body>
</html>