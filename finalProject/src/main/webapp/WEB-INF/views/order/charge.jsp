<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구싶은집 충전사이트</title>
<link rel="shortcut icon" href="#">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script>
	$(function() {
	    // 포인트 충전금액 클릭시 색깔 변경
	    $(".price_point li").click(function() {
	        $(".price_point li").css({"color":"black", "border":"3px solid #fff"})
	        $(this).css({"color" : "white", "border":"3px solid #333"})
	    })
	    
	    //
	
	    // 동의함 체크시 색 변경
	    $(".caution_info_danger_agree_label").click(function(){ 
	        // alert("충전 포인트 및 유효기간 확인 동의를 해주세요.")
	        if(true == $("#agree").is(":checked")) {
	            $(".caution_info_danger_agree_label").css({"background-color":"#21d9cb", "color":"#fff"})
	        } else {
	            $(".caution_info_danger_agree_label").css({"background-color":"#ccc", "color":"#333"})
	        }
	    })
	   	
	    // 충전할 포인트 금액 누르면 input id="point" value값 변경 
        $("#20000p").parent("li").click(function() {
	 	    $("#point").attr("value", "20000")
		})

        $("#50000p").parent("li").click(function() {
 	    	$("#point").attr("value", "50000")
		})

        $("#100000p").parent("li").click(function() {
 	    	$("#point").attr("value", "100000")
		})

        $("#200000p").parent("li").click(function() {
 	    	$("#point").attr("value", "200000")
		})

        $("#500000p").parent("li").click(function() {
 	    	$("#point").attr("value", "500000")
		})
		
	})
	
	// 동의함 체크 안하고 충전하기 클릭시 경고창 띄우기
	function charge_Submit() {
		if($("#agree").is(":checked") == false) {
			alert("충전 포인트 및 유효기간 확인 동의를 해주세요.");
			location.reload();
			return;
	    }
		// 금액 체크 안하고 충전하기 클릭시 sumit 되는 오류 수정
		// location.reload() 새로고침 해서 해결함.
		if($("#point").val() == 0) {
			var target = document.getElementById('target_btn');
			target.disabled = true;
			console.log("비활성화됨");
			alert("충전할 금액을 선택하세요.");
			console.log("값이0인가요 : if, " + $("#point").val());
			location.reload();
			return;
		} else {
			var target = document.getElementById('target_btn');
			target.disabled = false;
			console.log("활성화됨");
			console.log("값이0인가요:else, " + $("#point").val());
		}
		chargePoint.submit();
		
	}
</script>
<link
	href="${pageContext.request.contextPath}/resources/css/charge.css"
	rel="stylesheet" type="text/css">
</head>
<body>
<div class="wrap" style="font-family: 'Pretendard-Regular';">
    <div class="container">
        <form action="pointCharge.or" method="post" name="chargePoint">
            <div class="sidebar">
                <div style="border-right: 1px solid #515151; text-align: center; height: 100%;">
                    <img src="${path}/resources/img/lhblogo.jpg" alt="로고1">
                    <div style="font-size: 32px; font-weight: bold; margin-top: 10px;">포인트충전</div>
                    <img style="width: 200px; height: 200px; position: relative; top: 240px;" src="${path}/resources/img/chargePage.gif" alt="">
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
                            <li>
                                <span id="20000p">
                                    20,000 POINT
                                </span>
                            </li>
                            <li>
                                <span id="50000p">
                                    50,000 POINT
                                </span>
                            </li>
                            <li>
                                <span id="100000p">
                                    100,000 POINT
                                </span>
                            </li>
                            <li>
                                <span id="200000p">
                                    200,000 POINT
                                </span>
                            </li>
                            <li>
                                <span id="500000p">
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
                    <input class="charge_letgo_input" type="button" id="target_btn" onclick="charge_Submit();" value="충전하기">
                </div>
                	<input type="hidden" value="0" name="point" id="point">
            </div>
        </form>
    </div>
</div>
</body>
</html>