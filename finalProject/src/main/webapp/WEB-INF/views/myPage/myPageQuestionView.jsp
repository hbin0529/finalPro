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

</style>
<body>

<jsp:include page="../common/header.jsp" /> 
<jsp:include page="../common/myPageHeader.jsp" /> 
<jsp:include page="../common/myPageReviewHeader.jsp" /> 
 
   <section class="mypage_main_body">
        <div class="mypage_question_review">
   <c:forEach var="p" items="${ list }">   
      <c:if test="${ id eq p.memId }">
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
                    <td colspan="2" style="font-weight: bolder;"><a href="" style="border-bottom: 2px solid #21d9cb;">${ p.proName }</a></td>
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
                       <input type="button" value="삭제" onclick="del(${ p.proQueNo })"  style="width:60px; height:30px; background-color:white; color: #21d9cb; border:1px solid  #21d9cb; border-radius:4px; cursor:pointer;"> 
                         
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
                    <td colspan="2" style="font-weight: bolder;"><a href="" style="border-bottom: 2px solid #21d9cb;">${ p.proName }</a></td>
                </tr>
                 <tr>
                    <td id="table_qa" style="vertical-align: top; color: #21d9cb; text-align: center;"><strong>Q</strong></td>
                    <td id="table_qa" colspan="2">${ p.proQueContent }
                    </td>
                </tr>
                <tr>
                    <td colspan="3" id="update_delete">
                         <input type="button" value="삭제" onclick="del(${ p.proQueNo })"  style="width:60px; height:30px; background-color:white; color: #21d9cb; border:1px solid  #21d9cb; border-radius:4px; cursor:pointer;" > 
                    </td>
                </tr>
            </table> 
				    </c:otherwise>
				</c:choose>           
          </c:if>     
         </c:forEach>  
         
        </div> 
    
     <script>
     

     function del(proQueNo) {
 		var chk = confirm("정말 삭제하시겠습니까?");
 		if (chk) {
 			location.href='qdelete.bo?proQueNo='+proQueNo;
 		}
 	}
     
     </script>
    
    
        
    </section>

<jsp:include page="../common/footer.jsp"/>   

</body>
</html>