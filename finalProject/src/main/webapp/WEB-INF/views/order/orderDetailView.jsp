<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>
	/* alert("${alertMsg}"); */

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
    .order_list{width: 950px; margin: 0 auto; border: 1px solid lightgray; border-radius: 5px; margin-top: 70px; font-family: 'Pretendard-Regular'; padding-top: 30px; padding-bottom: 30px;}
    .detail_top{display: flex; height: 50px;  margin-left: 20px; margin-right: 20px; font-size: 18px; font-weight: bolder; border-bottom: 1px solid lightgray; margin-top: 50px;}
    .detail_top div:nth-child(1){width: 850px;}
    .detail_top div:nth-child(2){width: 100px; text-align: center; background-color: rgb(224, 224, 224); margin-bottom: 10px; padding-top: 7px; border-radius: 5px;}
    .detail_body{display: flex; height: 200px; margin-left: 20px; margin-right: 20px; width: 910px; }
    .detail_body_category{width: 400px; margin-left: 10px; padding-top: 70px; }
    .detail_body_category div:nth-child(1){margin-bottom: 10px;}
    .detail_body_category div:nth-child(2){font-weight: bolder;}
    .detail_body_option{width: 250px; padding-top: 70px;}
    .detail_body_option div:nth-child(1){margin-bottom: 10px;}
    .detail_body_option div:nth-child(2){font-weight: bolder;}
    .detail_body_button {width: 260px; text-align: right; padding-top: 40px;}
    .detail_body_button div:nth-child(1){margin-bottom: 20px;}
    .detail_body_button button{background-color: #21d9cb; border: 1px solid #21d9cb; width: 200px; height: 50px; color: white; font-size: 18px; font-weight: bolder;cursor: pointer; border-radius: 5px;}
    .detail_body img{width: 150px; margin-top: 25px;}
    .detail_bottom{height: 100px; margin-left: 20px; margin-right: 20px; text-align: center; background-color: #f6fdfd; border-radius: 5px; margin-bottom: 70px;}
    .detail_bottom div:nth-child(1){margin-bottom: 10px; padding-top: 30px;}
    .detail_bottom div:nth-child(2){font-size: 16px; font-weight: bolder;}

    /* 맨위에 주문상태 옵션 */
    .order_status{display: flex; height: 30px; margin-left: 20px;}
    .order_status select{background-color: rgb(247, 248, 250); font-weight: bold; color: rgba(0, 0, 0, 0.7); border: none; font-family: 'Pretendard-Regular'; border-radius: 3px; box-shadow: 0px 0px 1px #555;}
    
</style>
<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp" />
    <section class="sellerpage_main_body">      
        <div class="order_list">
            <div class="order_list_detail">
                <div class="order_status">
                    <select name="" id="">
                        <option value="0">주문상태</option>
                        <option value="1">구매 대기중</option>
                        <option value="1">구매확정</option>
                    </select>
                </div>
                <div class="detail_top">
                    <div>주문일자 2022.01.06</div>
                    <div style="background-color: #21d9cb; color: white;">구매완료</div>
                </div>
                <div class="detail_body">
                    <div><img src="resource/img/MASS아쿠아텍스2인소파2.jpg"></div>
                    <div class="detail_body_category">
                        <div>카테고리 | 쇼파</div>
                        <div>상품이름 상품이름 상품이름</div>
                    </div>
                    <div class="detail_body_option">
                        <div>옵션 | 블랙</div>
                        <div>10,000원 | 1개</div>
                    </div>
                    <div class="detail_body_button">
                        <div><button>리뷰작성</button></div>
                    </div>
                </div>
                <div class="detail_bottom">
                    <div>판매자 | ${ p.selBusName }</div>
                    <div>판매자 연락처 | ${ p.selPhone }</div>
                </div>

                <div class="detail_top">
                    <div>주문일자 2022.01.06</div>
                    <div style="background-color: #21d9cb; color: white;">구매완료</div>
                </div>
                <div class="detail_body">
                    <div><img src="resource/img/MASS아쿠아텍스2인소파2.jpg"></div>
                    <div class="detail_body_category">
                        <div>카테고리 | 식탁</div>
                        <div>상품이름 상품이름 상품이름</div>
                    </div>
                    <div class="detail_body_option">
                        <div>옵션 | 블랙</div>
                        <div>10,000원 | 1개</div>
                    </div>
                    <div class="detail_body_button">
                        <div><button>구매확정</button></div>
                        <div><button style="color: #21d9cb; background-color: #fff;">주문취소</button></div>
                    </div>
                </div>
                <div class="detail_bottom">
                    <div>판매자 | 한샘샘</div>
                    <div>판매자 연락처 | 010-7925-7631</div>
                </div>


                <div class="detail_top">
                    <div>주문일자 2022.01.06</div>
                    <div style="color: red;">구매철회</div>
                </div>
                <div class="detail_body">
                    <div><img src="resource/img/MASS아쿠아텍스2인소파2.jpg"></div>
                    <div class="detail_body_category">
                        <div>카테고리 | 식탁</div>
                        <div>상품이름 상품이름 상품이름</div>
                    </div>
                    <div class="detail_body_option">
                        <div>옵션 | 블랙</div>
                        <div>10,000원 | 1개</div>
                    </div>
                    <div class="detail_body_button">
                        <div><button style="display: none;">판매확정</button></div>
                        <div><button style="display: none;">주문취소</button></div>
                    </div>
                </div>
                <div class="detail_bottom">
                    <div>판매자 | 한샘샘</div>
                    <div>판매자 연락처 | 010-7925-7631</div>
                </div>


            </div>
        </div>

        



        <!-- 페이징처리 -->
        <div class="order_list_paging">
            1  2  3  4  5
        </div>
    </section>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>