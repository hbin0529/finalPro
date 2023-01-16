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
    /*----------------------------------- 푸터 스타일 모음-------------------------------------------- */
    a{text-decoration: none; color: black; cursor: pointer;}
    footer {height: 300px; background-color: #f6fdfd;}
    footer ul li{list-style: none;}
    .bottom_box{display: flex;  align-items: center;}
    .footer_wrap{display: flex; margin: 0 auto;}
    .footer_callcenter{width: 300px; font-size: 12px;}
    .footer_callcenter ul li{margin-bottom: 5px;}
    #callcenter{font-size: 22px; font-weight: bold; font-family: 'GmarketSansMedium';} 
    #callcenter_number{font-family: 'SDSamliphopangche_Outline'; font-size: 30px; color: #21d9cb; padding-top: 10px; padding-bottom: 10px;}
    .footer_category{width: 700px; display: flex; font-family: 'Pretendard-Regular';}
    .footer_sns{width: 400px; font-size: 12px;}
    .footer_sns table {margin: 0 auto;}
    .footer_sns img{width: 30px; height: 30px;margin-left: 20px;}
    #category_name{text-align: center; font-size: 15px; font-weight: bold; padding-bottom: 20px; font-family: 'GmarketSansMedium';}
    #category_text{font-size: 11px; padding-bottom: 10px; font-family: 'Pretendard-Regular';}
    #footer_logo_top {font-family: 'SDSamliphopangche_Outline'; font-size: 40px; color: #21d9cb; text-align: center; padding-top: 20px;}
    #footer_logo_bottom {font-family: 'SDSamliphopangche_Outline'; text-align: center; font-size: 20px;}
    #footer_callcenter_txt {font-family: 'Pretendard-Regular';}
</style>
<body>
    <footer class="bottom_box">
        <div class="footer_wrap">
            <div class="footer_callcenter">
                <ul>
                    <li id="callcenter">&emsp;&ensp;고객센터</li>
                    <li id="callcenter_number">1599-5959</li>
                    <li id="footer_callcenter_txt">평일 10:00 ~ 18:00</li>
                    <li id="footer_callcenter_txt">점심시간 13:00 ~ 14:00 제외</li>
                    <li id="footer_callcenter_txt">주말/공휴일 제외</li>
                </ul>
            </div>
            <div class="footer_category">
                <table>
                    <tr>
											<!-- 이형빈_주문페이지_테스트 링크 -->
                        <td id="category_name"><a href="order.or">회사소개</a></td>
                        <td id="category_name"><a href="#">이용약관</a></td>
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
                        <td id=""><a href="#"><img src="${path}/resources/img/sns_instagram.png"></a></td>
                        <td id=""><a href="#"><img src="${path}/resources/img/sns_facebook.png"></a></td>
                        <td id=""><a href="#"><img src="${path}/resources/img/sns_youtube.png"></a></td>
                        <td id=""><a href="chat.in"><img src="${path}/resources/img/sns_twitter.png"></a></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="font-family: 'Pretendard-Regular';">* Icons made by Freepik from FLACTICON</td>
                    </tr>
                    <tr>
                        <td colspan="4" id="footer_logo_top"><a href="" style="color: #21d9cb;">59HOUSE</a></td>
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