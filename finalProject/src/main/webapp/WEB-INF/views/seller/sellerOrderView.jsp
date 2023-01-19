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
    /*-------------------------헤더스타일모음--------------------------- */
    *{margin: 0; padding: 0; text-decoration: none;}
    a{text-decoration: none; color: black;  cursor: pointer;}
    .main_logo a {
        font-family: 'SDSamliphopangche_Outline'; color: #21d9cb; font-size: 38px;}
    .main_logo li {position: relative; right:70px; list-style: none;} 
    .top_box{ width: 1400px; height: 120px;  margin: 0 auto; display: flex; justify-content: center; align-items:center;}
    .main_top {display: flex; height: 40px;  position: relative; font-family: 'GmarketSansMedium';}
    .main_top ul {list-style: none; text-align: center;} 
    .logo_name { position: absolute; left: -170px; } 
    .main_category ul {display: flex; }
    .main_category ul li {margin-right: 20px; font-size: 18px; font-weight: bold; position: relative; left: 5px; top: 18px;}
    .main_category ul li a:hover{color: #21d9cb;}
    .main_search ul{display: flex;}    
    .main_login ul{display: flex; margin-left: 50px;}
    .main_login ul li {margin-right: 20px; position: relative; left: 60px; font-size: 14px; top: 12px;}
    .main_login ul li:first-child{top: 3px;}
    .main_login ul li:last-child{top: 2px;}
    .main_login ul li a{cursor: pointer;}
    .main_login img {width: 26px;}
    #login_cart{width: 32px;}
    .main_search input {width: 300px; height: 40px; border: 1px solid rgb(215, 213, 213); border-radius: 5px; font-size: 16px; position: relative; left: 60px; padding-left: 10px;}
    .main_search button {width: 50px; height: 40px; border: none; background-color: #21d9cb; color: white; border-radius: 3px; position: relative; left: 60px; cursor: pointer;}
    hr{border-color: white;} 
    #header_store{ height: 65px; width: 100px;} 

    /*------------------------- 드롭다운 스타일모음 -------------------------*/
    .header_store_dropdown{width: 1400px;margin: 0 auto; display: none; }
    .header_store_dropdown table{width: 700px; margin-left: 380px; }
    #store_dropdown_img{width: 40px;}
    .header_store_dropdown tr:first-child{ text-align: center; }
    .header_store_dropdown tr:last-child{text-align: center; font-family: 'GmarketSansMedium'}
    .header_store_bar{width: 2500px; margin-left: -900px;}

    /*----------------------------------- 푸터 스타일 모음-------------------------------------------- */
    a{text-decoration: none; color: black;}
    footer {height: 300px; background-color: #f6fdfd;}
    footer ul li{list-style: none;}
    .bottom_box{display: flex;  align-items: center;}
    .footer_wrap{display: flex; margin: 0 auto;}
    .footer_callcenter{width: 300px; font-size: 12px;}
    .footer_callcenter ul li{margin-bottom: 5px;}
    #callcenter{font-size: 22px; font-weight: bold; font-family: 'GmarketSansMedium';} 
    #callcenter_number{font-family: 'SDSamliphopangche_Outline'; font-size: 30px; color: #21d9cb; padding-top: 10px; padding-bottom: 10px;}
    .footer_category{width: 700px;display: flex; }
    .footer_sns{width: 400px; font-size: 12px;}
    .footer_sns table {margin: 0 auto;}
    .footer_sns img{width: 30px; height: 30px;padding-left: 20px;}
    #category_name{text-align: center; font-size: 15px; font-weight: bold; padding-bottom: 20px; font-family: 'GmarketSansMedium';}
    #category_text{font-size: 11px; padding-bottom: 10px; }
    #footer_logo_top {font-family: 'SDSamliphopangche_Outline'; font-size: 40px; color: #21d9cb; text-align: center; padding-top: 20px;}
    #footer_logo_bottom {font-family: 'SDSamliphopangche_Outline'; text-align: center; font-size: 20px;}

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
    
</style>
<body>
    <header class="top_box">
        <nav class="main_top">
            <div class="main_logo" >
                <li><a href="">59'HOUSE</a></li>
                <li><a href="" style="color:black; font-size: 20px; margin-left: 80px;">오구싶은집</a></li>
            </div>
            <div class="main_category">
                <ul>
                     <li><a href="">집들이</a></li>
                     <li id="header_store"><a href="" style="color:#21d9cb" >스토어</a></li>
                     <li><a href="">인테리어</a></li>
                 </ul>
             </div>
             <div class="main_search">
                <input id="search_bar" type="text" placeholder="통합검색">
                <button>검색</button>
             </div>
            <div class="main_login">
                <ul>
                    <li><a href=""><img id="login_cart" src="img/main_cart.png"></a></li>
                    <li><a href="">로그인</a></li>
                    <li>|</li>
                    <li><a href="">회원가입</a></li>
                    <li><a href=""><img src="img/main_chat.png"></a></li>
                </ul>
            </div> 
        </nav> 
    </header> 
    <hr> 
    <div class="header_store_dropdown">
        <table class="">
            <tr class="">
                <td><a href=""><img src="img/category_bed.png" id="store_dropdown_img"></a></td>
                <td><a href=""><img src="img/category_sofa.png" id="store_dropdown_img"></a></td>
                <td><a href=""><img src="img/category_table.png" id="store_dropdown_img"></a></td>
                <td><a href=""><img src="img/category_chair.png" id="store_dropdown_img"></a></td>
                <td><a href=""><img src="img/category_desk.png" id="store_dropdown_img"></a></td>
                <td><a href=""><img src="img/category_closet.png" id="store_dropdown_img"></a></td>
                <td><a href=""><img src="img/category_ledlemp.png" id="store_dropdown_img"></a></td>
                <td><a href=""><img src="img/category_makeup.png" id="store_dropdown_img"></a></td>
            </tr>
            <tr>
                <td><a href="" id="store_dropdown_bed">침대</a></td>
                <td><a href="">쇼파</a></td>
                <td><a href="">식탁</a></td>
                <td><a href="">의자</a></td>
                <td><a href="">책상</a></td>
                <td><a href="">옷장</a></td>
                <td><a href="">조명</a></td>
                <td><a href="">화장대</a></td>
            </tr>
        </table>
        <hr class="header_store_bar">
    </div>

    <!--마이페이지 메뉴바-->
    <section>
        <div class="mypage_body">
            <div class="mypage_category">
                <table>
                    <tr>
                        <td><a href="" id="mypage_menu">판매상품</a></td>
                        <td><a href="" id="mypage_menu" style="color: #21d9cb;">주문내역</a></td>
                        <td><a href="" id="mypage_menu">답변내역</a></td>
                        <td><a href="" id="mypage_menu">개인정보수정</a></td>
                    </tr>
                </table>
            </div>
        </div>
        <hr>
    </section>

    <section class="sellerpage_main_body">
        <div class="order_count">
            <div><p>주문내역</p></div>
            <div><p>1,234</p></div>
        </div>

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
                            <td id="table_border">3</td>
                            <td>30,000</td>
                        </tr>
                        <tr id="order_sum_table_3row">
                            <td id="table_border">취소</td>
                            <td id="table_border">3</td>
                            <td>30000</td>
                        </tr>
                        <tr id="order_sum_table_4row">
                            <td id="table_border">총 주문</td>
                            <td id="table_border">6</td>
                            <td>60,000</td>
                        </tr>
                        <tr id="order_sum_table_5row">
                            <td id="table_border">실 매출</td>
                            <td id="table_border">3</td>
                            <td>30,000</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        
        <div class="order_list">
            <div class="order_list_detail">
                <div class="detail_top">
                    <div>주문일자 2022.01.06</div>
                    <div>판매요청</div>
                </div>
                <div class="detail_body">
                    <div><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                    <div class="detail_body_category">
                        <div>카테고리 | 식탁</div>
                        <div>상품이름 상품이름 상품이름</div>
                    </div>
                    <div class="detail_body_option">
                        <div>옵션 | 블랙</div>
                        <div>10,000원 | 1개</div>
                    </div>
                    <div class="detail_body_button">
                        <div><button>판매확정</button></div>
                        <div><button>주문취소</button></div>
                    </div>
                </div>
                <div class="detail_bottom">
                    <div>고객이름 | 고숙경</div>
                    <div>고객연락처 | 010-7925-7631</div>
                </div>

                <div class="detail_top">
                    <div>주문일자 2022.01.06</div>
                    <div style="background-color: #21d9cb; color: white;">판매완료</div>
                </div>
                <div class="detail_body">
                    <div><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
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
                    <div>고객이름 | 고숙경</div>
                    <div>고객연락처 | 010-7925-7631</div>
                </div>


                <div class="detail_top">
                    <div>주문일자 2022.01.06</div>
                    <div style="color: red;">판매취소</div>
                </div>
                <div class="detail_body">
                    <div><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
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
                    <div>고객이름 | 고숙경</div>
                    <div>고객연락처 | 010-7925-7631</div>
                </div>


            </div>
        </div>

        



        <!-- 페이징처리 -->
        <div class="order_list_paging">
            1  2  3  4  5
        </div>
    </section>


    <footer class="bottom_box">
        <div class="footer_wrap">
            <div class="footer_callcenter">
                <ul>
                    <li id="callcenter">&emsp;&ensp;고객센터</li>
                    <li id="callcenter_number">1599-5959</li>
                    <li>평일 10:00 ~ 18:00</li>
                    <li>점심시간 13:00 ~ 14:00 제외</li>
                    <li>주말/공휴일 제외</li>
                </ul>
            </div>
            <div class="footer_category">
                <table>
                    <tr>
                        <td id="category_name"><a href="">회사소개</a></td>
                        <td id="category_name"><a href="">이용약관</a></td>
                        <td id="category_name"><a href="">공지사항</a></td>
                        <td id="category_name"><a href="">고객의소리</a></td>
                        <td id="category_name"><a href="">개인정보처리방침</a></td>
                    </tr>
                    <tr>
                        <td id="category_text" colspan="5">(주)오구하우스 | 대표이사 안효빈 | 공동대표 고숙경 김수연 이형빈 | 서울특별시 영등포구 양평동 4가2 19층<br>
                            59house@gmail.com | 사업자등록번호 199-50-59590 사업자정보확인 | 통신판매업신고번호 제 2022-서울서초-5959호</td>
                    </tr>
                    <tr>
                        <td id="category_text" colspan="5">(주)오구하우스는 통신판매중개자로 거래 당사자가 아니므로, 판매자가 등록한 상품정보 및 거래 등에 대해 책임을 지지 않습니다.<br>
                            단, (주)버킷플레이스가 판매자로 등록 판매한 상품은 판매자로서 책임을 부담합니다.</td>
                    </tr>
                </table>
            </div>
            <div class="footer_sns">
                <table>
                    <tr>
                        <td id=""><a href=""><img src="img/sns_instagram.png"></a></td>
                        <td id=""><a href=""><img src="img/sns_facebook.png"></a></td>
                        <td id=""><a href=""><img src="img/sns_youtube.png"></a></td>
                        <td id=""><a href=""><img src="img/sns_twitter.png"></a></td>
                    </tr>
                    <tr>
                        <td colspan="4">* Icons made by Freepik from FLACTICON</td>
                    </tr>
                    <tr>
                        <td colspan="4" id="footer_logo_top"><a href="" style="color: #21d9cb;">59'HOUSE</a></td>
                    </tr>
                    <tr>
                        <td colspan="4" id="footer_logo_bottom">&emsp;&emsp;&emsp;&emsp;<a href="">오구싶은집</a></td>
                    </tr>
                </table>
                    
            </div>
        </div>
    </footer>
</body>
</html>