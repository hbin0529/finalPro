<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<script>
    $(function(){
        $("#header_store").mouseover(function(){
            $(".header_store_dropdown").stop().fadeIn(300);
        })
        $(".header_store_dropdown").mouseleave(function(){
            $(".header_store_dropdown").stop().fadeOut(300);
        })

        $("#allchk").click(function() {
            if($("#allchk").is(":checked")) $(".chkbox").prop("checked", true);
            else $(".chkbox").prop("checked", false);
        });

        $(".chkbox").click(function() {
            var total = $(".chkbox").length;
            var checked = $(".chkbox:checked").length;

            if(total != checked) $("#allchk").prop("checked", false);
            else $("#allchk").prop("checked", true); 
        });

        // 보유 포인트가 0보다 크면 색상 변함
        if($("#point_level").val() > 0) {
            $("#point_level").css({"background-color" : "#fff", "color":"#333"})
        }
    })

    function charge() {
        let chargegogo  = window.open('charge.or', "_blank", 'top=100, left=200, width=1250, height=650')
    }
</script>
<style type="text/css">
/* 주문결제페이지 */
    .main_wrap{display: flex; -webkit-box-pack: center; justify-content: center; position: relative; width: 100%; max-width: 1256px; padding: 0px 60px; margin: 0px auto; box-sizing: border-box;}
    /* 왼쪽 주문창 */
    .left_container{flex: 1 0 0px; box-sizing: border-box;}
    .left_container h1{font-size: 24px; line-height: 36px; color: rgb(0, 0, 0); font-weight: bold; margin: 40px 0px 20px;}
    /* 오른쪽 sticky주문창 */
    .sticky_wrap{position: relative; flex: 0 1 0px; min-width: 366px; margin-left: 40px; box-sizing: border-box;} 
    .sticky_container{position: sticky; top: 81px; transition: top 0.1s ease 0s; border: 1px solid rgb(234, 235, 239); padding: 20px;}
    .necessary{display: flex; -webkit-box-align: center; align-items: center; text-align: left; border: 0px; background-color: transparent; width: 100%; padding: 0px; font-weight: normal; font-size: 14px; line-height: 17px; color: rgb(101, 110, 117); letter-spacing: -0.4px; padding: 10px;}
    .submitbut{width: 100%; margin-top: 20px; padding: 15px 10px; line-height: 20px; font-size: 17px; min-height: 50px; background-color: #21d9cb; color: #fff; border-radius: 5px; border: none;
                cursor: pointer;}
    .order_input{display: inline-block; width: 100%; margin: 0; padding: 8px 15px 9px; border: 1px solid #dbdbdb; background-color: #fff; 
        color: #000; border-radius: 4px; box-sizing: border-box; font-size: 15px; font-weight: bold; line-height: 21px; 
        transition: border-color .1s,background-color .1s;}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp" />
	    <!-- 주문결제 -->
    <form action="" method="post">
    <div class="main_wrap">
        <!-- 왼쪽 상품 주문창 -->
        <div class="left_wrap" style="flex: 1 0 0px; box-sizing: border-box;">
            <div class="left_container">
                <h1>주문/결제</h1>
                <!-- 배송지 -->
                <div style="margin-bottom: 50px;">
                    <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px; display: flex; -webkit-box-align: center; align-items: center; height: 56px;
                    border-bottom: 1px solid rgb(234, 235, 239);">
                        <div style="font-size: 20px; font-weight: bold;">배송지</div>
                        <div style="flex: 0px; text-align: right; font-weight: bold; color: #21d9cb;">변경</div>
                    </div>
                    <div style="overflow: hidden; margin: -3px; padding: 23px 3px 3px; box-sizing: border-box;">
                        <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px;">
                            <div style="display: flex; -webkit-box-align: center; align-items: center; font-weight: bold; font-size: 18px; line-height: 20px; color: rgb(41, 41, 41);">배송지명</div>
                            <div style="margin-top: 10px;">서울 동작구 알마타길 37 (대방동) 대방1차e-편한세상</div>
                            <div style="display: flex;; line-height: 2rem; font-size: 15px;">
                                <div style="max-width: calc(100% - 130px); text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; overflow: hidden;">이형빈</div>
                                <div style="width: 120px; margin-left: 8px;">010-1234-1234</div>
                            </div>
                            <div style="padding: 20px 10px 0px 0px; max-width: 642px;">
                                <div style="position: relative; display: inline-block; width: 100%;">
                                    <select class="order_input">
                                        <option value="0">나중에 직접입력 구현하기</option>
                                        <option value="1">부재시 문앞에 놓아주세요</option>
                                        <option value="2">배송전에 미리 연락주세요</option>
                                        <option value="3">부재시 경비실에 맡겨 주세요</option>
                                        <option value="4">부재시 전화주시거나 문자 남겨 주세요</option>
                                        <option value="5">배송시 요청사항을 선택해주세요</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 주문자 -->
                <div style="margin-bottom: 50px;">
                    <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px; display: flex; 
                    -webkit-box-align: center; align-items: center; height: 56px; border-bottom: 1px solid rgb(234, 235, 239);">
                        <div style="font-size: 20px; font-weight: bold;">주문자</div>
                    </div>
                    <div style="overflow: hidden; margin: -3px; padding: 23px 3px 3px; box-sizing: border-box;"> 
                        <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px;">
                            <!-- 이름 -->
                            <label for="">
                                <div style="display: flex; padding: 0px 0px 8px;">
                                    <div style="display: flex; align-items: center; width: 72px; font-size: 15px;">이름</div>
                                    <div style="flex: 1 0 0px; max-width: 270px;">
                                        <input class="order_input" type="text">
                                    </div>
                                </div>
                            </label>
                            <!-- 이메일 -->
                            <label for="">
                                <div style="display: flex; padding: 8px 0px;">
                                    <div style="display: flex; align-items: center; width: 72px; font-size: 15px;">이메일</div>
                                    <div style="display: flex; flex: 1 0 0px; max-width: 580px;">
                                        <div style="position: relative; display: inline-block; width: 50%;">
                                            <input class="order_input" type="text">
                                        </div>
                                        <span style="display: flex; align-items: center; padding: 10px;">@</span>
                                        <div style="position: relative; display: inline-block; width: 50%;">
                                            <select class="order_input">
                                                <option value="0">naver.com</option>
                                                <option value="1">gmail.com</option>
                                                <option value="2">nate.com</option>
                                                <option value="3">kakao.com</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </label>
                            <!-- 폰 -->
                            <label for="">
                                <div style="display: flex; padding: 8px 0px;">
                                    <div style="display: flex; align-items: center; width: 72px; font-size: 15px;">휴대전화</div>
                                    <div>
                                        <input type="text" class="order_input" placeholder="010-1234-1234">
                                    </div>
                                </div>
                            </label>
                        </div>
                    </div>
                </div>
                <!-- 주문 상품 -->
                <div style="margin-bottom: 50px;">
                    <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px; display: flex; 
                    -webkit-box-align: center; align-items: center; height: 56px; border-bottom: 1px solid rgb(234, 235, 239);">
                        <div style="font-size: 20px; font-weight: bold;">주문상품</div>
                    </div>
                    <div style="overflow: hidden; margin: -3px; padding: 23px 3px 3px; box-sizing: border-box;"> 
                        <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px;">
                            <!-- 상품정보 -->
                            <div style="overflow: hidden; border-radius: 4px; border: 1px solid rgb(234, 235, 239);">
                                <div style="padding: 11px 16px 10px; background-color: rgb(247, 248, 250);">
                                    <div style="display: flex; align-items: center;">
                                        <div style="flex: 1 0 0px; font-size: 14px; line-height: 19px; color: rgb(66, 66, 66); font-weight: bold;">
                                            회사이름
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div style="display: flex; padding: 16px; box-sizing: border-box;">
                                        <picture>
                                            <img src="resource/img/MASS아쿠아텍스2인소파2.jpg" alt="" style="width: 64px; height: 64px;">
                                        </picture>
                                        <div style="flex: 1 0 0px; align-items: center; margin-left: 10px;">
                                            <div style="font-size: 15px; line-height: 18px; color: rgb(41, 41, 41); margin: 8px 0;">
                                                상품명을 등록하면되는데 이걸 어떻게 해야할까요
                                            </div>
                                            <div style="display: flex; -webkit-box-align: center; align-items: center; margin-top: 11px;">
                                                <span style="font-size: 14px; line-height: 17px; color: rgb(41, 41, 41); font-weight: bold;">가격45,000원</span>
                                                <span style="margin: 0px 12px; font-size: 10px;">|</span>
                                                <span style="font-size: 13px; line-height: 16px; color: rgb(117, 117, 117);">1개</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 포인트 -->
                <div style="margin-bottom: 50px;">
                    <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px; display: flex; 
                    -webkit-box-align: center; align-items: center; height: 56px; border-bottom: 1px solid rgb(234, 235, 239);">
                        <div style="font-size: 20px; font-weight: bold;">보유 포인트</div>
                    </div>
                    <div style="overflow: hidden; margin: -3px; padding: 23px 3px 3px; box-sizing: border-box;"> 
                        <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px;">
                            <div style="display: flex; margin-bottom: 12px; max-width: 322px;">
                                <input id="point_level" class="order_input" type="number" value="0" disabled style="background-color: rgb(250, 250, 250); border-color: rgb(219, 219, 219); color: #bdbdbd; flex: 1 0 0px;">
                                <button class="wid360 bora4" type="button" onclick="charge()" style="background-color: #fff; border: 1px solid transparent; border-radius: 3px;
                                            border-color: #21d9cb; color: #21d9cb; margin-left: 8px; padding: 11px 10px; min-height: 40px; cursor: pointer;">
                                        	충전하기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 오른쪽 최종 결제창 -->
        <div class="sticky_wrap" style="top: 50px;">
            <div class="sticky_container">
                <div class="">
                    <!-- 결제금액 상단 -->
                    <div>
                        <h2 style="margin-bottom: 20px; font-size: 20px;">결제금액</h2>
                        <div style="display: flex; align-items: center; line-height: 2rem; font-size: 15px;">
                            <div>총 상품 금액</div>
                            <div style="flex: 0px; text-align: right; font-weight: bold;">45,000원</div>
                        </div>
                        <div style="display: flex; align-items: center; line-height: 2rem; font-size: 15px;">
                            <div>배송비</div>
                            <div style="flex: 0px; text-align: right;">0원</div>
                        </div>
                        <div style="display: flex; align-items: center; line-height: 2rem; font-size: 15px;">
                            <div>쿠폰 사용</div>
                            <div style="flex: 0px; text-align: right;">0원</div>
                        </div>
                        <div style="display: flex; align-items: center; line-height: 2rem; font-size: 15px;">
                            <div>포인트 사용</div>
                            <div style="flex: 0px; text-align: right;">0원</div>
                        </div>
                        <div style="display: flex; align-items: center; line-height: 2rem; border-top: 1px solid rgb(234, 235, 239); padding-top: 19px; padding-bottom: 19px; margin-top: 20px;">
                            <div style="font-size: 18px; font-weight: bold;">최종 결제 금액</div>
                            <div style="flex: 0px; text-align: right; font-size: 22px; font-weight: bold; color: #21d9cb;">45,000원</div>
                        </div>
                    </div>
                    <!-- 필수 동의란 -->
                    <div class="bd1 wid360 terms" style="border-top: 1px solid rgb(234, 235, 239);">
                        <label for="" style="display: flex; -webkit-box-align: center; align-items: center; padding: 12px 0px 12px 24px; font-size: 15px; line-height: 18px; color: rgb(0, 0, 0);"><input type="checkbox" id="allchk" style="display: flex; margin: -9px 3px -9px -9px;">전체동의</label>
                        <label for=""><hr></label>
                        <label for="" class="necessary"><input type="checkbox" class="chkbox">개인정보수집 및 이용동의(필수)</label>
                        <label for="" class="necessary"><input type="checkbox" class="chkbox">결제 서비스 이용약관 동의(필수)</label>
                    </div>
                    <input type="submit" class="submitbut wid360 bora4" value="45,000원 결제하기">
                </div>
            </div>
        </div>
    </div>
    </form>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>