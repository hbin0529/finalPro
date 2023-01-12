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
  <link href="${pageContext.request.contextPath}/resources/css/homeboard.css" rel="stylesheet" type="text/css">
<body>
    <jsp:include page="../common/header.jsp"/> 
     <main class="content">
       <div class="detail_img"><img src="${path}/resources/img/house_img1.png"></div>
        <section>
        <div>
            <div class="detail_title"><h2>${ h.boardTitle }</h2></div> 
                <div class="detail_title_author_img">
                      <a href="#"><img class="image" src="${path}/resources/img/logo_user.png"></a>
                     <div class="detail_title_author_name">${ h.memNick }</div>
                      <div class="detail_title_author_date">${ h.boardDate }</div> 
                </div>  
        </div>
        <form action="" name="" class="writer_button" >
            <input type="button" value="수정하기">
            <input type="reset" value="삭제하기">
        </form> 
        <div class="project-detail-metadata">
          <table class="project-detail-metadata_table"> 
                <tr class="project-detail-metadata_table_detail_1">
                  <td><img src="${path}/resources/img/apart_img.png" width="25px" style="position: absolute; left: 650px;"></td>
                  <td style="width:100px; display: inline-block;">${ h.homeOption }</td>
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
      <div class="detail_content_img">
        <img src="${path}/resources/img/detail_content_img01.jpeg"> 
      </div>
      <div class="detail_content_text">
          <p>${ h.boardContent }</p>
          <br> 
      </div>

      <div class="detail_content_img">
        <h3 style="color: #21d9cb; font-family: 'Pretendard-Regular'; font-weight: bold; font-size: 30px;" >⚡️3초 컷! 집들이 미리보기</h3>
        <img src="${path}/resources/img/detail_content_img02.jpeg"> 
      </div>
      <div class="detail_content_text">
          <p>2bay에 거실, 주방, 방 2개, 욕실, 발코니가 있는 전형적인 구축 복도식 아파트 구조입니다. 특이한 건 거실과 주방이 직사각형으로 긴 형태입니다. 공사를 진행 하기 전 주방은 매우 좁은 편이었습니니다. 주방과 거실이 작아서 미리 산 가구들을 배치하면 너무 좁아 보이지 않을까.. 걱정했습니다. 또, 수납이 절대적으로 부족한 집이었습니다. 각 방에는 붙박이장을 만들어 수납을 하기로 계획했습니다.</p>
          <br>
      </div>

      <div class="detail_content_img"> 
        <img src="${path}/resources/img/detail_content_img03.jpeg"> 
      </div>
      <div class="detail_content_text">
          <p>인테리어는 자신이 원하는게 무엇인지!를 아는 게 가장 중요하다고 생각합니다.  내가 살 공간이니까요. 저는 취향이 확실한 편이지만 턴 키 상담 전 "나는 어떤 집을 원하지?", "내가 원하는 집의 톤은 어떤 걸까?" 등 스스로에게 끊임없이 질문했습니다.
 </p>
          <br>
          <p>더 확실히 저의 취향을 알기 위해 틈이 날 때마다 인스타그램, 블로그, 오늘의 집 등 여러 SNS에 올라온, 마음에 드는 집들을 저장해두었습니다. 나중에 저장한 집들을 찬찬히 살펴보니 제가 원하는 분위기, 색감 등 제가 좋아하는 것을 파악 할 수 있었습니다. 사진들을 토대로 저만의 레퍼런스를 만들기 시작했습니다. 턴키 상담 시 제가 원하는 구도와 분위기를 보여주기 위함이었습니다. 
 </p>
      </div>
      <div style="margin-top: 60px;"><h3 style="color: #21d9cb; font-family: 'Pretendard-Regular'; font-weight: bold; font-size:30px;">⚡️오늘의 집 회원 PICK!</h3></div>
 <!-- Swiper -->
    <div class="swiper mySwiper"> 
          <div class="swiper-wrapper">
            <div class="swiper-slide">
            <img src="./img/detail_content_buy_img01.jpeg" width="130px">
            <img src="./img/detail_content_buy_img02.jpeg" width="130px">
            <img src="./img/detail_content_buy_img03.jpeg" width="130px">
            <img src="./img/detail_content_buy_img04.jpeg" width="130px">
            <img src="./img/detail_content_buy_img05.jpeg" width="130px"> 
          </div>
        </div>   
     </div>  
      <div class="protect_buttom">
           <img src="${path}/resources/img/protect_buttom.PNG"><div> 
      </div>
          <hr>  
          
       <!-- 댓글 창 -->    
         <table class="table" id="replyArea" style="padding-bottom: 40px;margin-bottom: 5px;">
             <thead>
                <tr class="detail_content_comment_1">
                    <td style="width: 5000px;  display: inline-block; margin-top: 40px">댓글(<span id="rcount">0</span>)</td> 
                </tr>
                <tr>
                    <td><img src="${path}/resources/img/logo_user.png" width="40px"></td>
                    <td><textarea placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)" style="width: 600px; height:45px; padding-left: 6px; border: 1px solid rgb(208, 207, 207); padding-top: 10px; margin-left:8px; border-radius: 3px;"></textarea></td>
                    <td><button style="width: 45px; height: 45px; border: 1px solid gainsboro; margin-left: 6px; padding: 6px;" onclick="addReply();" >입력</button></td>
                </tr>  
             </thead>  
     <!-- 댓글 리스트 -->  
        <tbody style="font-family: 'Pretendard-Regular';"> 
        
        </tbody> 
     
         <%-- <table class="detail_content_comment_detail">
                    <tr>
                        <td rowspan="3" style="vertical-align: top;"><img src="${path}/resources/img/logo_user.png" width="40px"></td>
                        <td colspan="2"></td>
                    </tr>
                    <tr> 
                        <td colspan="2" style="position: relative; left: 48px; top: -40px;"></td>
                    </tr>
                    <tr> 
                        <td style="position: relative; left: 48px; top: -50px;">2022.01.02&ensp; | </td>
                        <td style="position: relative; left: 48px; top: -50px;"><a href="$">수정하기</a></td>
                        <td style="position: relative; left: 48px; top: -50px;"><a href="$">삭제하기</a></td>
                    </tr> 
                <tbody>                        
                </tbody>       
          </table>     --%>
        </table>   
    <!--     <div class="content_paging"><a href="#"><p>1 2 3 4 5 6 7 </p></a> </div> -->
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
                        +    "<td>" + list[i].homeReplyDate + "</td>"
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
                   replyContent:$("#content").val(),
                   replyWriter:"${loginUser.userId}"
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
    </script>
	
    <jsp:include page="../common/footer.jsp"/>
     
</body>
</html>