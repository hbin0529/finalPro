<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
   	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		window.Kakao.init("1dd3ef03f2a09b8946553bf5c5bb032f");
		
		function kakaoLogin(){
			Kakao.Auth.login({
				scope:'profile_nickname, account_email, gender',
				success: function(authObj){
					//토큰관련된 정보
					//console.log(authObj);
					window.Kakao.API.request({
						url:'/v2/user/me',
						success: res => {
							const kakao_account = res.kakao_account;
							//넘어온 정보가 담긴 객체
							//console.log(kakao_account);
							var nickname = Object.entries(authObj)
							$("#kakaoEmail").val(kakao_account.email);
							$("#kakaoNickname").val(kakao_account.profile.nickname);
							$("#kakaoHidden").submit();
						}
					})
				}
			})
		}
	</script>
		<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if> 
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
        .wid360{width: 360px;}.mgtb30{margin: 30px 0;}.kakaobut{width: 100px !important; margin-left: 40px;}
        .sz40{width: 40px; height: 40px;}.mg10{margin: 10px;}
        .mgtb20{margin: 20px 0px;}.sz40p{width: 44%; height: 40px;}
        .bd1{border: 1px solid black;}.sz100p{width: 100%; height: 40px;}
        .ilb{display: inline-block;}.ft20{font-size: 20px;}.alcen{text-align: center;}.bora4{border-radius: 4px;}
        .mt10{margin-top: 10px;}.porel{position: relative; top: 5px; color: rgba(0, 0, 0, 0.342);}
        .idchkajax{height: 40px; font-size: 12px; padding-top: 10px;}
        .inputInfo{font-size: 13px; color: rgba(0, 0, 0, 0.493); margin: 5px 0;}
        .inputInfo2{font-size: 13px; color: rgba(0, 0, 0, 0.493); margin: 5px 0;}.sz50p{width: 50%; height: 40px;}
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
    <!--카카오 주소 api-->
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
    <script>
    	
    
    	$(function(){
    		$("#memEmailF").on('keyup', function(){
    			idChk();
    		})
    		
    		$("#memEmailS").change(function(){
    			idChk();
    		})
    		
    		$("#userNick").on('keyup', function(){
    			nickChk();
    		})
    	})
    
		function checkAndSubmit(){
    		
    		var emailF = document.getElementById("memEmailF").value;
    		if(emailF==''||emailF==null){
    			alert('이메일 형식이 올바르지 않습니다.')
    			return;
    		}
    		
    		var emailS = document.getElementById("memEmailS").value;
    		if(emailS=='nonSelected'){
    			alert('이메일 형식이 올바르지 않습니다.')
    			return;
    		}
    		
		   	var pass = document.getElementById("pass").value;
		   	var rePass = document.getElementById("repass").value;
		   	if(pass==rePass&&pass!=null&&pass!=""){
		   	}else{
		   		alert("비밀번호를 확인해주세요");
		   		return;
		   	}
		   	
			var phoneNum = document.getElementById("phoneNum").value;
		   	var phoneRegExp = /^(010|011)-[0-9]{4}-[0-9]{4}$/
			if(phoneRegExp.test(phoneNum)){
			}else{
				alert("핸드폰 번호를 올바르게 입력해주세요")
		   		return;
			}
			
		   	var userName = document.getElementById("userName").value;
		   	var userNameRegExp = /^[가-힣]{2,5}$/
		   	if(userNameRegExp.test(userName)){
		   	}else{
		   		alert("이름을 올바르게 입력해주세요")
		   		return;
		   	}
		   	
		   	var userNick = document.getElementById("userNick").value;
		   	var userNickRegExp = /^[a-zA-Z0-9가-힣]{2,15}$/
		   	if(userNickRegExp.test(userName)){
		   	}else{
		   		alert("닉네임을 올바르게 입력해주세요")
		   		return;
		   	}
		   	
		   	
		   	var userDetail = document.getElementById("userDetail").value;
		   	if(userDetail!=null&&userDetail!=""){
		   	}else{
		   		alert('상세주소를 입력해주세요')
		   		return;
		   	}
		   	
		   	var genderNum = $("input[type='radio']:checked").length;
		   	if(genderNum!=0){
		   	}else{
		   		alert('성별을 선택해주세요')
		   		return;
		   	}
		   	
		   	var neccesaryCheck1 = $("#chk1:checked").length;
		   	var neccesaryCheck2 = $("#chk2:checked").length;
		   	var neccesaryCheck3 = $("#chk3:checked").length;
		   	
		   	if(neccesaryCheck1!=1||neccesaryCheck2!=1||neccesaryCheck3!=1){
		   		alert('필수 이용약관에 동의해주세요');
		   		return
		   	}else{
		   		regFrm.submit();
		   	}
		}
    	
    	function idChk(){
    		$.ajax({
    			url:"idChk.me",
    			data:{
    				id:$("#memEmailF").val()+"@"+$("#memEmailS").val()
    			},
    			success:function(result){
    				if(result=='Y'){
    					if($("#memEmailS").val()!='nonSelected'){
    						if($("#memEmailS").val()!=''&&$("#memEmailS").val()!=null){
		    					$("#idChkResult").show().text('사용 가능한 아이디입니다.').css({"color":"green"})
		    					$("#submitButton").attr("disabled", false);
    						}
    					}
    				}else if(result=='N'){
    					if($("#memEmailS").val()!='nonSelected'){
    						$("#idChkResult").show().text('이미 가입된 회원 아이디입니다.').css({"color":"red"})
	    					$("#submitButton").attr("disabled", true);
    					}
    				}
    			},
    			error:function(){
    				console.log('ajax통신오류 : function idChk()')
    			}
    		})
    	}
	    							
    	
    	function nickChk(){
    		$.ajax({
    			url:"nickChk.me",
    			data:{
    				nick:$("#userNick").val()
    			},
    			success:function(result){
    				if(result=='Y'){
    					$("#nickChkResult").show().text('사용 가능한 닉네임입니다').css("color", "green")
    				}else if(result=='N'){
    					$("#nickChkResult").show().text('중복된 닉네임입니다').css("color", "red")
    				}
    			},
    			error:function(){
    				console.log('ajax통신오류 : function nickChk()')
    			}
    		})
    	}
    	
    	function passChk(){
    		
    	}
	</script>
