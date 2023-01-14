<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .infoLabel{
            width: 200px;
        }
        .container{
            width: 800px;
            border: 1px solid;
            margin: calc(50%-content) auto;
        }
        form{
            width: 100%;
        }
        .infoBox{
            width: 100%;
        }
        .infoDiv{
            width: 100%;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
    $(function(){
    	alert("${alertMsg}");
    	console.log("${kakaoGender}");
    	var kakaoGender = "${kakaoGender}";
    	var memGenderInput = "";
    	if(kakaoGender=="male"){
    		memGenderInput = 'M'
	    	$("#memGender").val(memGenderInput);
    	}else if(kakaoGender=="female"){
    		memGenderInput = 'F'
	    	$("#memGender").val(memGenderInput);
    	}else{
    		alert('등록된 성별이 없을 경우 여자로 등록됩니다')
   			memGenderInput = 'F';
   	    	$("#memGender").val(memGenderInput);
    	}
    	
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
    <div class="container">
        <h1>추가정보 내놔</h1>
        <form action="insert.me" name="regFrm">
            <div class="infoBox">
            	<div class="infoDiv">
                    <label for="" class="infoLabel">사용자 이메일</label><input type="text" name="memEmail" readonly value="${ kakaoUserEmail }">
                </div>
                <div class="infoDiv">
                    <label for="" class="infoLabel">사용자 닉네임</label><input type="text" name="memNick" value="${ kakaoUserNickname }">
                </div>
                <div class="infoDiv">
                    <label for="" class="infoLabel">사용자 실명</label><input type="text" name="memName" value="${ kakaoUserNickname }">
                </div>
                <div class="infoDiv">
                    <label for="" class="infoLabel">우편번호</label><input type="text" id="postcode" name="memZipcode" readonly>
                    <button type="button" onclick="findAddr()">카카오주소찾기</button>
                </div>
                <div class="infoDiv">
                    <label for="" class="infoLabel">주소</label><input type="text" id="addr" name="memAddr">
                </div>
                <div class="infoDiv">
                    <label for="" class="infoLabel">상세주소</label><input type="text" name="memDetailAddr">
                </div>
                <div class="infoDiv">
                    <label for="" class="infoLabel">핸드폰번호</label><input type="text" name="memPhone">
                </div>
                <input type="hidden" name="memGender" id="memGender">
                <input type="hidden"  name="memPwd" value="kakaoSnsLoginUser">
                <button onclick="submit()">회원가입</button>
            </div>
        </form>
    </div>






</body>