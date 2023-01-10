<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="../webapp/resouerces/css/bootstrap.min.css" rel="stylesheet"> 
<link href="../webapp/resouerces/css/homeboard.css" rel="stylesheet"> 
<body>
<jsp include page="../common/header.jsp"/>

 <form action="" method="" id="room_select_option" >
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
       <c:if test="${ not empty loginUser }"> 
           <a class="writer_button" style="float:right" href="enrollForm.bo">글쓰기</a>
          </c:if>      
      </form> 

    <main> 
        <section class="py-5 text-center container"> 
          <div class="row py-lg-5"> 
          </div>
        </section>
        
        <div class="total_count" style="position:relative; left:1px;">전체 7,906</div>
        
        <div class="album py-5 bg-light">
          <div class="container"> 
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"> 
              <div class="col">
                <div class="card shadow-sm">
                  <a href="../html/집들이상세페이지.html"><img alt="이미지1" src="./img/house_img1.png" width="100%" height="225"></a>
                  <div class="card-body">
                    <a href="../html/집들이상세페이지.html"><p class="card-text_title">${ b.boardTitle }</p></a>
                    <a href="../html/집들이상세페이지.html"><p class="card-text_name"><img src="./img/profile_img.png" width="20px" style="margin-right: 7px;">${ b.MemId }</p></a>
                    <div class="d-flex justify-content-between align-items-center"> 
                      <small class="text-muted">조회수 : ${ b.boardCount }</small>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card shadow-sm">
                  <img alt="이미지2" src="./img/house_img2.png" width="100%" height="225"> 
                  <div class="card-body">
                    <p class="card-text_title">월넛, 실버, 화이트를 감각적으로 연출한 구축 리모델링</p>
                    <p class="card-text_name"><img src="./img/profile_img.png" width="20px"  style="margin-right: 7px;">반이홈</p>
                    <div class="d-flex justify-content-between align-items-center"> 
                      <small class="text-muted">조회수 : 2회</small>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card shadow-sm">
                  <img alt="이미지3" src="./img/house_img3.png" width="100%" height="225"> 
                  <div class="card-body">
                    <p class="card-text_title">월넛, 실버, 화이트를 감각적으로 연출한 구축 리모델링</p>
                    <p class="card-text_name"><img src="./img/profile_img.png" width="20px"  style="margin-right: 7px;">친절한냥지씨</p>
                    <div class="d-flex justify-content-between align-items-center"> 
                      <small class="text-muted">조회수 : 2회</small>
                    </div>
                  </div>
                </div>
              </div>
      
              <div class="col">
                <div class="card shadow-sm">
                  <img alt="이미지4" src="./img/house_img4.png" width="100%" height="225"> 
                  <div class="card-body">
                    <p class="card-text_title">월넛, 실버, 화이트를 감각적으로 연출한 구축 리모델링</p>
                    <p class="card-text_name"><img src="./img/profile_img.png" width="20px"  style="margin-right: 7px;">미엘하우스</p>
                    <div class="d-flex justify-content-between align-items-center"> 
                      <small class="text-muted">조회수 : 2회</small>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card shadow-sm">
                  <img alt="이미지5" src="./img/house_img5.png" width="100%" height="225"> 
                  <div class="card-body">
                    <p class="card-text_title">월넛, 실버, 화이트를 감각적으로 연출한 구축 리모델링</p>
                    <p class="card-text_name"><img src="./img/profile_img.png" width="20px"  style="margin-right: 7px;">강화도두번째집</p>
                    <div class="d-flex justify-content-between align-items-center"> 
                      <small class="text-muted">조회수 : 2회</small>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card shadow-sm">
                  <img alt="이미지6" src="./img/house_img6.png" width="100%" height="225"> 
                  <div class="card-body">
                    <p class="card-text_title">월넛, 실버, 화이트를 감각적으로 연출한 구축 리모델링</p>
                    <p class="card-text_name"><img src="./img/profile_img.png" width="20px"  style="margin-right: 7px;">100성</p>
                    <div class="d-flex justify-content-between align-items-center"> 
                      <small class="text-muted">조회수 : 2회</small>
                    </div>
                  </div>
                </div>
              </div>
      
              <div class="col">
                <div class="card shadow-sm">
                  <img alt="이미지7" src="./img/house_img1.png" width="100%" height="225"> 
                  <div class="card-body">
                    <p class="card-text_title">월넛, 실버, 화이트를 감각적으로 연출한 구축 리모델링</p>
                    <p class="card-text_name"><img src="./img/profile_img.png" width="20px"  style="margin-right: 7px;">100성</p>
                    <div class="d-flex justify-content-between align-items-center"> 
                      <small class="text-muted">조회수 : 2회</small>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card shadow-sm">
                  <img alt="이미지8" src="./img/house_img2.png" width="100%" height="225"> 
                  <div class="card-body">
                    <p class="card-text_title">월넛, 실버, 화이트를 감각적으로 연출한 구축 리모델링</p>
                    <p class="card-text_name"><img src="./img/profile_img.png" width="20px"  style="margin-right: 7px;">100성</p>
                    <div class="d-flex justify-content-between align-items-center"> 
                      <small class="text-muted">조회수 : 2회</small>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card shadow-sm">
                  <img alt="이미지9" src="./img/house_img3.png" width="100%" height="225"> 
                  <div class="card-body">
                    <p class="card-text_title">월넛, 실버, 화이트를 감각적으로 연출한 구축 리모델링</p>
                    <p class="card-text_name"><img src="./img/profile_img.png" width="20px"  style="margin-right: 7px;">100성</p>
                    <div class="d-flex justify-content-between align-items-center"> 
                      <small class="text-muted">조회수 : 2회</small>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card shadow-sm">
                  <img alt="이미지9" src="./img/house_img3.png" width="100%" height="225"> 
                  <div class="card-body">
                    <p class="card-text_title">월넛, 실버, 화이트를 감각적으로 연출한 구축 리모델링</p>
                    <p class="card-text_name"><img src="./img/profile_img.png" width="20px" style="margin-right: 7px;">100성</p>
                    <div class="d-flex justify-content-between align-items-center"> 
                      <small class="text-muted">조회수 : 2회</small>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card shadow-sm">
                  <img alt="이미지9" src="./img/house_img3.png" width="100%" height="225"> 
                  <div class="card-body">
                    <p class="card-text_title">월넛, 실버, 화이트를 감각적으로 연출한 구축 리모델링</p>
                    <p class="card-text_name"><img src="./img/profile_img.png" width="20px" style="margin-right: 7px;">100성</p>
                    <div class="d-flex justify-content-between align-items-center"> 
                      <small class="text-muted">조회수 : 2회</small>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card shadow-sm">
                  <img alt="이미지9" src="./img/house_img3.png" width="100%" height="225"> 
                  <div class="card-body">
                    <p class="card-text_title">월넛, 실버, 화이트를 감각적으로 연출한 구축 리모델링</p>
                    <p class="card-text_name"><img src="./img/profile_img.png" width="20px" style="margin-right: 7px;">100성</p>
                    <div class="d-flex justify-content-between align-items-center"> 
                      <small class="text-muted">조회수 : 2회</small>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div> 
      </main> 
<jsp include page="../common/footer.jsp"/> 
</body>
</html>                                                                              