<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오구싶은집 > 나의 판매 목록</title>
<!-- 파비콘 로고 -->
<link rel="icon" href="${path}/resources/img/pavilogo.png">
<c:if test="${ not empty alertMsg }">
  <script>
     alert("${ alertMsg }");
  </script>
  <c:remove var="alertMsg" scope="session" />
</c:if> 
</head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>
    $(function(){
        $("#header_store").mouseover(function(){
            $(".header_store_dropdown").stop().fadeIn(300);
        })
        $(".header_store_dropdown").mouseleave(function(){
            $(".header_store_dropdown").stop().fadeOut(300);
        })
    })
</script>
<style>
    /* 로고폰트 */
        @font-face {
        font-family: 'SDSamliphopangche_Outline';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') at('woff');
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

    /*------------------------- 드롭다운 스타일모음 -------------------------*/
    .header_store_dropdown{width: 1400px;margin: 0 auto; display: none; }
    .header_store_dropdown table{width: 700px; margin-left: 380px; }
    #store_dropdown_img{width: 40px;}
    .header_store_dropdown tr:first-child{ text-align: center; }
    .header_store_dropdown tr:last-child{text-align: center; font-family: 'GmarketSansMedium'}
    .header_store_bar{width: 2500px; margin-left: -900px;}


    /*------------------------- 판매자페이지 메뉴바 스타일모음------------------------- */
    .mypage_category{width: 1400px; height: 80px; margin: 0 auto;} 
    .mypage_category table {width: 700px; height: 80px; margin: 0 auto; text-align: center; font-weight: bolder;}
    #mypage_menu{font-family: 'GmarketSansMedium';}
    #mypage_menu:hover{color: #21d9cb;}


    /* -------------------------판매자페이지 판매상품 스타일모음------------------------- */
    .order_count{width: 950px; margin: 0 auto; display: flex; margin-top: 30px; font-weight: bolder; font-size: 18px; margin-bottom: 50px;}
    .order_count div:nth-child(1){font-family: 'GmarketSansMedium';}
    .order_count div:nth-child(2){font-family: 'GmarketSansMedium'; color: #21d9cb; margin-left: 5px;}
    .sellerpage_main_body{padding-top: 20px; width: 950px; margin: 0 auto;}
    .order_list_paging{width: 950px; margin: 0 auto; text-align: center; margin-top: 60px; margin-bottom: 60px;}


    /* -------------------------판매자페이지 주문내역 통계표------------------------- */
    .order_sum{width: 950px; margin: 0 auto;}
    .order_sum_table table{margin: 0 auto; border-collapse: collapse; font-family: 'Pretendard-Regular'; width: 900px; font-size: 20px;}
    .order_sum_table table tr td{height: 50px; text-align: center; border-bottom: 1px solid rgb(204, 204, 204); border-top: 1px solid rgb(204, 204, 204);}
    #order_sum_table_1row td:nth-child(1){width: 60px; text-align: right; color: rgb(0, 0, 0); text-align: center; font-weight: bolder; } 
    #order_sum_table_1row td:nth-child(2){width: 60px; font-size: 20px; font-weight: bolder;}
    #order_sum_table_1row td:nth-child(3){width: 100px; font-size: 20px; font-weight: bolder;}
    #order_sum_table_1row td{background-color: rgb(243, 243, 243);}
    #order_sum_table_2row td:nth-child(1){font-weight: bolder;}
    #order_sum_table_3row td:nth-child(1){font-weight: bolder;}
    #order_sum_table_4row td:nth-child(1){font-weight: bolder;}
    #order_sum_table_5row td:nth-child(1){font-weight: bolder;}
    #order_sum_table_5row td{background-color: rgb(243, 243, 243);}
    #table_border{border-right: 1px solid rgb(204, 204, 204);}

    /* -------------------------판매자페이지 판매내역 리스트------------------------- */
     *{font-style:normal;}
    section{ font-family: 'Pretendard-Regular';}
    .order_list{width: 950px; margin: 0 auto; border: 1px solid lightgray; border-radius: 5px; margin-top: 70px; font-family: 'Pretendard-Regular'; padding-top:10px; padding-bottom:10px; margin-bottom: 100px;}
    .detail_top{display: flex; height: 35px;  margin-left: 20px; margin-right: 20px; font-size: 18px; font-weight: bolder; border-bottom: 1px solid lightgray; margin-top: 50px;}
    .detail_top div:nth-child(1){width: 850px;}
    .detail_top div:nth-child(2){width: 90px; font-size:16px; border-radius: 5px; text-align:center; padding-top:8px;}
    .buy_wait {color:red; width:100px}
    .detail_top div{font-size: 17px;}
      
   
    .detail_body{display: flex; height: 200px; margin-left: 20px; margin-right: 20px; width: 910px; }
    .detail_body_category{width: 400px; margin-left: 10px; padding-top: 70px; }
    .detail_body_category div:nth-child(1){margin-bottom: 10px;}
    .detail_body_category div:nth-child(2){font-weight: bolder;}
    .detail_body_option{width: 250px; padding-top: 70px;}
    .detail_body_option div:nth-child(1){margin-bottom: 10px;}
    .detail_body_option div:nth-child(2){font-weight: bolder;}
    .detail_body_button {width: 260px; text-align: right; padding-top: 40px; margin-right: 10px;}
   /*  .detail_body_button div:nth-child(1){margin-bottom: 20px;} */
/*     .detail_body_button button{ font-family: 'Pretendard-Regular'; background-color: #21d9cb; border: 1px solid #21d9cb; width: 170px; height: 50px; color: white; font-size: 17px; cursor: pointer; border-radius: 5px;}
 */     .detail_body img{width: 150px; margin-top: 25px;}
    .detail_bottom{line-height: 133%; height: 100px; margin-left: 20px; margin-right: 20px; text-align: center; background-color: #f6fdfd; border-radius: 5px; margin-bottom: 30px;}
    .detail_bottom div:nth-child(1){padding-top: 20px;  }
    .detail_bottom div:nth-child(2){font-size: 16px; }
     .detail_top p {font-size: 15px;}
     #sell_ok, #order_cancle {font-family: 'Pretendard-Regular'; background-color: #21d9cb; border: 1px solid #21d9cb; width: 170px; height: 50px; color: white; font-size: 17px; cursor: pointer; border-radius: 5px;}
     #order_cancle{margin-top:10px}
</style>
<body>
    <jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sellerPageHeader.jsp"/>

    <section class="sellerpage_main_body">
    	
    	<div class="order_count">
            <div><p>총 보유 포인트</p></div>
            <div><p style="font-size:30px; position:relative; bottom: 7px; left: 5px;" class="sellerPoint">0 원 <button>환전하기</button></p></div>
        </div>
    
    
        <div class="order_count">
            <div><p>주문내역</p></div>&ensp;
            <div><p class="allCount"></p></div>
            
        </div>

		<script>
        	function orderConfirm(a){
        		
        		var ordOption = document.getElementById("oOption").value
        		var ordCount = document.getElementById("oCount").value
        		var ordPrice = document.getElementById("oPrice").value
        		var proNo = document.getElementById("proNo").value
        		var ordEmail = document.getElementById("ordEmail").value
        		location.href="orderConfirm.or?ordNo="+a+"&selNo="+${selNo}+"&ordOption="+ordOption+"&ordCount="+ordCount+"&ordPrice="+ordPrice+"&proNo="+proNo+"&ordEmail="+ordEmail;
        	}
        	function orderCancel(b){
        		var ordOption = document.getElementById("oOption").value
        		var ordCount = document.getElementById("oCount").value
        		var ordPrice = document.getElementById("oPrice").value
        		var proNo = document.getElementById("proNo").value
        		var ordEmail = document.getElementById("ordEmail").value
        		location.href="orderCancel.or?ordNo="+b+"&selNo="+${selNo}+"&ordOption="+ordOption+"&ordCount="+ordCount+"&ordPrice="+ordPrice+"&proNo="+proNo+"&ordEmail="+ordEmail;
        	}
        	
        	$(function(){
        		getStatistics();
        		getSellerPoint();
        	})
        	
        	function getStatistics(){
        		$.ajax({
    	    		url:"getStatistics.or",
    	    		data:{
    	    			selNo : ${s.selNo}
    	    		},
    	    		type:"post",
    	    		success:function(list){
    	    			var allCount = 0;
    	    			$(function(){
    	    				for(i in list){
    	    					if(list[i].ordStatus == 'Y'){
    	    						$(".sellYcount").text(list[i].statCount)
    	    						$(".sellYprice").text(list[i].statPrice+" 원")
    	    					}
    	    					if(list[i].ordStatus == 'N'){
    	    						$(".sellNcount").text(list[i].statCount)
    	    						$(".sellNprice").text(list[i].statPrice+" 원")
    	    					}
    	    					if(list[i].ordStatus == 'F'){
    	    						$(".sellFcount").text(list[i].statCount)
    	    						$(".sellFprice").text(list[i].statPrice+" 원")
    	    					}
    	    					allCount += list[i].statCount;
    	    					$(".allCount").text(allCount+" 건")
    	    				}
    	    				
    	    			})
    	    		},
    	    		error:function(){
    	    			console.log("ajax error")
    	    		}
    	    		
        		})
        	}
        	
        	function getSellerPoint(){
        		$.ajax({
        			url:"getSellerPoint.se",
        			type:"post",
        			data:{
        				selNo : ${s.selNo}
        			},
        			success:function(sellerPoint){
        				$(function(){
        					$(".sellerPoint").text(sellerPoint+' 원')
        				})
        			},
        			error:function(){
        				console.log('판매자포인트 조회 실패')
        			}
        		})
        	}
        </script>
        <!--통계테이블-->
        <div class="order_sum">
            <div class="order_sum_table">
                <table>
                    <thead>
                        <tr id="order_sum_table_1row">
                            <td id="table_border">통계표</td>
                            <td id="table_border">건수</td>
                            <td>금액</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="order_sum_table_2row">
                            <td id="table_border">판매</td>
                            <td id="table_border" class="sellYcount">0</td>
                            <td class="sellYprice">0</td>
                        </tr>
                        <tr id="order_sum_table_3row">
                            <td id="table_border">취소</td>
                            <td id="table_border" class="sellFcount">0</td>
                            <td class="sellFprice">0</td>
                        </tr>
                        <tr id="order_sum_table_3row">
                            <td id="table_border">대기중</td>
                            <td id="table_border" class="sellNcount">0</td>
                            <td class="sellNprice">0</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="order_list">
            <div class="order_list_detail">
            
            <c:forEach var="order" items="${ o }">
            	<c:if test="${order.ordStatus eq 'N'}">
					<div class="detail_top">
	                    <div>주문일자 ${ order.ordDate }</div>
	                    <div>판매요청</div>
	                </div>
	                <div class="detail_body">
	                    <div><img src="${ path }/${ order.proChangeImg }"></div>
	                    <div class="detail_body_category">
	                        <div>카테고리 | ${ order.cateName }</div>
	                        <div>${ order.proName }</div>
	                    </div>
	                    <div class="detail_body_option">
	                        <div>옵션 | ${ order.ordOption }</div>
	                        <div>${ order.ordPrice } 원 | ${ order.ordCount } 개</div>
	                    </div>
	                    <div class="detail_body_button">
	                        <div><button type="button" id="sell_ok" value="${ order.ordNo }" onclick="orderConfirm(this.value);">판매확정</button></div>
	                        <div><button type="button" id="order_cancle" value="${ order.ordNo }" onclick="orderCancel(this.value);">주문취소</button></div>
	                        <input type="hidden" value="${ order.ordOption }" id="oOption">
	                        <input type="hidden" value="${ order.ordCount }" id="oCount">
	                        <input type="hidden" value="${ order.ordPrice }" id="oPrice">
	                        <input type="hidden" value="${ order.proNo }" id="proNo">
	                        <input type="hidden" value="${ order.ordEmail }" id="ordEmail">
	                    </div>
	                </div>
	                <div class="detail_bottom">
	                    <div>고객이름 | ${ order.cusName }</div>
	                    <div>고객연락처 | ${ order.cusPhone }</div>
	                    <div style="font-size:smaller;">배송주소 | ${ order.ordAddr }, ${ order.ordDetailAddr }</div>
	                </div>
            	</c:if>
            	<!-- 주문확정했을떄 -->
            	<c:if test="${order.ordStatus eq 'Y'}">
            		<div class="detail_top">
	                    <div>주문일자 ${ order.ordDate }</div>
	                    <div style="background-color: #21d9cb; color: white;">판매완료</div>
	                </div>
	                <div class="detail_body">
	                    <div><img src="${ path }/${ order.proChangeImg }"></div>
	                    <div class="detail_body_category">
	                        <div>카테고리 | ${ order.cateName }</div>
	                        <div>${ order.proName }</div>
	                    </div>
	                    <div class="detail_body_option">
	                        <div>옵션 | ${ order.ordOption }</div>
	                        <div>${ order.ordPrice } 원 | ${ order.ordCount } 개</div>
	                    </div>
	                    <div class="detail_body_button">
	                        <div><button style="display: none;">판매확정</button></div>
                       		<div><button style="display: none;">주문취소</button></div>
	                    </div>
	                </div>
	                <div class="detail_bottom">
	                    <div>고객이름 | ${ order.cusName }</div>
	                    <div>고객연락처 | ${ order.cusPhone }</div>
	                    <div style="font-size:smaller;">배송주소 | ${ order.ordAddr }, ${ order.ordDetailAddr }</div>
	                </div>
            	</c:if>
            	<!-- 주문취소했을떄 -->
            	<c:if test="${order.ordStatus eq 'F'}">
            		<div class="detail_top">
	                    <div>주문일자 ${ order.ordDate }</div>
	                    <div style="color: red;">판매취소</div>
	                </div>
	                <div class="detail_body">
	                    <div><img src="${ path }/${ order.proChangeImg }"></div>
	                    <div class="detail_body_category">
	                        <div>카테고리 | ${ order.cateName }</div>
	                        <div>${ order.proName }</div>
	                    </div>
	                    <div class="detail_body_option">
	                        <div>옵션 | ${ order.ordOption }</div>
	                        <div>${ order.ordPrice } 원 | ${ order.ordCount } 개</div>
	                    </div>
	                    <div class="detail_body_button">
	                        <div><button style="display: none;">판매확정</button></div>
                       		<div><button style="display: none;">주문취소</button></div>
	                    </div>
	                </div>
	                <div class="detail_bottom">
	                    <div>고객이름 | ${ order.cusName }</div>
	                    <div>고객연락처 | ${ order.cusPhone }</div>
	                    <div style="font-size:smaller;">배송주소 | ${ order.ordAddr }, ${ order.ordDetailAddr }</div>
	                </div>
            	</c:if>
            	
			</c:forEach>

            </div>
        </div> 
    </section>


    <jsp:include page="../common/footer.jsp"/>
</body>
</html>