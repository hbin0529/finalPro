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
           <table class="question_review_table">
                <tr>
                    <td id="table_left" style="width: 80px;"><div id="answer_box" style="background-color: gray; border: 1px solid gray;">답변중</div></td>
                    <td style="font-size: 18px;"><strong>상품</strong></td>
                    <td style="text-align: right; color: rgb(160, 160, 160); font-size: 15px;">${ p.proQueDate }</td>
                </tr>
                <tr>
                    <td id="table_left"><strong>|</strong>&ensp;${ list.proQueType }</td>
                    <td colspan="2" style="font-weight: bolder;"><a href="" style="border-bottom: 2px solid #21d9cb;">${ p.proName }</a></td>
                </tr>
                <tr>
                    <td id="table_left"><strong>|</strong>&ensp;옵션</td>
                    <td colspan="2">블랙</td>
                </tr>
                <tr>
                    <td id="table_qa" style="vertical-align: top; color: #21d9cb; text-align: center;"><strong>Q</strong></td>
                    <td id="table_qa" colspan="2">${ p.proQueContent }
                    </td>
                </tr>
                <tr>
                    <td colspan="3" id="update_delete">
                        <button>삭제</button>
                    </td>
                </tr>
            </table>
         </c:forEach>
    </c:if>  
        
           <!--  <table class="question_review_table">
                <tr>
                    <td id="table_left" style="width: 80px;"><div id="answer_box" style="background-color: #21d9cb; border: 1px solid #21d9cb; ">답변완료</div></td>
                    <td style="font-size: 18px;"><strong>배송</strong></td>
                    <td style="text-align: right; color: rgb(160, 160, 160); font-size: 15px;">2023.01.03</td>
                </tr>
                <tr>
                    <td id="table_left"><strong>|</strong>&ensp;상품</td>
                    <td colspan="2" style="font-weight: bolder;"><a href="" style="border-bottom: 2px solid #21d9cb;">편안한 제주 21cm 본넬스프링 침대 매트리스</a></td>
                </tr>
                <tr>
                    <td id="table_left"><strong>|</strong>&ensp;옵션</td>
                    <td colspan="2">블랙</td>
                </tr>
                <tr>
                    <td id="table_qa" style="vertical-align: top; color: #21d9cb; text-align: center;"><strong>Q</strong></td>
                    <td id="table_qa" colspan="2">
                        안녕하세요 ! 
                        혹시 토요일에 받아보고싶은데 지정일 배송이 가능할까요~?
                        만약 안된다면 문앞에 두고 가시는건 가능할까요~?
                        
                        그리고 엘베없는 3.5층인데 기사님 배송엔 문제없을까요??
                    </td>
                </tr>
                <tr>
                    <td id="table_qa" style="vertical-align: top; color: #21d9cb; text-align: center;"><strong>A</strong></td>
                    <td id="table_qa" colspan="2">
                        안녕하세요, 휴식의섬 휴도, MiMi MD 입니다.
                        저희 휴도를 찾아주셔서 감사합니다!
                        
                        문의하신 [제주 본넬스프링 침대 매트리스 ]상품은 물류기사님이 지역별 묶음배송을 진행하고있어, 지정일배송은 진행하고있지 않습니다ㅜㅜ
                        
                        수도권 지역의 경우 주말 및 우천일을 제외한
                        영업일 기준 최대 7~10일 
                        지방지역의 경우 주말 및 우천일을 제외한
                        영업일 기준 14일 가량 소요되고 있어요!
                        
                        기사님이 배송전날 해피콜드리고 있으며, 해피콜 시 제품수령이 어려우신 경우 빈집설치/문앞배송 또는 기사님을 통하여 다음 기사님스케줄로 일정연기 가능합니다~!
                        
                        제품이동/설치공간은 미리 확보해주셔야합니다!
                        (이동,설치공간 미확보시 반품비용이 청구됩니다.)
                        
                        일정에 참고하셔서 구매부탁드립니다.
                        
                        휴도안에서 늘 건강과 행운이 가득하길 바랍니다.
                        오늘도 휴도하세요 :D
                        
                        ▷카카오톡-휴도 1:1 채팅상담
                        https://pf.kakao.com/_mCxigj
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="color: rgb(160, 160, 160); font-size: 15px;">2023.01.05</td>
                </tr>
                <tr>
                    <td colspan="3" id="update_delete">
                        <button>삭제</button>
                    </td>
                </tr>
            </table> -->            
        </div> 
    </section>

<jsp:include page="../common/footer.jsp"/>   

</body>
</html>