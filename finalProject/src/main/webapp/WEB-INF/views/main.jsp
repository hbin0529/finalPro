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
    
    let idx = 1;
     function ChnImg1(){  console.log("1")
       if(idx == 1){  
       document.getElementById("store_main_img").src = "${path}/resources/img/main_img2.jpg"
        idx = 2;
       } else {
       document.getElementById("store_main_img").src = "${path}/resources/img/main_img1.jpg"
        idx = 1;
       }
      } 
     function ChnImg2(){ 
        if(idx == 2){
            document.getElementById("store_main_img").src = "${path}/resources/img/main_img1.jpg";
            idx = 1;
        } else {
            document.getElementById("store_main_img").src = "${path}/resources/img/main_img2.jpg";
            idx = 2;
        } 
} 
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
  /* -----------------------------------메인바디 좌측 카테고리 스타일 모음----------------------------------- */
    .store_body{width: 1400px; margin: 0 auto; display: flex; }  
    .store_body a{width: 10px;}
    .store_left_category ul li{list-style: none;  width: 150px; text-align: center; font-family: 'GmarketSansMedium';}
    .left_category{border-bottom: 1px solid rgb(190, 190, 190); font-weight: bolder; height: 70px; padding-top: 50px;}
    #left_category{height: 50px; padding-top: 25px; width: 150px;}
    #left_category a:hover{color:#21d9cb; border-bottom: 1px solid rgb(190, 190, 190); }  
      /* -----------------------------------메인바디 상품리스트 스타일모음----------------------------------- */
     .store_product_top{width: 1250px; } 
    .store_product_top table{ width: 1150px;  margin: 0 auto; }
    /* .store_product_top table tr td:nth-child(1){width: 30px; padding-left: 30px; font-size: 13px; padding-top: 5px; color: rgb(105, 105, 105); border: 1px solid black;}
    .store_product_top table tr td:nth-child(2){font-size: 13px; padding-top: 5px; color: rgb(105, 105, 105); border: 1px solid red;}  */
    .store_product_top table tr td{text-align: right; left: -50px; position: relative;}
    #product_list{border: 1px solid #dee2e6; width: 100px; padding: 5px; border-radius: 6%; color: rgb(105, 105, 105);} 
    .store_product{display: flex; width: 100%;}
    .store_product_list{ padding: 5px; margin-top: 20px;   }
    .store_product_card{ height: 350px; font-family: 'Pretendard-Regular';}
    .store_product_list:first-child{ margin-left: 80px;}
    .store_product_list:nth-child(5){ margin-left: 80px;}
    .store_product_list img{width: 240px; height: 240px; margin-left: 15px; margin-top: 40px; border: 1px solid #dee2e6;}
    .store_product_seller{margin-left: 25px; margin-top: 5px; font-size: 12px;}
    .store_product_title{margin-left: 25px;  font-size: 17px; font-weight: bold; overflow: e; width:228px; height: 1em; white-space: nowrap;}
    .store_product_price{margin-left: 25px;  font-size: 20px; font-weight: bold;}    
    .store_product_top_title{position: relative; top: 50px; left: 103px;  font-family: 'Pretendard-Regular';}
    .store_product_card_top3{ height: 440px; width: 347px; font-family: 'Pretendard-Regular'; }
    .store_product_card_top3 img{width: 325px; height: 325px; margin-left: 20px; margin-top: 40px; border: 1px solid #dee2e6;}
    #store_main_img  {margin-left: 50px;}  
    #button_left, #button_right { width: 40px; height: 40px; position: relative;}
    #button_right{right: 26px; top: -110px; border-style: none; border-radius : 50%; font-size: 25px; box-shadow: 1px 1px 1px 1px gray;}
    #button_left{right: -73px; top: -110px; border-style: none; border-radius : 50%; font-size: 25px; box-shadow: 1px 1px 1px 1px gray;} 
    #button_right:hover{background-color: #21d9cb; color: white;}
    #button_left:hover{background-color: #21d9cb; color: white;}
    .store_product_title { font-size: 15px; font-weight: lighter;}
    .store_product_price{font-size: 18px;}  
    #topBoardList{width:1250px; flex-wrap: wrap;}
    #topBoardList4{width:1250px; flex-wrap: wrap;}
    .store_product_img{width:266px}
</style>
<body>
<!-- header -->
	<jsp:include page="common/header.jsp" />


<!-- body -->
	<section class="store_body">
    <div class="store_left_category">
        <ul>
            <li class="left_category">카테고리</li>
            <li id="left_category"><a class="pcate" data-category-seq="1">침대</a></li>
            <li id="left_category"><a class="pcate" data-category-seq="2">쇼파</a></li>
            <li id="left_category"><a class="pcate" data-category-seq="3">식탁</a></li>
            <li id="left_category"><a class="pcate" data-category-seq="4">의자</a></li>
            <li id="left_category"><a class="pcate" data-category-seq="5">책상</a></li>
            <li id="left_category"><a class="pcate" data-category-seq="6">옷장</a></li>
            <li id="left_category"><a class="pcate" data-category-seq="7">조명</a></li>
            <li id="left_category"><a class="pcate" data-category-seq="8">화장대</a></li>
        </ul>
    </div>  
    
<script>
	$(function() {
		$(".pcate").click(function(e){
			var categorySeq = e.target.dataset.categorySeq;
			location.href='storelist.bo?cateNo='+ categorySeq;
		})
	})
	
</script>
 <!-- -------------------------메인 이미지 슬라이드---------------------------------------- -->        
 
 
 <div class="store_main">
    <button id="button_left" onclick="ChnImg1()"><</button>
        <a href="#target"><img id="store_main_img" src="${path}/resources/img/main_img1.jpg" width="1050px" height="230px" style="margin-top: 80px;"></a>  
        <button id="button_right"  onclick="ChnImg2()"> ></button>
    
<div>

 <!-- ----------------------------가구별 판매량 1위 첫번째행----------------------------------------- -->        

         <div class="store_product_top_title"><h3><img src="${ path }/resources/img/top_tropli.png" width="25px">&ensp;가구별 판매량 1위</h3></div>
     
    
            <div class="store_product" id="topBoardList">
            
				<!-- 현재 조회수가 가장 높은 상위 8개를 조회하여 보여주기(ajax) -->
				
            </div>
            
            	<!-- TOP리스트 ajax -->
                <script type="text/javascript">
	                $(function() {
	                	topStoreBoardList();
	                	
	        		});
                	function topStoreBoardList() {
            			$.ajax({
            				url: "topStoreBoardList.bo",
            				success:function(list){
            					let value = "";
            					console.log(list);
            					for(let i in list) {
            						value += "<div class='store_product_list'>"
            						 	  +		"<div class='store_product_card'>"
            							  + 		"<a href='productdetail.bo?pno=" + list[i].proNo + "'>"
            							  + 			"<div class='store_product_img'><img src=" + list[i].proChangeImg + "></div>"
            							  +				"<div class='store_product_seller'><p>" + list[i].selBusName + "</p></div>"
            							  +				"<div class='store_product_title'><p>" + list[i].proName + "</p></div>"
            							  +				"<div class='store_product_price'><p>" + list[i].proPrice + " 원</p></div>"
            							  +			"</a>"
            							  +	 	"</div>"
            							  +	"</div>"
            					}
            					$("#topBoardList ").html(value); 
            				} ,
            				error:function() {
            					console.log("상품 조회수 top8 상품 조회 ajax 통신 오류");
            				}
            			})
            		}
                </script>

            
<!-- ----------------------------집들이 조회수 탑쓰리---------------------------------------- -->            

	<div id="target"><div class="store_product_top_title"><h3><img src="${ path }/resources/img/greate_img.png" width="30px">&ensp;집들이 조회수 TOP3</h3></div></div>
	<div class="store_product" id="topBoardList2">
	
		<!-- 집들이 조회수가 가장 높은 상위 3개를 조회하여 보여주기(ajax) -->
		
	</div>
	
	
    <script type="text/javascript">
		$(function() {
			topStoreBoardList2();
		});
		function topStoreBoardList2() {
			$.ajax({
				url: "topStoreBoardList2.bo",
				success:function(list){
					let value = "";
					console.log(list);
					for(let i in list) {
						value += "<div class='store_product_list'>"
						 	  +		"<div class='store_product_card_top3'>"
							  + 		"<a href='detail.bo?bno=" + list[i].boardNo + "'>"
							  + 		"<div class='store_product_img'><img src=" + list[i].boardMainImgChange + "></div>"
							  +			"<div class='store_product_seller'><p>" + list[i].homeFamily + "</p></div>"
							  +			"<div class='store_product_title'><p>" + list[i].homeOption + "</p></div>"
							  +			"<div class='store_product_price'><p>" + list[i].boardTitle + " </p></div>"
							  +			"</a>"
							  +	 	"</div>"
							  +	"</div>"
					}
					$("#topBoardList2 ").html(value); 
				} ,
				error:function() {
					console.log("집들이 조회수 TOP3 조회 ajax 통신 오류");
				}
			})
		}
	</script>
	


<!-- ---------------------------상품 조회 탑3----------------------------------------- --> 
	<div class="store_product_top_title"><h3><img src="${ path }/resources/img/greate_img.png" width="30px">&ensp;가구 조회수 TOP3</h3></div>
	<div class="store_product" id="topBoardList3">
		
		<!-- 현재 조회수가 가장 높은 상품 상위 3개를 조회하여 보여주기(ajax) -->
		
	</div>
	<script type="text/javascript">
		$(function() {
			topStoreBoardList3();
		});
		function topStoreBoardList3() {
			$.ajax({
				url: "topStoreBoardList3.bo",
				success:function(list){
					let value = "";
					console.log(list);
					for(let i in list) {
						value += "<div class='store_product_list'>"
						 	  +		"<div class='store_product_card_top3'>"
							  + 		"<a href='productdetail.bo?pno=" + list[i].proNo + "'>"
							  + 		"<div class='store_product_img'><img src=" + list[i].proChangeImg + "></div>"
							  +			"<div class='store_product_seller'><p>" + list[i].selBusName + "</p></div>"
							  +			"<div class='store_product_title'><p>" + list[i].proName + "</p></div>"
							  +			"<div class='store_product_price'><p>" + list[i].proPrice + " 원</p></div>"
							  +			"</a>"
							  +	 	"</div>"
							  +	"</div>"
					}
					$("#topBoardList3 ").html(value); 
				} ,
				error:function() {
					console.log("전체 상품 조회수 top3 상품 조회 ajax 통신 오류");
				}
			})
		}
	</script>
	<hr style="margin: 50px 0 0 0; margin-left: 100px; width: 1065px;">

<!-- ---------------------------모든제품(무한스크롤)4세트씩 넣어야 함-------------------------------------------> 
	<div class="store_product_top_title"><h3>⚡️신규제품</h3></div> 
	<div class="store_product" id="topBoardList4" style="margin-bottom: 80px">
		<!-- 전체 상품 리스트(ajax) -->
	</div> 
	
  	<script type="text/javascript">
		$(function() {
			topStoreBoardList4();
		});
		
		function topStoreBoardList4() {
			$.ajax({
				url: "topStoreBoardList4.bo",
				success:function(list){
					let value = "";
					console.log(list);
					for(let i in list) {
						value += "<div class='store_product_list'>"
						 	  +		"<div class='store_product_card'>"
							  + 		"<a href='productdetail.bo?pno=" + list[i].proNo + "'>"
							  + 		"<div class='store_product_img'><img src=" + list[i].proChangeImg + "></div>"
							  +			"<div class='store_product_seller'><p>" + list[i].selBusName + "</p></div>"
							  +			"<div class='store_product_title'><p>" + list[i].proName + "</p></div>"
							  +			"<div class='store_product_price'><p>" + list[i].proPrice + " 원</p></div>"
							  +			"</a>"
							  +	 	"</div>"
							  +	"</div>"
					}
					$("#topBoardList4 ").html(value); 
				} ,
				error:function() {
					console.log("전체 상품 조회 ajax 통신 오류");
				}
			})
		}
	</script>

</section> 
<!-- footer -->	
	<jsp:include page="common/footer.jsp" />	
</body>
</html>