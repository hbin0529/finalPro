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
     <main>
       <div class="detail_img"><img src="${path}/resources/img/house_img1.png"></div>
        <section>
        <div>
            <div class="detail_title"><h2>${ h.boardTitle }</h2></div> 
                <div class="detail_title_author_img">
                      <a href="#"><img class="image" src="${path}/resources/img/logo_user.png"></a>
                     <div class="detail_title_author_name">홍길동</div>
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
                  <td><img src="${path}/resources/img/apart_img.png" width="25px"></td>
                  <td>${ h.homeOption }</td>
              </tr>
         
                <tr class="project-detail-metadata_table_detail_2">
                  <td><img src="./img/diretion_img.png" width="25px"></td>
                  <td>서울특별시 서대문구</td>
                </tr>
        
              <tr class="project-detail-metadata_table_detail_3">
                <td><img src="${path}/resources/img/married_img.png" width="25px"></td>
                  <td>${ h.homeFamilyv }</td>
                </tr> 
        </table>
      </div>
      <div class="detail_content_img">
        <img src="../html/img/detail_content_img01.jpeg"> 
      </div>
      <div class="detail_content_text">
          <p>${ h.boardContent }</p>
          <br>
          <p>${ h.boardContent }</p>
      </div>

      <div class="detail_content_img">
        <h3 style="color: #21d9cb; font-family: 'Pretendard-Regular'; font-weight: bold;" >⚡️3초 컷! 집들이 미리보기</h3>
        <img src="../html/img/detail_content_img02.jpeg"> 
      </div>
      <div class="detail_content_text">
          <p>안녕하세요. 결혼 9년 차 아직도 초보 주부인 아내이자 9살 아이의 엄마입니다.공간 꾸미는 것을 좋아해서 가구 배치 바꾸는 것을 즐겨 하고요, 소소한 소품으로 분위기 내는 것을 좋아합니다. 어릴 때 어머니께서 집을 항상 단정하게 쓸고 닦고 가꾸셨는데요, 집에 들어가면 항상 좋은 향기가 감돌고 무척 포근했던 그 느낌이 참 좋았어요.</p>
          <br>
          <p>저도 아이에게 그런 따스한 기억으로 남는 집을 만들어주고 싶어서 늘 노력 중이랍니다. 특별할 것 없는 평범한 공간이지만 저와 비슷한 감성을 가진 분들과 공유하고 싶어서 참여하게 되었습니다. 좋은 제안 주셔서 감사드려요.</p>
      </div>

      <div class="detail_content_img"> 
        <img src="../html/img/detail_content_img03.jpeg"> 
      </div>
      <div class="detail_content_text">
          <p>안녕하세요. 결혼 9년 차 아직도 초보 주부인 아내이자 9살 아이의 엄마입니다.공간 꾸미는 것을 좋아해서 가구 배치 바꾸는 것을 즐겨 하고요, 소소한 소품으로 분위기 내는 것을 좋아합니다. 어릴 때 어머니께서 집을 항상 단정하게 쓸고 닦고 가꾸셨는데요, 집에 들어가면 항상 좋은 향기가 감돌고 무척 포근했던 그 느낌이 참 좋았어요.</p>
          <br>
          <p>저도 아이에게 그런 따스한 기억으로 남는 집을 만들어주고 싶어서 늘 노력 중이랍니다. 특별할 것 없는 평범한 공간이지만 저와 비슷한 감성을 가진 분들과 공유하고 싶어서 참여하게 되었습니다. 좋은 제안 주셔서 감사드려요.</p>
      </div>
      <div style="margin-top: 60px;"><h3 style="color: #21d9cb; font-family: 'Pretendard-Regular'; font-weight: bold;">⚡️오늘의 집 회원 PICK!</h3></div>
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
           <img src="../html/img/protect_buttom.PNG"><div>
        <table class="detail_content_like">
            <tr>
              <td>조회수&ensp;</td>
              <td>11&ensp;&ensp;&ensp;</td>
              <td>댓글&ensp;</td>
              <td>6&ensp;&ensp;&ensp;</td>
              <td>조회수&ensp;</td>
              <td>3,999</td>
            </tr> 
          </table>
      </div>
          <hr>  
         <table class="detail_content_comment">
                <tr class="detail_content_comment_1">
                    <td>댓글&ensp;</td>
                    <td colspan="2"><strong>6</strong></td>
                </tr>
                <tr>
                    <td><img src="../html/img/profile_img.png" width="40px"></td>
                    <td><textarea placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)" style="width: 600px; height:45px; padding-left: 6px; border: 1px solid rgb(208, 207, 207); padding-top: 10px; margin-left:8px; border-radius: 3px;"></textarea></td>
                    <td><button style="width: 45px; height: 45px; border: 1px solid gainsboro; margin-left: 6px; padding: 6px;" >입력</button></td>
                </tr>  
           </table>

         <table class="detail_content_comment_detail">
                    <tr>
                        <td rowspan="3" style="vertical-align: top;"><img src="./img/profile_img.png" width="40px"></td>
                        <td colspan="2">엠지88</td>
                    </tr>
                    <tr> 
                        <td colspan="2" style="position: relative; left: 48px; top: -20px;">저도 거실테이블 궁금합니다~!</td>
                    </tr>
                    <tr> 
                        <td style="position: relative; left: 48px; top: -25px;">2022.01.02&ensp; | </td>
                        <td style="position: relative; left: 48px; top: -25px;"><a href="$">수정하기</a></td>
                        <td style="position: relative; left: 48px; top: -25px;"><a href="$">삭제하기</a></td>
                    </tr>  
                    <tr>
                        <td rowspan="3" style="vertical-align: top;"><img src="./img/profile_img.png" width="40px"></td>
                        <td colspan="2">Heather79</td>
                  </tr>
                  <tr> 
                    <td colspan="2" style="position: relative; left: 48px; top: -20px;">벽지는 어떤 종류에 어떤 색인가요</td>
                  </tr>
                  <tr> 
                    <td style="position: relative; left: 48px; top: -25px;">2022.01.02&ensp; | </td>
                    <td style="position: relative; left: 48px; top: -25px;"><a href="$">수정하기</a></td>
                        <td style="position: relative; left: 48px; top: -25px;"><a href="$">삭제하기</a></td>
                </tr> 

                  <tr>
                      <td rowspan="3" style="vertical-align: top;"><img src="./img/profile_img.png" width="40px"></td>
                      <td colspan="2">쪼랑ㅏ</td>
                </tr>
                <tr> 
                  <td colspan="2" style="position: relative; left: 48px; top: -20px;">거실테이블 정보 궁금해요!!</td>
                </tr>
                <tr> 
                  <td style="position: relative; left: 48px; top: -25px;">2022.01.02&ensp; | </td>
                  <td style="position: relative; left: 48px; top: -25px;"><a href="$">수정하기</a></td>
                        <td style="position: relative; left: 48px; top: -25px;"><a href="$">삭제하기</a></td>
              </tr> 
                <tr>
                    <td rowspan="3" style="vertical-align: top;"><img src="./img/profile_img.png" width="40px"></td>
                    <td colspan="2">음음889</td>
              </tr>
              <tr> 
                <td colspan="2" style="position: relative; left: 48px; top: -20px;">멋져요</td>
              </tr>
              <tr> 
                <td style="position: relative; left: 48px; top: -25px;">2022.01.02&ensp; | </td>
                <td style="position: relative; left: 48px; top: -25px;"><a href="$">수정하기</a></td>
                        <td style="position: relative; left: 48px; top: -25px;"><a href="$">삭제하기</a></td>
            </tr>  
     </table>    
        <div class="content_paging"><a href="#"><p>1 2 3 4 5 6 7 </p></a> </div>      
</section>
</main> 
    <jsp:include page="../common/footer.jsp"/>
  
</body>
</html>