<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구싶은집 > ${ p.proName }</title>
<!-- 파비콘 로고 -->
<link rel="icon" href="${path}/resources/img/pavilogo.png">
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script>
$(function() {
   $("#proCnt").change(function(e){
      $("#sumPrice").text( (parseInt($("#proCnt").val()) * parseInt($("#proPrice").val())) );
   })
})


</script>
<style>
    /* 로고폰트 */
        @font-face {
        font-family: 'SDSamliphopangche_Outline';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        } 
    /* 메뉴폰트 */
    @font-face {
        font-family: 'GmarketSansMedium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        }
    /* 본문내용폰트 */
        @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
        }
   a{text-decoration:none; color:black;}
   /*----------------------------------- 상품 헤더 스타일모음-------------------------------------------- */
    .main_body{width: 1400px; margin: 0 auto; }
    .product_header{display: flex; width: 1200px; margin: 0 auto; padding-top: 100px;}
    .product_small_img img{width: 100px; margin-bottom: 10px; margin-right: 20px; border-radius: 5px;}
    .product_main_img img{width: 600px; height:600px; border-radius: 5px; margin-right: 40px; margin-bottom: 100px;}
    .product_intro{margin-top: 10px; font-family: 'Pretendard-Regular';}
    .intro_review{display: flex; margin-bottom: 10px;}
    .intro_review div:nth-child(1){color: #21d9cb; font-size: 25px;}
    .intro_review div:nth-child(2){font-size: 14px; height: 35px; color: rgb(131, 131, 131); margin-left: 5px; margin-top: 7px;}
    .intro_home_img{display: flex;}
    .product_header select{width: 400px; height: 50px; padding-left: 5px; font-size: 15px; border-color: rgb(202, 202, 202); border-radius: 5px; margin-bottom: 10px;}
    .order_price{display: flex;}
    .intro_btn{display: flex; font-family: 'Pretendard-Regular';}
    #btnbtn{width: 200px; height: 50px; font-size: 18px; font-weight: bolder; margin-right: 10px; background-color: #21d9cb; 
    border: 1px solid #21d9cb; color: white; cursor: pointer; border-radius: 5px; text-align:center;}
    #btnbtn a, #btnbtn1 a{text-decoration:none;}
    #btnbtn1{width: 200px; height: 50px; font-size: 18px; font-weight: bolder; margin-right: 10px; background-color: black;
    border: 1px solid black; color: white; cursor: pointer; border-radius: 5px; text-align:center;}
    #buy{margin-top:15px; color:white; font-size: 18px;}
    #delete{margin-top:10px; color:white; font-size: 18px;}
   /*----------------------------------- 상품 바디 카테고리 바 -----------------------------------*/
    .product_body{height: 100%;}
    .body_category{margin-top: 100px;}
    .product_body_category{display: flex; background-color: rgb(252, 252, 252); width:1900px; margin-left:-250px; overflow: auto;
    position: -webkit-sticky;
    position: sticky;
    z-index: 100;
    top:0; height: 60px; border-top: 1px solid rgb(214, 214, 214); border-bottom: 1px solid rgb(214, 214, 214); margin-bottom: 50px;}
    .product_body_category p{margin-top: 22px; font-family: 'GmarketSansMedium'; font-weight: bolder;}
    .product_body_category a:hover{color: #21d9cb;}
    .product_body_category_review{display: flex;}
    .product_body_category_question{display: flex;}

    /*-----------------------------------  상품 디테일 설명 -----------------------------------*/
    .product_detail{width: 1150px; margin: 0 auto; display: flex; margin-top: 50px; padding-left:200px;}
    .left_detail_img{width:800px; margin-bottom: 50px; margin-right: 20px; }
    #detail_img{width: 800px; margin-bottom:100px; margin-top:50px;}
    .detail_information_table{width: 800px; text-align: left; font-size: 13px; margin-bottom: 100px; height: 300px; border-collapse: collapse; font-family: 'Pretendard-Regular'; }
    .detail_information_table td:nth-child(1){width: 180px; color: gray;}
    .detail_information_table tr td{border-bottom: 1px solid rgb(224, 224, 224);}

     /*-----------------------------------  리뷰 별점 -----------------------------------*/
    .bottom_review{height: 300px; }
    .review_box{display: flex; width: 850px; height: 200px; margin: 0 auto; background-color: rgb(243, 243, 243); border-radius: 5px; font-family: 'Pretendard-Regular';}
    .bottom_review_star{display:flex; margin-bottom: 20px; font-size: 20px; font-weight: bolder; font-family: 'GmarketSansMedium';}
    .bottom_star{width: 350px;}
    .bottom_star p{font-size: 28px; font-weight: bolder; font-family: 'Pretendard-Regular';}
    .bottom_star p:nth-child(1) {vertical-align: middle; width: 250px; color: #21d9cb;}
    .review_table{background-color: rgb(243, 243, 243); width: 450px; margin: 0 auto;}
    .review_table table {margin: 0 auto; border-collapse: collapse; margin-top: 20px;}
    .review_table table tr td{font-size: 13px; border-collapse: collapse; padding-bottom: 5px; vertical-align: middle;}
    .review_table table tr td:nth-child(1){width: 50px; color: rgb(102, 102, 102);}
    .review_table table tr td:nth-child(2){width: 150px; font-size: 20px; color: #21d9cb;}
    .review_table table tr td:nth-child(3){width: 50px; padding-left: 10px; color: rgb(102, 102, 102);}

    /*-----------------------------------  리뷰 상세 -----------------------------------*/
    .review_detail table{ width: 800px; border-collapse: collapse; border-top: 1px solid gray;  border-top: 1px solid rgb(221, 221, 221); font-family: 'Pretendard-Regular';}
    #review_user_img{width: 30px; height:30px; border-radius:50%; padding-left: 10px; padding-top: 15px;}
    #review_nickname{padding-left: 10px; padding-top: 20px; width: 40px; font-size: 13px; font-weight: bolder; color: rgb(77, 76, 76);;}
    #review_date{font-size: 12px; color: rgb(77, 76, 76); padding-top: 3px; padding-left:10px;}
    #review_option{font-size: 13px; padding-left: 10px; padding-top: 5px; color: rgb(77, 76, 76);}
    #review_main_img{padding-left: 10px; width: 130px; padding-top: 10px;}
    #user_review{border-radius: 5px;   width: 150px; height: 150px;}
    #review_text{font-size: 15px; padding-left: 10px; padding-top: 10px; padding-bottom: 40px;}
    #user_review_star{padding-left: 10px; width: 90px; color: #21d9cb; font-size: 16px;}
    #user_img{width: 40px; width: 40px; border-radius:50%;}
    .review_paiging{text-align: center; margin-bottom: 30px; margin-top: 20px; font-family: 'Pretendard-Regular';}
    
    /*-----------------------------------  문의하기 -----------------------------------*/
    .bottom_question_title{display: flex; padding-bottom: 30px; padding-top: 50px; font-size: 20px; font-weight: bolder; font-family: 'GmarketSansMedium';}
    .bottom_question_title p{margin-top: 10px;}
    .bottom_question_title p:nth-child(2){color: #21d9cb; padding-left: 10px; font-family: 'Pretendard-Regular';}
    .bottom_question_title div{width: 700px; text-align: right;}
    .bottom_question_title button{width: 80px; height: 40px;cursor: pointer; border-radius: 5px;  font-size: 16px; border: 1px solid #21d9cb; background-color: #21d9cb; color: white; font-weight: bolder; font-family: 'Pretendard-Regular';}
    .bottom_question{display: flex;}
    .bottom_answer_title{display: flex;}
    .question_answer{padding: 15px; margin-bottom: 30px;}
    .question_nickname_date{font-family: 'Pretendard-Regular'; font-size: 12px; color: gray; }
    .bottom_question{font-family: 'Pretendard-Regular';}
    .bottom_answer_title{font-family: 'Pretendard-Regular';}
    .bottom_question div:nth-child(1){color: #21d9cb; font-weight: bolder; margin-right: 10px;}
    .bottom_question div:nth-child(2){ font-size: 15px; margin-bottom: 10px;}
    .bottom_answer_title div:nth-child(1){color: #21d9cb; font-weight: bolder; margin-right: 10px;}
    .bottom_answer_title div:nth-child(2){font-weight: bolder; margin-right: 5px;}
    .bottom_answer_title div:nth-child(3){font-size: 13px; color:gray; margin-top: 3px;}
    .bottom_answer{font-size: 15px; margin-left: 20px; margin-bottom: 10px; font-family: 'Pretendard-Regular';}
    .question_paiging{text-align: center; margin-bottom: 30px; margin-top: 20px;}
    /*----------------------------------- 판매자정보 -----------------------------------*/
    .seller_information_table{width: 800px; text-align: left; font-size: 13px; margin-bottom: 100px; height: 300px; border-collapse: collapse; font-family: 'Pretendard-Regular';}
    .seller_information_table td:nth-child(1){width: 180px; color: gray;}
    .seller_information_table tr td{border-bottom: 1px solid rgb(224, 224, 224);}
    #seller_information{padding-bottom: 30px; padding-top: 50px; font-size: 20px; font-weight: bolder; font-family: 'GmarketSansMedium';}
    /*----------------------------------- 모달창 -----------------------------------*/
   .modal-body{ font-family: 'Pretendard-Regular'; color: black;}
    .modal-title{text-align: center; font-weight: bolder;}
    .product-question__wrap__type-select__box--select { color: #21d9cb;background-color: white;font-weight: 700;border-color: rgb(222, 222, 222);}
    .inquire_option_title, .inquire_content_title{font-size: 16px; font-weight: bold;}
    .product-question__wrap__type-select__box {margin-top: 13px;display: inline-block;width: 160px;margin-left: 10px;box-sizing: border-box;border: 1px solid #dcdcdc;text-align: center;
    height: 40px;line-height: 40px;color: #424242;cursor: pointer;border-radius: 3px;font-size: 15px;}
    .product-question__wrap__type-select__box:hover{background-color: #21d9cb;color: white;}
    .inquire_content{margin-top: 20px;}
    .product-question__wrap__type-select{text-align: center;}
    .inquire_content_detail textarea{width: 560px; height: 250px; padding: 6px; margin-top: 10px; border-color: #d3d3d3; border-radius: 3px;}
    .inquire_content_detail button{width: 560px; height: 50px; background-color: #21d9cb; color: white; border-style: none; border-radius: 5px; font-weight: bold; font-size: 16px;}
    .modal-footer_text{text-align: left; font-size: 13px;}
    .type_label{margin-right: 40px;}
    .type_label input{ background-color: #21d9cb; color: #21d9cb; width: 20px; margin-right: 10px; text-align: center;}
    .type_label input:nth-child(1){margin-left: 12px;}
    .type_label span{cursor: pointer; font-size: 20px; text-align: center; text-align: center; vertical-align: middle;}
    .modal-footer_text{text-align: left; font-size: 13px;}
</style>
<script>
   function myPicture(itSrc){
      $(function(){
         $("#thisPlace").attr("src",itSrc);
      })
   }
</script>


<body>
   <jsp:include page="../common/header.jsp" />

    <!---------------------------------- 상품 메인 사진 ---------------------------------->
    <section>
        <div class="main_body">
            <div class="product_header">
                <div class="product_small_img">
                    <div><img src="${path}/${p.proChangeImg}" onclick="myPicture(this.src)"></div>
                    <div><img src="${path}/${p.proChangeImg1}" onclick="myPicture(this.src)"></div>
                </div>
                <div class="product_main_img">
                    <div><img src="${path}/${p.proChangeImg}" id="thisPlace"></div>
                </div>
                <div class="product_intro">
                    <div><p style="margin-bottom: 10px; color: rgb(109, 108, 108); font-size: 15px; font-weight: bold;">카테고리 | ${ p.cateName }</p></div>
                    <div><p style="margin-bottom: 10px; font-size: 25px; font-weight: bolder;" >${ p.proName }</p></div>
                    <div class="intro_review">
                        <div><p>★★★★★</p></div>
                        <div><p><span id="rcount">0</span>개 리뷰</p></div>
                    </div>
                    <div><p style="margin-bottom: 10px; font-size: 35px; font-weight: bolder;" >${ p.proPrice } 원</p></div>
                    <input type="hidden" value="${ p.proPrice }" id = "proPrice">
                    <div><p style="margin-bottom: 10px; font-size: 15px;">&ensp;업체직접배송</p></div><br>
                    <div style="margin-bottom: 10px;"><hr style="width: 400px;"></div><br>
                    <div class="intro_home_img" style="margin-bottom: 30px;">
                        <div><img src="${path}/resources/img/logo_home.png" style="width: 30px; margin-left: 10px;"></div>
                        <div><p style="margin-top: 4px; color: rgb(109, 108, 108); font-size: 17px; font-weight: bold;">&ensp;${ p.selBusName }</p></div>
                    </div>
                    <form name="hbInfo" action="order.or">
                    <div>
                        <select name="colorSelect" id="colorSelect">
                            <option>색상선택</option>
                            <option value="BLACK">BLACK</option>
                            <option value="WHITE">WHITE</option>
                        </select>
                    </div>
                    <div id="proCntBox"> 
                        <select id="proCnt" style="margin-bottom: 30px;" name="countSelect">
                            <option>수량선택</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                    </div>
                    <div class="order_price">
                        <div><p style="font-size: 13px; font-weight: bolder; margin-top: 5px; margin-bottom: 30px;">주문금액</p></div>
                        <div><p style="width:350px; text-align: right; font-size: 25px; font-weight: bolder;" id="sumPrice">0</p></div>
                    </div>
                    <div class="intro_btn">
                       <c:choose>
                          <c:when test="${selNo eq p.selNo }">
                              <div id="btnbtn1"><a onClick="postFormSubmit(1);"><p id="delete">수정하기</p></a></div>
                              <div id="btnbtn1"><a onClick="postFormSubmit(2);"><p id="delete">삭제하기</p></a></div>
                          </c:when>
                           <c:otherwise>
                              <c:if test="${ not empty permit }">
                                  <div id="btnbtn"><a onclick="cartInsert()"><p id="buy">장바구니</p></a></div>
                                   <div id="btnbtn"><a onclick="directBuy()"><p id="buy">바로구매</p></a></div>
                                    <script type="text/javascript">
                                       function directBuy() {
                                          if(document.getElementById("colorSelect").value=='색상선택'||document.getElementById("proCnt").value=='수량선택'){
                                             alert('구매 옵션을 선택해주세요');
                                             return;
                                          }
                                          hbInfo.submit();
                                       }
                                       
                                        function cartInsert() {
                                           if(document.getElementById("colorSelect").value=='색상선택'||document.getElementById("proCnt").value=='수량선택'){
                                             alert('옵션을 선택해주세요');
                                             return;
                                          } else {
                                          var color = document.getElementById("colorSelect").value
                                          document.getElementById("color_otp").value = color;
                                          
                                          var amount = document.getElementById("proCnt").value
                                          document.getElementById("cart_amount").value = amount;
                                          
                                          cartForm.submit();
                                          }
                                        } 
                                    $(function(){
                                    })
                                    </script>
                                  <input type="hidden" value="${ p.proNo }" name="proNo">
                                     <input type="hidden" value="${ p.selBusName }" name="selBusName">
                                    <input type="hidden" value="${ p.proName }" name="proName">
                                    <input type="hidden" value="${ p.proPrice }" name="proPrice">
                                    <input type="hidden" value="${ p.proChangeImg }" name="proChangeImg">
                                    <input type="hidden" value="${ p.proWhiteStock }" name="proWhiteStock">
                                    <input type="hidden" value="${ p.proBlackStock }" name="proBlackStock">
                              </c:if>
                              <c:if test="${ empty permit }">
                                  <div id="btnbtn"><a onClick="directBuy()"><p id="buy">장바구니</p></a></div>
                                    <div id="btnbtn"><a onclick="directBuy()"><p id="buy">바로구매</p></a></div>
                                    <script type="text/javascript">
                                       function directBuy() {                                    
                                          alert('로그인 후 이용해주세요')
                                          return;
                                       }
                                    </script>
                                     <input type="hidden" value="${ p.selBusName }" name="selBusName">
                                    <input type="hidden" value="${ p.proName }" name="proName">
                                    <input type="hidden" value="${ p.proChangeImg }" name="proChangeImg">
                                    <input type="hidden" value="${ p.proPrice }" name="proPrice">
                                    <input type="hidden" value="${ p.proWhiteStock }" name="proWhiteStock">
                                    <input type="hidden" value="${ p.proBlackStock }" name="proBlackStock">
                              </c:if>
                           </c:otherwise>
                        </c:choose>
                  </form>
                  
                  <!-- 장바구니 누르면 아래것들 넘겨줘야함 -->
                  <form name="cartForm" action="cartInsert.ca" method="post" id="cartForm">
                     <input type="hidden" value="" id="color_otp" name="cartOption">
                     <input type="hidden" value="" id="cart_amount" name="cartAmount">
                     <input type="hidden" name="proPrice" value="${ p.proPrice }" >
                     <input type="hidden" name="proNo" value="${ p.proNo }">
                     <input type="hidden" name="selNo" value="${ p.selNo }">
                     <input type="hidden" name="proChangeImg" value="${ p.proChangeImg }" >
                     <input type="hidden" name="memEmail" value="${ id }">
                  </form>
                  
                  <!-- 상품수정, 삭제시 post방식으로 넘겨주기 -->
                  <form action="#" method="post" id="postForm">
                     <input type="hidden" name="proNo" value="${ p.proNo }">
                     <input type="hidden" name="filePath" value="${ p.proChangeImg }"> <!-- 파일도 삭제해줘야해서 같이넘기기 -->
                  </form>
                  <script>
                     function postFormSubmit(num) {
                        if(num == 1) {
                           $("#postForm").attr("action" , "productUpdate.bo").submit();
                        } else {
                           $("#postForm").attr("action" , "productDelete.bo").submit();
                        }
                     }
                  </script>
                  
                    </div>
                </div>
            </div>
         <script>
            function queFormSubmit(num) {
                  if(num == 1) {
                     $("#queForm").attr("action" , "qdelete.bo").submit(); //submit 넣어줘야 이동함
                  }
               }
         </script>
         
            <div class="product_body">
                <!--메뉴바-->
                <div class="body_category">
               <div class="product_body_category">
                  <div><p style="width: 220px; margin-left: 680px; "><a href="#tag3">상품정보</a></p></div>
                  <div class="product_body_category_review" style="width: 220px;">
                     <div><a href="#tag2"><p style="margin-right: 10px;">리뷰</p></div>
                     <div><p style="color: gray;"><span id="rcount1">0</span></p></div>
                  </div>
                  <div class="product_body_category_question" style="width: 220px;">
                     <div><a href="#tag1"><p style="margin-right: 10px;">문의</p></div>
                     <div><p style="color: gray;" id="qcount">0</p></a></div>
                  </div>
                    </div>
            
         

                <!-- 상품디테일 -->
                <div class="product_detail">
                    <!--왼쪽 상품정보-->
                    <div class="left_detail_img">
                        <!--상품정보-->
                        <a id="tag3"><p style="font-weight: bolder; font-size: 20px;">상품정보</p><br><br></a>
                        <div style="text-align: center;"><img src="${path}/${p.proChangeDetailimg }" id="detail_img"></div>
                        <table class="detail_information_table">
                            <tr>
                                <td>품명</td>
                                <td>상세페이지참조</td>
                            </tr>
                            <tr>
                                <td>색상</td>
                                <td>상세페이지참조</td>
                            </tr>
                            <tr>
                                <td>품질보증기준</td>
                                <td>이 제품은 기획재정부 고시 소비자 피해 보상 규정에 따라 보상 받을 수 있습니다.
                                </td>
                            </tr>
                            <tr>
                                <td>제조국</td>
                                <td>한국</td>
                            </tr>
                            <tr>
                                <td>배송/설치비용</td>
                                <td>상세페이지참조</td>
                            </tr>
                            <tr>
                                <td>A/S책임자와 전화번호</td>
                                <td>${ p.selPhone }</td>
                            </tr>
                        </table>

                        <!--리뷰별점-->
                        <div class="bottom_review">
                            <div class="bottom_review_star"> 
                                <a id="tag2"><p>리뷰</p></a>
                                <p style="color: #21d9cb; padding-left: 10px;"><span id="rcount2">0</span></p>
                            </div>
                            <div style="display: flex;">
                                <div class="review_box">
                                    <div class="bottom_star" >
                                       <c:if test="${ stars[0]+stars[1]+stars[2]+stars[3]+stars[4] > 0 }">
                                           <p style="margin-left:100px; margin-top:60px;"><span style="margin-right:10px;">별점</span><img src="${ path }/resources/img/review_star_empty.png" style="position:absolute"><img src="${ path }/resources/img/review_star_full.png" style="position:absolute; object-fit: none; object-position:0% 50%; height:32px; width: calc(${ ((stars[0]*1+stars[1]*2+stars[2]*3+stars[3]*4+stars[4]*5)/(stars[0]+stars[1]+stars[2]+stars[3]+stars[4]))/5 }*160px);"></p>
                                           <p><span style="font-size:20px; color:rgb(141, 141, 141); margin-left:160px;">(평균 <fmt:formatNumber value="${ (stars[0]*1+stars[1]*2+stars[2]*3+stars[3]*4+stars[4]*5)/(stars[0]+stars[1]+stars[2]+stars[3]+stars[4]) }" pattern=".0"/>점)</span></p>
                                       </c:if>
                                       <c:if test="${ stars[0]+stars[1]+stars[2]+stars[3]+stars[4] == 0 }">
                                           <p style="padding-top: 80px; font-size:22px; position:relative; top:9px; margin-left:100px;">등록된 별점이 없습니다</p>
                                       </c:if>
                                    </div>
                                    <div class="review_table">
                                        <table>
                                            <tr>
                                                <td>5점</td>
                                                <td>★ ★ ★ ★ ★</td>
                                                <td>${ stars[4] }개</td>
                                            </tr>
                                            <tr>
                                                <td>4점</td>
                                                <td>★ ★ ★ ★ ☆</td>
                                                <td>${ stars[3] }개</td>
                                            </tr>
                                            <tr>
                                                <td>3점</td>
                                                <td>★ ★ ★ ☆ ☆</td>
                                                <td>${ stars[2] }개</td>
                                            </tr>
                                            <tr>
                                                <td>2점</td>
                                                <td>★ ★ ☆ ☆ ☆</td>
                                                <td>${ stars[1] }개</td>
                                            </tr>
                                            <tr>
                                                <td>1점</td>
                                                <td>★ ☆ ☆ ☆ ☆</td>
                                                <td>${ stars[0] }개</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div> 
                        </div>
                        
                        <!--리뷰상세-->
                        <div class="review_detail">
                            <table>
                     <!-- 자바스크립트 reviewList -->
                            </table>
                        </div>
                        
                  <!-- 부트스트랩의 모달 창을 사용할려면 아래의 class 이름들을 그대로 사용해야 한다. 변경하면 모양이 달라진다.-->
                  <!-- Modal -->
                        <div class="modal fade" id="myModal" role="dialog"> <!-- 사용자 지정 부분① : id명 -->
                          <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">×</button>
                                <h4 class="modal-title">상품 문의하기</h4> <!-- 사용자 지정 부분② : 타이틀 -->
                              </div>
                              <form action="qinsert.bo" id="queWrite" method="post">
                                 <input type="hidden" value="${ id }" name="memId" id="memId">
                                 <input type="hidden" value="${ id }" name="memEmail" id="memId">
                                 <input type="hidden" value="${ p.proNo }" name="proNo">
                                 <input type="hidden" value="${ p.selNo }" name="selNo">
                                <div class="modal-body">
                                  <div class="inquire_option">
                                    <h5 class="inquire_option_title">문의유형</h5>
                                    <div class="product-question__wrap__type-select" >
                                      <label class="type_label">
                                        <input class="product-question__wrap__type-select__box product-question__wrap__type-select__box--select"
                                          type="radio" value="상품" name="proQueType" style="vertical-align: middle;" id="proQueType" required><span>상품</span>
                                      </label>
                                      <label class="type_label">
                                        <input class="product-question__wrap__type-select__box product-question__wrap__type-select__box--select"
                                          type="radio" value="배송" name="proQueType" style="vertical-align: middle;" id="proQueType"><span>배송</span>
                                      </label>
                                      <label class="type_label">
                                        <input class="product-question__wrap__type-select__box product-question__wrap__type-select__box--select"
                                          type="radio" value="기타" name="proQueType" style="vertical-align: middle;" id="proQueType"><span>기타</span>
                                      </label>
                                    </div>
                                  </div><!--inquire_option 까지-->
                                  
                                  <div class="inquire_content">
                                    <h5 class="inquire_content_title">문의내용</h5>
                                    <div class="inquire_content_detail">
                                      <textarea id="proQueContent" placeholder="문의내용을 자세하게 작성해주시면 답변에 큰 도움이 됩니다.(최소 20자 이상)" name="proQueContent" required></textarea>
                                      <button onClick="addQuestion();">등록하기</button>
                                    </div>
                                  </div>
                                </div><!--review_write 까지-->
                              </form>
                              
                              
                      
                              <div class="modal-footer">
                                <div class="modal-footer_text">- 문의내용에 대한 답변은 ‘마이페이지 > 나의리뷰 > 문의내역’ 또는 ‘상품 상세페이지’에서 확인 가능합니다.</div>
                                <div class="modal-footer_text">- 배송,결제,교환/반품 문의는 각 제품의 판매처로 문의 바랍니다.</div>
                                <div class="modal-footer_text">- 상품과 관련 없거나 부적합한 내용을 기재하시는 경우, 사전 고지 없이 삭제 또는 차단될 수 있습니다.</div>
                              </div>
                            </div>
                          </div>
                        </div>

                        <!--문의-->
                        <div>
                            <!--문의상단 바-->
                           <div class="bottom_question_title">
                                <a id="tag1"><p>문의</p></a>
                                <p id="qcount1">0</p>
                                   <c:choose>
                                      <c:when test="${ empty id or permit eq 2}">
                                         <div><button type="button" data-toggle="modal" data-target="#myModal" style="display:none;">문의하기</button></div>
                                      </c:when> 
                                      <c:otherwise>
                                         <div><button type="button" data-toggle="modal" data-target="#myModal">문의하기</button></div>
                                      </c:otherwise>      
                                   </c:choose>
                                    
                            </div>
                            
                            <!--질문답변-->
                             <div class="question_answer">
                                
                            </div>
                            
                           
                            <!--판매자정보 테이블-->
                            <div>
                                <p id="seller_information">판매자 정보</p>
                            </div>
                            <div>
                                <table class="seller_information_table">
                                    <tr>
                                        <td>상호</td>
                                        <td>${ p.selBusName }</td>
                                    </tr>
                                    <tr>
                                        <td>대표자</td>
                                        <td>${ p.selName }</td>
                                    </tr>
                                    <tr>
                                        <td>사업장소재지</td>
                                        <td>${ p.selAddr } ${ p.selDetailAddr }</td>
                                    </tr>
                                    <tr>
                                        <td>고객센터 전화번호</td>
                                        <td>${ p.selPhone }</td>
                                    </tr>
                                    <tr>
                                        <td>E-mail</td>
                                        <td>${ p.selEmail }</td>
                                    </tr>
                                    <tr>
                                        <td>사업자 등록번호</td>
                                        <td>${ p.selBusNo }</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>               
                </div>
            </div>
      </div>
         <form id="deleteQue" action="qdelete.bo">
            <input name="proQueNo" type="hidden" id="test23123">
         </form>
    </section>
    
    
    <script>
       $(function(){
         selectReviewList();
      })
      
      function selectReviewList(){
          $.ajax({
            url:"reviewlist.bo",
            data:{pno:${p.proNo}},
            success:function(list){
               let value = "";
               for(let i in list) {
                  if ( list[i].reviewImgChange != null) {
                  value += "<tbody>"
                       +    "<tr>"
                       +         "<td rowspan='2' id='review_user_img'><img src='${path}/" + list[i].memImg + " ' id='user_img'></td>"
                       +         "<td colspan='2' id='review_nickname'>" + list[i].memNick + "</td>"
                       +     "</tr>"
                       +     "<tr>" 
                       +  "<td id='review_date'>"  +list[i].reviewDate + "</td>"     
                       +     "</tr>"
                       +     "<tr>"
                       +         "<td colspan='3' id='review_option'> 옵션 :"+ list[i].ordOption + "</td>"
                       +     "</tr>"
                       +     "<tr>"
                       +         "<td colspan='3' id='review_main_img'><img src='${path}/" + list[i].reviewImgChange + "' id='user_review'></td>"      
                       +     "</tr>"
                       +     "<tr>"      
                       +         "<td colspan='3' id='review_text'>" + list[i].reviewContent + "</td>"           
                       +       "</tr>"
                       + "</tbody>"
                       + "<hr>";
                        } else {
                  value += "<tbody>"
                       +    "<tr>"
                       +         "<td rowspan='2' id='review_user_img'><img src='${path}/" + list[i].memImg + " ' id='user_img'></td>"
                       +         "<td colspan='2' id='review_nickname'>" + list[i].memNick + "</td>"
                       +     "</tr>"
                       +     "<tr>" 
                       +  "<td id='review_date'>"  +list[i].reviewDate + "</td>"     
                       +     "</tr>"
                       +     "<tr>"
                       +         "<td colspan='3' id='review_option'> 옵션 :"+ list[i].ordOption + "</td>"
                       +     "</tr>"
                       +     "<tr>"      
                       +         "<td colspan='3' id='review_text'>" + list[i].reviewContent + "</td>"           
                       +       "</tr>"
                       + "</tbody>"
                       + "<hr>";
                        }
               }
               $(".review_detail table").html(value);
               $("#rcount").text(list.length);
               $("#rcount1").text(list.length);
               $("#rcount2").text(list.length);
            },
            error:function(){
               console.log("댓글리스트 조회용 ajax 통신 실패");
            }
         });
      }
       
       
       $(function(){
         selectQuestionList();
      })
      
      function selectQuestionList(){
          $.ajax({
            url:"qlist.bo",
            data:{pno:${p.proNo}},
            success:function(list){
               let value = "";
               for(let i in list) {
                  if (list[i].proQueResult == "Y"){
                  value += "<div class='user_question'>"
                       +    "<div class='question_nickname_date'>"
                       +         "<div style='display:flex;'>"
                       +            "<p style='color:#21d9cb; width:45px; text-align:center; height:20px; padding-top:2px; font-weight: bolder;'>답변완료</p>"
                             if(list[i].memId == $("#memId").val()){
                   value +=         "<a onClick='queFormSubmit(1);' style='width:45px; text-align:center; height:20px; padding-top:2px; font-weight: bolder;'>삭제</a>"
                                } 
                  value +=      "</div>"  
                        +       "<form action='' method='post' id='queForm'><input type='hidden' name='proQueNo' value='" +list[i].proQueNo+ "'></form>"                  
                       +         "<p>" + list[i].memNick + " | " + list[i].proQueDate + "</p>"
                       +      "</div>"
                       +    "<div class='bottom_question'>"
                       +         "<div><p>Q</p></div>"
                       +         "<div>"
                       +            "<p>" + list[i].proQueContent + "</p>"
                       +         "</div>"
                       +      "</div>"
                       + "</div>" 
                       + "<div class='seller_answer'>"
                       +    "<div class='bottom_answer_title'>"
                       +       "<div><p>A</p></div>"
                       +       "<div><p>" + list[i].selBusName + "</p></div>"
                       +       "<div><p>" + list[i].queReplyDate + "</p></div>"
                       +       "</div>"
                       +       "<div class='bottom_answer'>"
                       +       "<p>"
                       +       list[i].queReplyContent
                       +       "</p>"
                       +       "</div>"
                       + "</div>"
                       + "<br><br>";
                       } else {
                   value += "<div class='user_question'>"
                       +    "<div class='question_nickname_date'>"
                       +         "<div style='display:flex;'>"
                       +            "<p style='background-color:#21d9cb; color:white;width:40px; text-align:center; border-radius:5px; height:20px; padding-top:2px;' > 미답변</p>"
                             if(list[i].memId == $("#memId").val()){
                  value +=       "<button value='"+ list[i].proQueNo +"' class='testSpan' onclick='a(this.value)' style=' width:45px; text-align:center; height:20px; padding-top:2px; font-weight: bolder; border-style:none; color:black; background-color:white;'>삭제</button>"
                             } 
                  value +=      "</div>"
                        +       "<form action='' method='post' id='queForm'><input type='hidden' name='proQueNo' value='" +list[i].proQueNo+ "'></form>"
                       +         "<p>" + list[i].memNick + " | " + list[i].proQueDate + "</p>"
                       +      "</div>"
                       +    "<div class='bottom_question'>"
                       +         "<div><p>Q</p></div>"
                       +         "<div>"
                       +            "<p>" + list[i].proQueContent  +"</p>"
                       +         "</div>"
                       +      "</div>"
                       + "</div>" 
                       + "<br>";
                       } 
               }
               $(".question_answer").html(value);
               $("#qcount").text(list.length);
               $("#qcount1").text(list.length);
            },
            error:function(){
               console.log("댓글리스트 조회용 ajax 통신 실패");
            }
         });
       }
       
       function addQuestion(){
          if($("#proQueContent").val().trim().length != 0) {
             $.ajax({
                url:"qinsert.bo",
                data: {
                   proNo: ${p.proNo},
                   memId: "${id}",
                   proQueType: $("#proQueType").val(),
                   proQueContent:$("#proQueContent").val()
                },
                success:function(result){
                   console.log("성공했습니다");
                   if(result == "success") {
                      selectQuestionList(); //결과가 성공하면 데이터 다시검색
                      location.href="/productDetail.bo?pno="+${p.proNo};
                   }
                },
                error:function(){
                   console.log("댓글작성 ajax 통신 실패")
                }
             });
          } else {
             alertify.alert("내용을 작성해주세요")
          }
       }
       
   function a(no){
           
            $("#deleteQue #test23123").val(no)
            $("#deleteQue").submit();
        }
       

    </script>
    
    
    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>