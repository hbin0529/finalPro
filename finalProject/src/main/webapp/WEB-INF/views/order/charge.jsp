<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구싶은집 충전사이트</title>
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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script>
	$(function() {
	    // 포인트 충전금액 클릭시 색깔 변경
	    $(".price_point li").click(function() {
	        $(".price_point li").css({"color":"black", "border":"3px solid #fff"})
	        $(this).css({"color" : "white", "border":"3px solid #333"})
	    })
	
	    // 동의함 체크 안하고 충전하기 누를 시 알러트 창
	    $("")
	    // alert("충전 포인트 및 유효기간 확인 동의를 해주세요.")
	
	    // 동의함 체크시 색 변경
	    $("#agree").prop("checked", false);
	    $(".caution_info_danger_agree_label").click(function(){ 
	        // alert("충전 포인트 및 유효기간 확인 동의를 해주세요.")
	        if(true == $("#agree").is(":checked")) {
	            $(".caution_info_danger_agree_label").css({"background-color":"#21d9cb", "color":"#fff"})
	        } else {
	            $(".caution_info_danger_agree_label").css({"background-color":"#ccc", "color":"#333"})
	        }
	    })
	
	})
	function charge_Submit() {
	    if($("#agree").is(":checked") == false) {
	        alert("충전 포인트 및 유효기간 확인 동의를 해주세요.")
	    }
	}
</script>
</head>
<body>
<div class="wrap" style="font-family: 'Pretendard-Regular';">
    <div class="container">
        <form action="" method="post">
            <div class="sidebar">
                <div style="border-right: 1px solid #515151; text-align: center; height: 100%;">
                    <img src="resource/img/lhblogo.JPG" alt="로고1">
                    <div style="font-size: 32px; font-weight: bold; margin-top: 10px;">포인트충전</div>
                    <img style="width: 200px; height: 200px; position: relative; top: 240px;" src="resource/img/chargePage.gif" alt="">
                </div>
            </div>
            <div class="main_content">
                <div class="main_content_info">
                    <a href="#">오구싶은집 포인트 충전 창입니다</a>
                </div>
                <div style="margin: 20px;">
                    <dl style="text-align: center;">
                        <dt style=" padding: 20px 0; margin-bottom: 5px;">
                            <span style="font-size: 18px; font-weight: bold;">충전포인트</span>
                        </dt>
                    </dl>
                    <dd>
                        <ul class="price_point">
                            <li onclick="">
                                <span>
                                    20,000 POINT
                                </span>
                            </li>
                            <li>
                                <span>
                                    50,000 POINT
                                </span>
                            </li>
                            <li>
                                <span>
                                    100,000 POINT
                                </span>
                            </li>
                            <li>
                                <span>
                                    200,000 POINT
                                </span>
                            </li>
                            <li>
                                <span>
                                    500,000 POINT
                                </span>
                            </li>
                        </ul>
                    </dd>
                </div>
                <div class="caution_div">
                    <dl>
                        <dt>
                            <span>
                                	오구싶은집 가상 재화 정책 동의 및 충전 주의사항
                            </span>
                        </dt>
                    </dl>
                    <dd class="caution_info">
                        <div class="caution_info_txt">
                            <ul>
                                <li>포인트 충전은 오구싶은집 내부에서만 사용 가능한 화폐입니다. </li>
                                <li>포인트를 충전하기 위해서는 해당 서비스의 회원가입이 필요합니다.</li>
                                <li>포인트의 유효기간은 1년 입니다.</li>
                            </ul>
                            <div class="caution_info_danger">
                                <div class="caution_info_danger_ok">
                                    <span>포인트 및 유효기간</span>을 확인하였으며, <span>계약관련 고지 사항</span>과 <span>오구싶은집 가상 재화 정책</span> 진행에 동의합니다.
                                </div>
                                <div class="caution_info_danger_agree">
                                    <label class="caution_info_danger_agree_label" for="agree">
                                        <input class="caution_info_danger_agree_chkbox" type="checkbox" id="agree" required>
                                        	동의함
                                    </label>
                                </div>
                            </div>
                        </div>
                    </dd>
                </div>
                <div class="charge_letgo">
                    <input class="charge_letgo_input" type="submit" onclick="charge_Submit()" value="충전하기">
                </div>
                <input type="hidden" value="0" name="point" id="point">
            </div>
        </form>
    </div>
</div>
</body>
</html>