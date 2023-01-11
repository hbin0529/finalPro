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
    </style>
    <script type="text/javascript">
    	if(${alertMsg}!=null||${alertMsg}!="")alert("${alertMsg}");
    </script>
</head>
<body>
    <div class="flex2 wrap">
        <div class="flex1 d1">
            
            <a href="#" class="logoa">
                <img src="${path}/resources/img/logo1.gif" alt="" class="logoimg"><span class="logotxt">오구싶은집</span>
            </a>
            <form action="" class="wid300">
                <div class="border1 inputUser1">
                    <input type="text" placeholder="이메일">
                </div>
                <div class="border1 inputUser2">
                    <input type="password" placeholder="비밀번호">
                </div>
                <button class="wid300 but">
                    로그인
                </button>
                <section class="underInp">
                    <a href="#" class="ui1">비밀번호 재설정</a>
                    <a href="signIn.me">회원가입</a>
                </section>
            </form>
            <section>
                <small>SNS계정으로 간편 로그인/회원가입</small>
            </section>
            <div class="mt40">
                <a href="#"><img src="${path}/resources/img/fb.png" alt="" class="size48"></a>
                <a href="#" class="ml20"><img src="${path}/resources/img/kt.png" alt="" class="size48"></a>
                <a href="#" class="ml20"><img src="${path}/resources/img/gg.png" alt="" class="size48"></a>
            </div>
            <section class="mt40">로그인에 문제가 있으신가요?</section>
            <hr class="hrwd">
            <div class="underInp">
                <a href="#">뭐 넣을거 없으면 빼기</a>
            </div>
        </div>
        <footer>
            ©  bucketplace, Co., Ltd.. All Rights Reserved
        </footer>
    </div>
</body>
</html>