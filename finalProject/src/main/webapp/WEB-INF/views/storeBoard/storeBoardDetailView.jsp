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
    .main_body{width: 1400px; margin: 0 auto;}
    .product_header{display: flex; width: 1200px; margin: 0 auto; padding-top: 100px;}
    .product_small_img img{width: 100px; margin-bottom: 10px; margin-right: 20px; border-radius: 5px;}
    .product_main_img img{width: 600px; border-radius: 5px; margin-right: 40px; margin-bottom: 100px;}
    .product_intro{margin-top: 10px; font-family: 'Pretendard-Regular';}
    .intro_review{display: flex; margin-bottom: 10px; font-family: 'Pretendard-Regular';}
    .intro_review div:nth-child(1){color: #21d9cb; font-size: 25px;}
    .intro_review div:nth-child(2){font-size: 14px; height: 35px; color: rgb(131, 131, 131); margin-left: 5px; margin-top: 7px;}
    .intro_home_img{display: flex;}
    .product_header select{width: 400px; height: 50px; padding-left: 5px; font-size: 15px; border-color: rgb(202, 202, 202); border-radius: 5px; margin-bottom: 10px;}
    .order_price{display: flex;}
    .intro_btn{display: flex;}
    .intro_btn button{width: 200px; height: 50px; font-size: 18px; font-weight: bolder; margin-right: 10px; background-color: #21d9cb; border: 1px solid #21d9cb; color: white; cursor: pointer; border-radius: 5px;}

   /*----------------------------------- 상품 바디 카테고리 바 -----------------------------------*/
    .product_body{}
    .body_category{height: 60px;}
    .product_body_category{display: flex; background-color: rgb(252, 252, 252); width:1900px; margin-left:-250px;
        height: 60px; border-top: 1px solid rgb(214, 214, 214); border-bottom: 1px solid rgb(214, 214, 214); margin-bottom: 50px;}
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
    .bottom_star{display: flex; margin: 0 auto; width: 350px; }
    .bottom_star p{font-size: 30px; font-weight: bolder;  padding-top: 80px;}
    .bottom_star p:nth-child(1) {text-align: right;vertical-align: middle; width: 250px; color: #21d9cb; }
    .bottom_star p:nth-child(2) {text-align: left;width: 100px; border-right: 1px solid rgb(230, 230, 230); color: rgb(102, 102, 102); padding-right: 20px; margin-top: 3px;}
    .review_table{ background-color: rgb(243, 243, 243);width: 450px; margin: 0 auto;}
    .review_table table {margin: 0 auto; border-collapse: collapse; margin-top: 30px;}
    .review_table table tr td{font-size: 13px; border-collapse: collapse; padding-bottom: 5px; vertical-align: middle; font-weight: bolder;}
    .review_table table tr td:nth-child(1){width: 50px; color: rgb(102, 102, 102);}
    .review_table table tr td:nth-child(2){width: 150px; font-size: 20px; color: #21d9cb;}
    .review_table table tr td:nth-child(3){width: 50px; padding-left: 10px; color: rgb(102, 102, 102);}

    /*-----------------------------------  리뷰 상세 -----------------------------------*/
    .review_detail table{ width: 800px; border-collapse: collapse; border-top: 1px solid gray;  border-top: 1px solid rgb(221, 221, 221); font-family: 'Pretendard-Regular';}
    #review_user_img{width: 25px; padding-left: 10px; padding-top: 20px;}
    #review_nickname{padding-left: 10px; padding-top: 20px; width: 40px; font-size: 13px; font-weight: bolder; color: rgb(77, 76, 76);;}
    #review_date{font-size: 12px; color: rgb(77, 76, 76); padding-top: 3px;}
    #review_option{font-size: 13px; padding-left: 10px; padding-top: 5px; color: rgb(77, 76, 76);}
    #review_main_img{padding-left: 10px; width: 130px; padding-top: 10px;}
    #user_review{width: 130px; border-radius: 5px;}
    #review_text{font-size: 15px; padding-left: 10px; padding-top: 10px; padding-bottom: 40px;}
    #user_review_star{padding-left: 10px; width: 90px; color: #21d9cb; font-size: 16px;}
    #user_img{width: 25px;}
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
    .question_nickname_date{padding-bottom: 10px; font-family: 'Pretendard-Regular';}
    .bottom_question{padding-bottom: 10px; font-family: 'Pretendard-Regular';}
    .bottom_answer_title{padding-bottom: 10px; font-family: 'Pretendard-Regular';}
    .question_nickname_date{font-size: 12px; color: gray; }
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

</style>
<body>
	<jsp:include page="../common/header.jsp" />

    <!---------------------------------- 상품 메인 사진 ---------------------------------->
    <section>
        <div class="main_body">
            <div class="product_header">
                <div class="product_small_img">
                    <div><img src="${path}/resources/img/logo_user.png"></div>
                    <div><img src="${path}/resources/img/logo_user.png"></div>
                </div>
                <div class="product_main_img">
                    <div><img src="${path}/resources/img/logo_user.png"></div>
                </div>
                <div class="product_intro">
                    <div><p style="margin-bottom: 10px;"><a href="" style="color: rgb(109, 108, 108); font-size: 15px; font-weight: bold;">${ p.selBusName }</a></p></div>
                    <div><p style="margin-bottom: 10px; font-size: 25px; font-weight: bolder;">${ p.proName }</p></div>
                    <div class="intro_review">
                        <div><p>★★★★★</p></div>
                        <div><p><span id="rcount">0</span>개 리뷰</p></div>
                    </div>
                    <div><p style="margin-bottom: 10px; font-size: 35px; font-weight: bolder;">${ p.proPrice }원</p></div>
                    <div><p style="margin-bottom: 10px; font-size: 15px;">&ensp;업체직접배송</p></div>
                    <div><p style="margin-bottom: 10px; font-size: 15px;">&ensp;1/20(금) 이내 도착 예정</p></div>
                    <div style="margin-bottom: 10px;"><hr style="width: 400px;"></div>
                    <div class="intro_home_img" style="margin-bottom: 30px;">
                        <div><img src="${path}/resources/img/logo_user.png" style="width: 30px; margin-left: 10px;"></div>
                        <div><p style="margin-top: 4px;">&ensp;<a href="" style="color: rgb(109, 108, 108); font-size: 17px; font-weight: bold;">${ p.selBusName }</a></p></div>
                    </div>
                    <div>
                        <select>
                            <option>색상선택</option>
                            <option>BLACK</option>
                            <option>WHITE</option>
                        </select>
                    </div>
                    <div>
                        <select style="margin-bottom: 30px;">
                            <option>수량선택</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option></option>
                        </select>
                    </div>
                    <div class="order_price">
                        <div><p style="font-size: 13px; font-weight: bolder; margin-top: 5px; margin-bottom: 30px;">주문금액</p></div>
                        <div><p style="width:350px; text-align: right; font-size: 25px; font-weight: bolder;">${ p.proPrice }</p></div>
                    </div>
                    <div class="intro_btn">
                        <div><button>장바구니</button></div>
                        <div><button>바로구매</button></div>
                    </div>
                </div>
            </div>
            
            <div class="product_body">
                <!--메뉴바-->
                <div class="body_category">
                    <div class="product_body_category">
                            <div><p style="width: 220px; margin-left: 680px; "><a href="">상품정보</a></p></div>
                            <div class="product_body_category_review" style="width: 220px;">
                                <div><p style="margin-right: 10px;">리뷰</p></div>
                                <div><p style="color: gray;"><span id="rcount1">0</span></p></div>
                            </div>
                            <div class="product_body_category_question" style="width: 220px;">
                                <div><a href=""><p style="margin-right: 10px;">문의</p></div>
                                <div><p style="color: gray;" id="qcount">0</p></a></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 상품디테일 -->
                <div class="product_detail">
                    <!--왼쪽 상품정보-->
                    <div class="left_detail_img">
                        <!--상품정보-->
                        <p style="font-weight: bolder; font-size: 20px;">상품정보</p><br><br>
                        <div style="text-align: center;"><img src="${path}/resources/img/logo_user.png" id="detail_img"></div>
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
                                <p>리뷰</p>
                                <p style="color: #21d9cb; padding-left: 10px;"><span id="rcount2">0</span></p>
                            </div>
                            <div style="display: flex;">
                                <div class="review_box">
                                    <div class="bottom_star" >
                                        <p>★★★★★</p>
                                        <p>&ensp;5.0</p>
                                    </div>
                                    <div class="review_table">
                                        <table>
                                            <tr>
                                                <td>5점</td>
                                                <td>★★★★★</td>
                                                <td>10</td>
                                            </tr>
                                            <tr>
                                                <td>4점</td>
                                                <td>★★★★</td>
                                                <td>10</td>
                                            </tr>
                                            <tr>
                                                <td>3점</td>
                                                <td>★★★</td>
                                                <td>10</td>
                                            </tr>
                                            <tr>
                                                <td>2점</td>
                                                <td>★★</td>
                                                <td>10</td>
                                            </tr>
                                            <tr>
                                                <td>1점</td>
                                                <td>★</td>
                                                <td>10</td>
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


                            <!--리뷰 페이징-->
                            <div class="review_paiging">1  2  3  4  5</div>
                        </div>

                        <!--문의-->
                        <div>
                            <!--문의상단 바-->
                            <div class="bottom_question_title">
                                <p>문의</p>
                                <p id="qcount1">0</p>
                                <div><button type="button" data-toggle="modal" data-target="#myModal">문의하기</button></div>
                            </div>
                            <!--질문답변-->
                             <div class="question_answer">
                                <!-- <div class="user_question">
                                    	
                                    	문의 ajax
                                    	
                                </div>
                                <div class="seller_answer">
                               
                               			
                                    
                                </div> -->
                            </div>
                            
                            <!--문의 페이징바-->
                            <div class="question_paiging">1  2  3  4  5</div>
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
						value += "<tbody>"
							  + 	"<tr>"
							  +			"<td rowspan='2' id='review_user_img'><img src='${path}/resources/img/logo_user.png' id='user_img'></td>"
							  +			"<td colspan='2' id='review_nickname'>" + list[i].memNick + "</td>"
							  +  	"</tr>"
							  +  	"<tr>"
							  +			"<td id='review_option'>" + list[i].reviewStar + "</td>"
							  +			"<td id='review_date'>" + list[i].reviewDate + "</td>"
							  +  	"</tr>"
							  +  	"<tr>"
							  +			"<td colspan='3' id='review_option'> 옵션 :"+ list[i].ordOption + "</td>"
							  +  	"</tr>"
							  +  	"<tr>"
							  +			"<td colspan='3' id='review_main_img'><img src='${path}/resources/img/logo_user.png' id='user_review'></td>"		
							  +  	"</tr>"
							  +  	"<tr>"		
							  +			"<td colspan='3' id='review_text'>" + list[i].reviewContent + "</td>"			  
							  +	 	"</tr>"
							  + "</tbody>";
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
						value += "<div class='user_question'>"
							  + 	"<div class='question_nickname_date'>"
							  +			"<p>" + list[i].memNick + " | " + list[i].proQueDate + "</p>"
							  +		"</div>"
							  + 	"<div class='bottom_question'>"
							  +			"<div><p>Q</p></div>"
							  +			"<div>"
							  +				"<p>" + list[i].proQueContent + "</p>"
							  +			"</div>"
							  +		"</div>"
							  + "</div>" 
							  + "<div class='seller_answer'>"
							  + 	"<div class='bottom_answer_title'>"
							  + 		"<div><p>A</p></div>"
							  + 		"<div><p>" + list[i].selBusName + "</p></div>"
							  + 		"<div><p>" + list[i].queReplyDate + "</p></div>"
							  +	 	"</div>"
							  +	 	"<div class='bottom_answer'>"
							  + 		"<p>"
							  + 		list[i].queReplyContent
							  + 		"</p>"
							  +	 	"</div>"
							  + "</div>";
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
		
	    
	   /*  $(function(){
			 selectAnswerList(); 
		})
		
		function selectAnswerList(){
    		$.ajax({
				url:"alist.bo",
				data:{pno:${p.proNo}},
				success:function(list){
					let value = "";
					for(let i in list) {
						value += "<div class='bottom_answer_title'>"
							  + 	"<div><p>A</p></div>"
							  + 	"<div><p>" + list[i].selBusName + "</p></div>"
							  + 	"<div><p>" + list[i].queReplyDate + "</p></div>"
							  +	 "</div>"
							  +	 "<div class='bottom_answer'>"
							  + 	"<p>"
							  + 	list[i].queReplyContent
							  + 	"</p>"
							  +	 "</div>";
					}
					$(".seller_answer").html(value);
				},
				error:function(){
					console.log("댓글리스트 조회용 ajax 통신 실패");
				}
			});
	    } */
		
    
    </script>
    
    
    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>