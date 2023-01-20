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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
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
   
    /* -------------------------판매자페이지 판매내역 리스트------------------------- */
    *{font-style:normal;}
    section{ font-family: 'Pretendard-Regular';}
    .order_list{width: 950px; margin: 0 auto; border: 1px solid lightgray; border-radius: 5px; margin-top: 70px; font-family: 'Pretendard-Regular'; padding-top:10px; padding-bottom:10px; margin-bottom: 100px;}
    .detail_top{display: flex; height: 35px;  margin-left: 20px; margin-right: 20px; font-size: 18px; font-weight: bolder; border-bottom: 1px solid lightgray; margin-top: 50px;}
    .detail_top div:nth-child(1){width: 850px;}
    .detail_top div:nth-child(2){width: 100px;      background-color: rgb(224, 224, 224); margin-bottom: 10px;  border-radius: 5px;}
    .buy_wait {color:red; width:100px}
    .detail_top div{font-size: 17px;}
    .detail_body{display: flex; height: 200px; margin-left: 20px; margin-right: 20px; width: 910px; }
    .detail_body_category{width: 400px; margin-left: 10px; padding-top: 70px; }
    .detail_body_category div:nth-child(1){margin-bottom: 10px;}
    .detail_body_category div:nth-child(2){font-weight: bolder;}
    .detail_body_option{width: 250px; padding-top: 70px;}
    .detail_body_option div:nth-child(1){margin-bottom: 10px;}
    .detail_body_option div:nth-child(2){font-weight: bolder;}
    .detail_body_button {width: 260px; text-align: right; padding-top: 40px;margin-top: 30px; margin-right: 10px;}
   /*  .detail_body_button div:nth-child(1){margin-bottom: 20px;} */
