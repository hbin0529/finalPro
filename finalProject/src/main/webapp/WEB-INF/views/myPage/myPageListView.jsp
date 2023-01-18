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
<link href="${pageContext.request.contextPath}/resources/css/homeboard.css"  rel="stylesheet" type="text/css">
<body>

<jsp:include page="../common/header.jsp" />

<!--마이페이지 메뉴바-->
    <section>
        <div class="mypage_body">
            <div class="mypage_category">
                <table>
                    <tr>
                        <td><a href="" id="mypage_menu">장바구니</a></td>
                        <td><a href="" id="mypage_menu">나의쇼핑</a></td>
                        <td><a href="" id="mypage_menu" style="color: #21d9cb;">나의리뷰</a></td>
                        <td><a href="" id="mypage_menu">개인정보수정</a></td>
                    </tr>
                </table>
            </div>
        </div>
        <hr>
        <div class="mypage_review_category">
            <table>
                <tr>
                    <td><a href="" id="mypage_review_menu">상품리뷰</a></td>
                    <td><a href="" id="mypage_review_menu" style="color: #21d9cb;">집들이</a></td>
                    <td><a href="" id="mypage_review_menu">문의내역</a></td>
                </tr>
            </table>
        </div>
        <hr width="1000px" style="margin: 0 auto;">
    </section>

    <section class="mypage_main_body">
        <div class="mypage_home_review">
            <div class="home_review">
                <div class="home_review_list">
                    <div class="home_review_card">
                        <a href="">
                        <div class="home_review_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                        <div class="home_review_title">집들이 제목</p></div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="home_review">
                <div class="home_review_list">
                    <div class="home_review_card">
                        <a href="">
                        <div class="home_review_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                        <div class="home_review_title">집들이 제목</p></div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="home_review">
                <div class="home_review_list">
                    <div class="home_review_card">
                        <a href="">
                        <div class="home_review_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                        <div class="home_review_title">집들이 제목</p></div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="mypage_home_review">
            <div class="home_review">
                <div class="home_review_list">
                    <div class="home_review_card">
                        <a href="">
                        <div class="home_review_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                        <div class="home_review_title">집들이 제목</p></div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="home_review">
                <div class="home_review_list">
                    <div class="home_review_card">
                        <a href="">
                        <div class="home_review_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                        <div class="home_review_title">집들이 제목</p></div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="home_review">
                <div class="home_review_list">
                    <div class="home_review_card">
                        <a href="">
                        <div class="home_review_img"><img src="../FINAL/img/링컨세라믹14004인식탁세트1.JPG"></div>
                        <div class="home_review_title">집들이 제목</p></div>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 페이징처리 -->
        <div class="product_review_paging">
            1  2  3  4  5
        </div>
    </section>
    
<jsp:include page="../common/footer.jsp"/>
    

</body>
</html>