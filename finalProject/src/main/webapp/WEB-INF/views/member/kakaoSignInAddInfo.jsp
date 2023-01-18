<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
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
        *{
            box-sizing: border-box;
            font-family: GmarketSansMedium;
        }
        .wrap{
            margin: 0 auto;
        }
        .flex1{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 40px 0px;
        }
        .flex2{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .d1{
            margin: 0 auto;
            max-width: 360px;
            padding: 40px 0px;
        }
        .logoa{
            margin: 30px 0px;
            text-decoration: none;
            color: black;
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }
        .logoimg{
            display: inline-block;
            width: 30%;
            margin: 0;
            margin-left: 20px;
            position: relative;
            top: 4px;
        }
        .logotxt{
            display: inline-block;
            width: 68%;
            font-size: 55px;
            margin-top: 30px;
            text-align: left;
            font-family: SDSamliphopangche_Outline;
        }
        .wid360{width: 360px;}.mgtb30{margin: 30px 0;}.kakaobut{width: 70px !important;}
        .sz40{width: 40px; height: 40px;}.mg10{margin: 10px;}
        .mgtb20{margin: 20px 0px;}.sz40p{width: 44%; height: 40px;}
        .bd1{border: 1px solid black;}.sz100p{width: 100%; height: 40px;}
        .sz70p{width: 70%; height: 40px; margin-right: 32px;}
        .ilb{display: inline-block;}.ft20{font-size: 20px;}.alcen{text-align: center;}.bora4{border-radius: 4px;}
        .mt10{margin-top: 10px;}.porel{position: relative; top: 5px; color: rgba(0, 0, 0, 0.342);}
        .idchkajax{height: 40px; font-size: 12px; padding-top: 10px;}
        .inputInfo{font-size: 13px; color: rgba(0, 0, 0, 0.493); margin: 5px 0;}
        .inputInfo2{font-size: 13px; color: rgba(0, 0, 0, 0.493); margin: 5px 0;}.sz30p{width: 30%; height: 40px;}
        .terms{
            padding: 20px;
        }
        label{
            display: block; margin: 10px 0;
            font-size: 13px;
        }
        .necessary::after{
            content: " (필수)";
            color: rgb(33, 217, 203);
        }
        .choice::after{
            content: " (선택)";
            color: rgba(0, 0, 0, 0.493);
        }
        label::after{
            font-size: 10px;
        }
        #emailchkbut{
            height: 45px;
            margin-top: 10px;
            cursor: pointer; font-size: 17px;
            color: rgba(4, 5, 5, 0.575);
        }
        select{
            color: rgba(0, 0, 0, 0.384);
        }
        form{
            width: 100%;
        }
        .submitbut{
            margin-top: 20px;
            height: 40px;
            background-color: rgb(33, 217, 203);
            border: 0px;
        }
        .rmmg{margin-bottom: 0px;}
        .disnon{display: none;}
        .labelForGender{
            width: 80px; height: 80px; display: inline-block; margin: 40px;
            cursor: pointer; background-size: cover;
        }
        .mLabel{background-image: url(${path}/resources/img/male.png);}
        .fLabel{background-image: url(${path}/resources/img/female.png);}#idChkResult{display: none;}#nickChkResult{display:none}
        #areYouSeller{font-size:8px;}
        #areYouSeller a{color:rgb(33,217,203); text-decoration: none; }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

    <script>
    $(function(){
    	alert("${alertMsg}");
    	console.log("${kakaoGender}");
    	var kakaoGender = "${kakaoGender}";
    	var memGenderInput = "";
    	if(kakaoGender=="M"){
    		memGenderInput = 'M'
    		$("input:radio[name='mSelect']:radio[value='M']".prop('checked', true);
	    	/* $("#memGender").val(memGenderInput); */
    	}else if(kakaoGender=="F"){
    		memGenderInput = 'F'
   			$("input:radio[name='fSelect']:radio[value='F']".prop('checked', true);
	    	/* $("#memGender").val(memGenderInput); */
    	}else{
    		alert('등록된 성별이 없을 경우 여자로 등록됩니다')
   			memGenderInput = 'F';
   	    	$("#memGender").val(memGenderInput);
    	}
    	
    })
    		
    </script>
        <script>
    var path = "${path}/resources/"
        $(function(){
            $(".mLabel").click(function(){
                $(".mLabel").css({'background' : 'url('+path+'img/selectedmale.png)', 'backgroundSize' : 'cover'})
                $(".fLabel").css({'background' : 'url('+path+'img/female.png)', 'backgroundSize' : 'cover'})
            })

            $(".fLabel").click(function(){
                $(".fLabel").css({'background' : 'url('+path+'img/selectedfemale.png)', 'backgroundSize' : 'cover'})
                $(".mLabel").css({'background' : 'url('+path+'img/male.png)', 'backgroundSize' : 'cover'})
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

            
        })
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function findAddr(){
            new daum.Postcode({
                
                oncomplete: function(data) {
                    
                    
                    document.getElementById('postcode').value = data.zonecode;
                    roadAddr = data.roadAddress;
                    jibunAddr = data.jibunAddress;
                    extraAddr = '';
                    
                    if(roadAddr != ''){
                        
                        if(data.bname != ''){
                            extraAddr += data.bname;
                        }
                        if(data.buildingName != ''){
                            extraAddr += (extraAddr != '') ? ', ' + data.buildingName : data.buildingName;
                        }
                        roadAddr += (extraAddr != '') ? '(' + extraAddr + ')' : '';
                        document.getElementById('addr').value = roadAddr;
                        
                    }else if(jibunAddr != ''){
                        document.getElementById('addr').value = jibunAddress;
                    }
                    regFrm.memDetailAddr.focus();
                    
                }
            }).open();
        }
    </script>
    
   	<script type="text/javascript">
		function submit2(){
			var kakaoPhone = document.getElementById("kakaoPhone").value;
			var kakaoPhoneRegExp = /^(010|011)-[0-9]{4}-[0-9]{4}$/
			if(kakaoPhoneRegExp.test(kakaoPhone)) {
				
			} else {
				alert("핸드폰 번호를 올바르게 입력해주세요");
				return;
			}
			regFrm.submit();
		} 
	</script>
</head>
<body>
    <!--추가로 받아야 할 정보들-->
    <!--
        ***이미 카카오톡으로부터 받아온 정보들
        1. 이메일
        2. 닉네임
        3. 성별

        --- 정보 입력 안하고 나가거나 비정상적으로 종료할 시 회원가입 안되도록 처리
        1. 우편번호
        2. 큰 주소 <-- 정규식이나 백에서 로직으로 무조건 입력하도록
        3. 상세주소? <-- 일단 입력은하는데 필수값은 아니게
        4. 핸드폰번호 <-- 필수
        5. 퍼밋,스테이터스,포인트,가입날짜,탈퇴날짜는 
    -->
    <div class="flex2 wrap">
        <h1>카카오톡 간편 회원가입</h1>
        <div class="flex1 d1">
            <hr class="wid360 mgtb10">
            <form action="insert.me" name="regFrm">
                <div class="infoDiv">
                    <label for="" class="wid360 mgtb30 rmmg">이메일</label>
                    <input type="text" class="sz100p bd1 ilb bora4" name="memEmail" value="${ kakaoUserEmail }">
                </div>
                <div class="infoDiv">
                    <label for="" class="wid360 mgtb30 rmmg">닉네임</label>
                    <input type="text" class="sz100p bd1 ilb bora4" name="memNick" value="${ kakaoUserNickname }">
                </div>
                <div class="infoDiv">
                    <label for="" class="wid360 mgtb30 rmmg">실명</label>
                    <input type="text" class="sz100p bd1 ilb bora4" name="memName" value="${ kakaoUserNickname }">
                </div>
                <div class="infoDiv" style="text-align: left;">
                    <label for="" class="wid360 mgtb30 rmmg">우편번호</label>
                    <input type="text" class="sz70p bd1 ilb bora4" id="postcode" name="memZipcode" readonly>
                    <button type="button" class="sz30p kakaobut" onclick="findAddr()">주소찾기</button>
                </div>
                <div class="infoDiv">
                    <label for="" class="wid360 mgtb30 rmmg">주소</label>
                    <input type="text" class="sz100p bd1 ilb bora4" id="addr" name="memAddr" readonly>
                </div>
                <div class="infoDiv">
                    <label for="" class="wid360 mgtb30 rmmg">상세주소</label>
                    <input type="text" class="sz100p bd1 ilb bora4" name="memDetailAddr">
                </div>
                <div class="infoDiv">
                    <label for="" class="wid360 mgtb30 rmmg">전화번호</label>
                    <input type="text" class="sz100p bd1 ilb bora4" name="memPhone" id="kakaoPhone" placeholder="010-0000-0000">
                </div>
                <label class="wid360 mgtb30 rmmg" style="text-align: left;">성별</label>
                <div class="wid360 alcen" style="height: 190px;">
                    <input type="radio" value="M" id="mSelect" class="disnon" name="memGender">
                    <input type="radio" value="F" id="fSelect" class="disnon" name="memGender">
                    <label for="mSelect" class="labelForGender mLabel"></label><label for="fSelect" class="labelForGender fLabel"></label>
                </div>
                <input type="hidden"  name="memPwd" value="kakaoSnsLoginUser">
                <button type="button" class="wid360 bora4 submitbut" style="color: #fff;" onclick="submit2()">회원가입</button>
            </form>
        </div>
    </div>

</body>
</html>