</head>
<body>
    <div class="flex2 wrap">
        <div class="flex1 d1">
            <a href="home.com" class="logoa">
                <img src="${path}/resources/img/logo1.gif" alt="" class="logoimg"><span class="logotxt">오구싶은집</span>
            </a>
            <span class="wid360 mgtb30" style="text-align: left;">회원가입</span>
            <span id="areYouSeller"><a href="sellerSignIn.se">혹시 판매자로 회원가입하고 싶으신가요?</a></span>
            <small class="mgtb30">SNS계정을 통해 편하게 가입하세요</small>
            <div>
                <a href="" style="visibility:hidden;">
					<img src="${path}/resources/img/naverL.png" alt="" class="sz40 mg10">
				</a>
                <a onclick="kakaoLogin();">
   					<img src="${path}/resources/img/kt.png" alt="" class="sz40 mg10">
 				</a>
                <a href="#" style="visibility:hidden;">
               	 <img src="${path}/resources/img/gg.png" alt="" class="sz40 mg10">
                </a>
            </div>
            <hr class="wid360 mgtb10">
            <form action="insert.me" name="regFrm" method="post">
                <span class="wid360 mgtb30" style="text-align: left;">이메일</span>
                <div class="wid360 alcen">
                    <input class="sz40p bd1 ilb bora4" name="memEmailF" id="memEmailF"></input><span class="mg10 ft20 porel">@</span><select class="sz40p bd1 ilb bora4" name="memEmailS" id="memEmailS" required>
                        <option value="nonSelected" selected>선택해주세요</option>
                        <option value="naver.com">naver.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                    </select>
                </div>
                <div class="wid360"><button class="wid360" id="emailchkbut">이메일 인증하기</button></div>
                <div class="idchkajax wid360" id="idChkResult">
                    이미있는아이디입니다
                </div><br>
                <span class="wid360 mgtb30 rmmg" style="text-align: left;">비밀번호</span>
                <div class="inputInfo">영문 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요</div>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" type="password" name="memPwd" required id="pass">
                </div>
                <div class="idchkajax wid360">
                    비밀번호를 다시 확인해주세요
                </div><br>
                <span class="wid360 mgtb30" style="text-align: left;">비밀번호 확인</span>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" type="password" required id="repass">
                </div>
                <div class="idchkajax wid360">
                    위에서 입력한 비밀번호와 다릅니다.
                </div><br>
                <span class="wid360 mgtb30 rmmg" style="text-align: left;">핸드폰</span>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" type="phone" name="memPhone" id="phoneNum" placeholder="010-0000-0000">
                </div>
                <br>
                <span class="wid360 mgtb30 rmmg" style="text-align: left;">실명</span>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" name="memName" id="userName" placeholder="2~5글자 사이의 한글 입력">
                </div><br>
                <span class="wid360 mgtb30 rmmg" style="text-align: left;">닉네임</span>
                <div class="inputInfo2">다른 유저와 겹치지 않도록 입력해주세요. (2~15자)</div>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" name="memNick" id="userNick">
                </div>
                <div class="idchkajax wid360" id="nickChkResult">
                    이미있는아이디입니다
                </div><br>
                <span class="wid360 mgtb30 rmmg" style="text-align: left;">성별</span>
                <div class="wid360 alcen" style="height: 190px;">
                    <input type="radio" value="M" id="mSelect" class="disnon" name="memGender">
                    <input type="radio" value="F" id="fSelect" class="disnon" name="memGender">
                    <label for="mSelect" class="labelForGender mLabel"></label><label for="fSelect" class="labelForGender fLabel"></label>
                </div>
                <span class="wid360 mgtb30 rmmg" style="text-align: left;">우편번호</span>
                <div class="wid360 alcen" style="text-align: left;">
                    <input class="sz50p bd1 ilb bora4" name="memZipcode" placeholder="우편번호" id="postcode" readonly required>
                    <input class="sz50p kakaobut" type="button" value="우편번호찾기" onclick="findAddr()">
                </div>
                <div class="idchkajax wid360"></div>
                <span class="wid360 mgtb30 rmmg" style="text-align: left;">주소</span>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" name="memAddr" id="addr" required readonly>
                </div>
                <div class="idchkajax wid360"></div>
                <span class="wid360 mgtb30 rmmg" style="text-align: left;">상세주소</span>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" name="memDetailAddr" id="userDetail">
                </div>
                <div class="idchkajax wid360"></div>
                <span class="wid360 mgtb30 rmmg" style="text-align: left;">약관동의</span>
                <div class="bd1 wid360 terms">
                    <label for="allchk"><input type="checkbox" id="allchk">전체동의</label>
                    <label for=""><hr></label>
                    <label for="chk1" class="necessary"><input type="checkbox" class="chkbox" id="chk1">만 14세 이상입니다</label>
                    <label for="chk2" class="necessary"><input type="checkbox" class="chkbox" id="chk2">이용약관</label>
                    <label for="chk3" class="necessary"><input type="checkbox" class="chkbox" id="chk3">개인정보수집 및 이용동의</label>
                    <label for="chk4" class="choice"><input type="checkbox" class="chkbox" id="chk4">개인정보 마케팅 활용 동의</label>
                    <label for="chk5" class="choice"><input type="checkbox" class="chkbox" id="chk5">이벤트, 쿠폰, 특가 알림 메일 및 SMS 등 수신</label>
                </div>
                <button type="button" onclick="checkAndSubmit();" class="submitbut wid360 bora4" id="submitButton" disabled>회원가입신청</button>
            </form>
        </div>
    </div>
    <form id="kakaoHidden" action="kakaoIdControll.me">
      	<input type="hidden" id="kakaoEmail" name="kakaoUserEmail">
      	<input type="hidden" id="kakaoNickname" name="kakaoUserNickname">
    </form>
</body>
<script>
    
</script>
</html>