/*     .detail_body_button button{ font-family: 'Pretendard-Regular'; background-color: #21d9cb; border: 1px solid #21d9cb; width: 170px; height: 50px; color: white; font-size: 17px; cursor: pointer; border-radius: 5px;}
 */     .detail_body img{width: 150px; margin-top: 25px;}
    .detail_bottom{height: 100px; margin-left: 20px; margin-right: 20px; text-align: center; background-color: #f6fdfd; border-radius: 5px; margin-bottom: 30px;}
    .detail_bottom div:nth-child(1){margin-bottom: 10px; padding-top: 30px;}
    .detail_bottom div:nth-child(2){font-size: 16px; font-weight: bolder;}
     .detail_top p {font-size: 15px;}
     #review_write_button{font-family: 'Pretendard-Regular'; background-color: #21d9cb; border: 1px solid #21d9cb; width: 170px; height: 50px; color: white; font-size: 17px; cursor: pointer; border-radius: 5px;}
     #review_write_button_no{font-family: 'Pretendard-Regular';  width: 170px; height: 50px;  font-size: 17px; border-radius: 5px; border-style:none;}
     
     
    /* 맨위에 주문상태 옵션 */
    .order_status{display: flex; height: 30px; margin-left: 20px;}
    .order_status select{background-color: rgb(247, 248, 250); font-weight: bold; color: rgba(0, 0, 0, 0.7); border: none; font-family: 'Pretendard-Regular'; border-radius: 3px; box-shadow: 0px 0px 1px #555;}
    .buy_back{color: red; width:100px; text-size:18px}
    
     /* -------------------------모달창------------------------- */
     .modal-body{ font-family: 'Pretendard-Regular'; color: black; font-style:normal;}
    .modal-title{text-align: center; font-weight: bolder;;}
    .review_top_buyimg > img{width: 120px; height: 120px; float: left; padding: 7px;}
    .review_top_buy_text{ padding:20px;}
    .review_title{font-weight: bolder; font-size: 16px;} 
    #review_buy_star{position: absolute;}
    .star_option{font-size: 17px; width: 60px; position: relative; top: 1px;}
    .star_count{color: #21d9cb; font-size: 30px;}
    #review_buy_star_detail_durability, #review_buy_star_detail_design,#review_buy_star_detail_price,#review_buy_star_detail_delivery{display: flex;}
    #review_buy_star_detail_durability, #review_buy_star_detail_design{ padding: 10px;}
    #review_buy_star_detail_price,#review_buy_star_detail_delivery{ padding: 10px;}
    .review_buy_star, .review_buy_upload, .review_write { margin-top: 10px;} 
    .review_write_detail textarea{width: 560px; height: 250px; padding: 6px;border-color: #d3d3d3; border-radius: 3px;}
    .review_write_detail input{width: 560px; height: 40px; background-color: #21d9cb; color: white; border-style: none; border-radius: 5px; font-weight: bold; font-size: 16px;}
    .modal-footer_text{ font-size: 13px; text-align: left;}
    #profile_img_upload{ 
      opacity: 0;
      overflow: hidden;
      position: absolute; 
    } 
    #profile_img_upload + label {
       width: 560px; 
       height: 40px;
        border: 2px #21d9cb solid;  
        background-color: #fff;
        color: #21d9cb;
        border-radius: 3px; 
        padding: 8px 17px 8px 17px;
        font-weight: 500;
        font-size: 16px;
        box-shadow: 1px 2px 3px 0px #f2f2f2;
        outline: none;
        text-align: center;
      ;
    } 
    #profile_img_upload:focus + label,
    #profile_img_upload + label:hover {
        cursor: pointer;
    } 
    /* 별 스타일모음 */
    .rating {
    display: flex;
         margin-top: -10px;
        flex-direction: row-reverse;
        margin-left: -4px;
            float: left;
    }

    .rating>input {
        display: none
    }

    .rating>label {
       position: relative;
        width: 30px;
        font-size:30px;
        color: #21d9cb;
        cursor: pointer;
    }

    .rating>label::before {
        content: "\2605";
        position: absolute;
        opacity: 0
    }

    .rating>label:hover:before,
    .rating>label:hover~label:before {
        opacity: 1 !important
    }

    .rating>input:checked~label:before {
        opacity: 1
    }

    .rating:hover>input:checked~label:before {
        opacity: 0.4
    } 
    
</style> 
<script>
	function insertInfoToModal(clickNum){
		
		var n = Number(clickNum);
		<c:set var="modalInfo" value="${ o }"/>
		
		var cateName = [
		<c:forEach var="mm" items="${o}">	
		'카테고리 | ${ mm.cateName}',
		</c:forEach>
			's'
		]
		
		var proName = [
		<c:forEach var="mm" items="${o}">		
			'${mm.proName}',
		</c:forEach>
			's'
		]
		
		var priceAndCount = [
		<c:forEach var="mm" items="${o}">		
			'${ mm.ordPrice } POINT | ${ mm.ordCount } 개',
		</c:forEach>
			's'
		]
		
		var ordNo = [
		<c:forEach var="mm" items="${o}">		
			'${mm.ordNo}',
		</c:forEach>
			's'
		]
		
		var proNo = [
		<c:forEach var="mm" items="${o}">		
			'${mm.proNo}',
		</c:forEach>
			's'
		]
		
		var proImg = [
		<c:forEach var="mm" items="${o}">
			'${mm.proChangeImg}',
		</c:forEach>
			's'
		]
		
		
		$(function(){
			$("#cateName").text(cateName[clickNum-1]);
			$("#proName").text(proName[clickNum-1]);
			$("#priceAndCount").text(priceAndCount[clickNum-1]);
			$("#ordNo").val(ordNo[clickNum-1]);
			$("#proNo").val(proNo[clickNum-1]);
			$("#proImg").attr("src","${ path }/"+proImg[clickNum-1])
		})
		
		
		//document.getElementById("proName").value = 'x[clickNum-1]';
	}
	
</script>
  
  <body>

	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/myPageHeader.jsp" />


      <section class="sellerpage_main_body">      
        <div class="order_list">
            <div class="order_list_detail"> 
            
        <c:forEach var="order" items="${ o }" varStatus="status">
        
             <!-- 주문확정했을떄 -->
            	<c:if test="${ order.ordStatus eq 'Y'}">      
                <div class="detail_top">
                    <div>주문일자 ${ order.ordDate }</div>
                    <p class="buy_over">구매확정</p>
                    
                </div>
                <div class="detail_body">
                    <div><img src="${ path }/${ order.proChangeImg }"></div>
                    <div class="detail_body_category">
                        <div>카테고리 | ${ order.cateName }</div>
                        <div>${ order.proName }</div>
                    </div>
                    <div class="detail_body_option">
                        <div>옵션 | ${ order.ordOption }</div>
                        <div>${ order.ordPrice } POINT | ${ order.ordCount } 개</div>
                    </div>
                    <div class="detail_body_button order${ order.ordNo }">
                       <button type="button" data-toggle="modal" data-target="#myModal" id="review_write_button" onclick="insertInfoToModal(this.value);" value="<c:out value="${status.count}" />">리뷰작성</button>
                    </div>
                </div>
                <div class="detail_bottom">
                    <div>판매자 | ${ order.selBusName }</div>
                    <div>판매자 연락처 | ${ order.selPhone }</div>
                </div>
             </c:if>
               <!-- 주문대기중일때 --> 
             <c:if test="${order.ordStatus eq 'N'}">
                <div class="detail_top">
                    <div>주문일자 ${ order.ordDate }</div>
                    <p class="buy_wait">구매대기중</p>
                </div>
               <div class="detail_body">
                    <div><img src="${ path }/${ order.proChangeImg }"></div>
                    <div class="detail_body_category">
                        <div>카테고리 | ${ order.cateName }</div>
                        <div>${ order.proName }</div>
                    </div>
                    <div class="detail_body_option">
                        <div>옵션 | ${ order.ordOption }</div>
                        <div>${ order.ordPrice } POINT | ${ order.ordCount } 개</div>
                    </div>
                    <div class="detail_body_button">
                        <div><button disabled="disabled" id="review_write_button_no">리뷰작성</button></div>
                        
                    </div>
                </div>
                <div class="detail_bottom">
                    <div>판매자 | ${ order.selBusName }</div>
                    <div>판매자 연락처 | ${ order.selPhone }</div>
                </div>
              </c:if>  
              
        <!-- 판매취소일때 --> 
      <c:if test="${order.ordStatus eq 'F'}"> 
                <div class="detail_top">
                    <div>주문일자 ${ order.ordDate }</div>
                    <p class="buy_back">판매자취소</p>
                </div>
                 <div class="detail_body">
                    <div><img src="${ path }/${ order.proChangeImg }"></div>
                    <div class="detail_body_category">
                        <div>카테고리 | ${ order.cateName }</div>
                        <div>${ order.proName }</div>
                    </div>
                    <div class="detail_body_option">
                        <div>옵션 | ${ order.ordOption }</div>
                        <div>${ order.ordPrice } POINT | ${ order.ordCount } 개</div>
                    </div>
                    <div class="detail_body_button">
                        <div><button id="review_write_button_no">취소</button></div>
                    </div>
                </div>
            </c:if> 
    
    <!-- 리뷰작성 모달 부트스트랩의 모달 창을 사용할려면 아래의 class 이름들을 그대로 사용해야 한다. 변경하면 모양이 달라진다.-->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog"> <!-- 사용자 지정 부분① : id명 -->
    <div class="modal-dialog">  

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">리뷰쓰기</h4> <!-- 사용자 지정 부분② : 타이틀 -->
       </div> 
        <div class="modal-body">
           <div class="review_top_buyimg">
              <img src="${ path }/resources/img/detail_content_buy_img01.jpeg" id="proImg">
                  <div class="review_top_buy_text"> 
                     <div class="review_top_buy_seller"><p id="cateName">카테고리 | ${ order.cateName }</p></div>
                     <div class="review_top_buy_title"><p id="proName">${ order.proName }</p></div>
                     <div class="review_top_buy_price"><p id="priceAndCount">${ order.ordPrice } POINT | ${ order.ordCount } 개</p></div>
                   </div>  
             </div>  <!--review_top_buyimg까지-->
             <form action="reviewinsert.bo" method="post" enctype="multipart/form-data">
               <input type="hidden" name="memEmail" value="${ id }">
               <input type="hidden" name="ordNo" id="ordNo" value="${ order.ordNo }">
               <input type="hidden" name="proNo" id="proNo" value="${ order.proNo }">
                <div class="review_buy_star"> 
                    <h5 class="review_title">별점평가</h5> 
                    <div class="review_buy_star_detail">
                            <div id="review_buy_star_detail_durability">
                                    <div class="star_option">만족도</div>
                                    <div class="rating"> 
                                      <input type="radio" name="reviewStar" value="5" id="5"><label for="5">☆</label>
                                      <input type="radio" name="reviewStar" value="4" id="4"><label for="4">☆</label> 
                                      <input type="radio" name="reviewStar" value="3" id="3"><label for="3">☆</label>
                                      <input type="radio" name="reviewStar" value="2" id="2"><label for="2">☆</label>
                                      <input type="radio" name="reviewStar" value="1" id="1"><label for="1">☆</label>
                                  </div> 
                            </div> 
                    </div>
                </div><!--review_buy_star 까지-->
                <div class="review_buy_upload">
                    <h5 class="review_title">사진 첨부 (선택)</h5>
                    <p>사진을 첨부해주세요. (최대 1장) </p> 
                    <input type="file" name="upfile" class="main_file">
                </div> <!--review_buy_upload 까지-->
                  
                <div class="review_write"> 
                      <h5 class="review_title">리뷰작성</h5> 
                      <div class="review_write_detail">
                          <textarea name="reviewContent" placeholder="자세하고 솔직한 리뷰는 다른 고객에게 큰 도움이 됩니다.(최소 20자 이상)"></textarea>
                          <input type="submit" value="완료">
                      </div>
                  </div> 
               </div><!--review_write 까지-->  
          </form> 
     <div class="modal-footer">
        <div class="modal-footer_text">포인트는 최초 작성한 리뷰를 기준으로 지급됩니다.</div>
        <div class="modal-footer_text">상품과 무관한 내용이나 사진, 동일 문자 반복 등의 부적합한 리뷰는  사전 경고 없이 삭제 및 포인트 회수될 수 있습니다.</div>
     </div>
   </div>
  </div>
</div>     

 </c:forEach> 
            </div>
        </div> 
    </section>
     
<jsp:include page="../common/footer.jsp"/>   
     

</body>
</html>