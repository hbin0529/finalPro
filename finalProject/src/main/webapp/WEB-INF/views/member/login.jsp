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
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: center;
            justify-content: center;
            padding: 40px 0px;
        }
        .flex2{
            display: flex;
            flex-direction: column;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: center;
            justify-content: center;
        }
        .d1{
            margin: 0 auto;
            max-width: 300px;
            padding: 40px 0px;
        }
        .border1{
            border: 1px solid rgb(175, 175, 175);
        }
        .inputUser1{
            height: 50px;
            width: 100%;
            display: block;
            border-radius: 8px 8px 0px 0px;
        }
        .inputUser2{
            height: 50px;
            width: 100%;
            display: block;
            border-radius: 0px 0px 8px 8px;
        }
        .wid300{
            width: 300px;
        }
        .but{
            height: 50px;
            background-color: rgb(33, 203, 217);
            border-radius: 4px;
            margin-top: 30px;
            border: 1px solid rgb(33, 203, 217);
            color: white;
            font-size: 20px;
            font-weight: bold;
        }
        .logoa{
            margin: 30px 0px;
            text-decoration: none;
            color: black;
            display: flex;
            justify-content: space-between;
        }
        .logoimg{
            display: inline-block;
            width: 30%;
            margin: 0;
        }
        .logotxt{
            display: inline-block;
            width: 68%;
            font-size: 47px;
            margin-top: 30px;
            text-align: center;
            font-family: SDSamliphopangche_Outline;
        }
        .underInp{
            text-align: center;
            margin: 30px 0;
        }
        .underInp a{
            text-decoration: none;
            color: black;
            font-weight: bold;
        }
        .ui1{
            margin-right: 20px;
        }
        small{
            font-size: 13px;
            font-family: 'Noto Sans KR', sans-serif;
            color: rgba(0, 0, 0, 0.678);
        }
        .mt40{
            margin-top: 40px;
            margin-bottom: 20px;
            color: rgba(3, 3, 3, 0.678);
        }
        .size48{
            width: 48px;
            height: 48px;
        }
        .ml20{
            margin-left: 20px;
        }
        .hrwd{
            width: 100%;
            margin: 20px 0;
        }
        footer{
            font-size: 8px;
        }
        input{
            width: 100%;
            height: 100%;
            outline: none;
            border: none;
            border-radius: 8px 8px 8px 8px;
            padding: 15px 13px;
        }
        .mt40 button{
        	outline:none;
        	border:none;
        	background-color: white;
        }
        #choiceLogin{
        	display:flex;
        	width: 300px; justify-content:space-between;
        	position:relative; top:40px;
        	border-bottom:1px solid rgb(33, 217, 203)
        }
        #choiceLogin label{
        	margin:10px 10px 0px 10px; padding:15px;
        }
        .selectLogin{
        	border : 2px solid rgb(33, 217, 203);
        	border-bottom:0px solid
        }
    </style>
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
							if(kakao_account.gender!=undefined){
								$("#kakaoGender").val(kakao_account.gender);
							}else{
								$("#kakaoGender").val("none");
							}
								
								
							$("#kakaoHidden").submit(); //이따 테스트 끝나구 주석 풀기 **************
							
							//카카오에서넘어온값테스트주석
							//console.log(kakao_account);
							//console.log(kakao_account.email);
							//console.log(kakao_account.gender);
							//console.log(kakao_account.profile.nickname);
							
							
						}
					})
				}
			})
		}
	</script>
	<script type="text/javascript">
	$(function(){
		$("#randomComment").html('${randomComment}');
		$("#mLogChoice").on("click", function(){
			$("#memberLog").show();
			$("#sellerLog").hide();
			$("#sLogChoice").toggleClass("selectLogin")
			$("#mLogChoice").toggleClass("selectLogin")
		})
		$("#sLogChoice").on("click", function(){
			$("#sellerLog").show();
			$("#memberLog").hide();
			$("#sLogChoice").toggleClass("selectLogin")
			$("#mLogChoice").toggleClass("selectLogin")
		})
	})
	</script>
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if> 
</head>
<body>
    <div class="flex2 wrap">
	    <div id="choiceLogin">
		    <label id="mLogChoice" class="selectLogin">일반회원</label>
		    <label id="sLogChoice">판매자회원</label>
	    </div>
        <div class="flex1 d1" id="memberLog">
            
            <a href="home.com" class="logoa">
                <img src="${path}/resources/img/logo1.gif" alt="" class="logoimg"><span class="logotxt">오구싶은집</span>
            </a>
            <form action="loginUser.me" class="wid300">
                <div class="border1 inputUser1">
                    <input type="text" placeholder="이메일" name="memEmail">
                </div>
                <div class="border1 inputUser2">
                    <input type="password" placeholder="비밀번호" name="memPwd">
                </div>
                <button class="wid300 but">
                    로그인
                </button>
                <section class="underInp">
                    <a href="signIn.me">회원가입</a>
                </section>
            </form>
            <section>
                <small>SNS계정으로 간편 로그인/회원가입</small>
            </section>
            <div class="mt40">
                <button style="visibility:hidden;"><img src="${path}/resources/img/naverL.png" alt="" class="size48"></button>
                <button class="ml20" onclick="kakaoLogin();"><img src="${path}/resources/img/kt.png" alt="" class="size48"></button>
                <button class="ml20" style="visibility:hidden;"><img src="${path}/resources/img/gg.png" alt="" class="size48"></button>
            </div>
            <section class="mt40">로그인에 문제가 있으신가요?</section>
            <hr class="hrwd">
            <div class="underInp">
                <a href="#" id="randomComment"></a>
            </div>
        </div>
        <div class="flex1 d1" id="sellerLog" style="display:none;">
            
            <a href="home.com" class="logoa">
                <img src="${path}/resources/img/logo1.gif" alt="" class="logoimg"><span class="logotxt">오구싶은집</span>
            </a>
            <form action="loginUser.se" class="wid300">
                <div class="border1 inputUser1">
                    <input type="text" placeholder="이메일" name="selEmail">
                </div>
                <div class="border1 inputUser2">
                    <input type="password" placeholder="비밀번호" name="selPwd">
                </div>
                <button class="wid300 but">
                    판매자 로그인
                </button>
            </form>
            <section class="underInp">
                <a href="sellerSignIn.se">판매자 회원가입</a>
            </section>
            <section class="mt40">로그인에 문제가 있으신가요?</section>
            <hr class="hrwd">
            <div class="underInp">
                <a href="#" id="randomComment"></a>
            </div>
        </div>
        
        
        
        <footer>
            ©  bucketplace, Co., Ltd.. All Rights Reserved
        </footer>
        <form id="kakaoHidden" action="kakaoIdControll.me">
        	<input type="hidden" id="kakaoEmail" name="kakaoUserEmail">
        	<input type="hidden" id="kakaoNickname" name="kakaoUserNickname">
        	<input type="hidden" id="kakaoGender" name="kakaoGender">
        </form>
    </div>
</body>
</html>