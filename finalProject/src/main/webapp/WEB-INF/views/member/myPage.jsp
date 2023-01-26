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
<title>오구싶은집 > 회원 정보 수정</title>
<!-- 파비콘 로고 -->
<link rel="icon" href="${path}/resources/img/pavilogo.png">
</head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>
    $(function(){
        $("#header_store").mouseover(function(){
            $(".header_store_dropdown").stop().fadeIn(300);
        })
        $(".header_store_dropdown").mouseleave(function(){
            $(".header_store_dropdown").stop().fadeOut(300);
        })
        // $("input").focus(function(){
        //     $(this).css({"borderColor":"rgb(33, 217, 203)", "outline":"rgb(33, 217, 203)"})
        // })
        // $("input").blur(function(){
        //     $(this).css({"borderColor":"black", "outline":"black"})
        // })
    })
    function goSubmit(){
   		
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
	   	
	   	var userNick = document.getElementById("userNick").value;
	   	var userNickRegExp = /^[a-zA-Z0-9가-힣]{2,15}$/
	   	if(userNickRegExp.test(userNick)){
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
   		
   		
   		
    	regFrm.submit();
    }
    function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
    
</script>
<!--카카오 주소 api-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function findAddr(){
        console.log('왜안돌아가냐')
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
                regFrm.detailaddress.focus();
                
                
            }
        }).open();
    }
</script>
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
    /*-------------------------헤더스타일모음--------------------------- */
    *{margin: 0; padding: 0; text-decoration: none;}
    a{text-decoration: none; color: black;  cursor: pointer;}
    .main_logo a {
        font-family: 'SDSamliphopangche_Outline'; color: #21d9cb; font-size: 38px;}
    .main_logo li {position: relative; right:70px; list-style: none;} 
    .top_box{ width: 1400px; height: 120px;  margin: 0 auto; display: flex; justify-content: center; align-items:center;}
    .main_top {display: flex; height: 40px;  position: relative; font-family: 'GmarketSansMedium';}
    .main_top ul {list-style: none; text-align: center;} 
    .logo_name { position: absolute; left: -170px; } 
    .main_category ul {display: flex; }
    .main_category ul li {margin-right: 20px; font-size: 18px; font-weight: bold; position: relative; left: 5px; top: 18px;}
    .main_category ul li a:hover{color: #21d9cb;}
    .main_search ul{display: flex;}    
    .main_login ul{display: flex; margin-left: 50px;}
    .main_login ul li {margin-right: 20px; position: relative; left: 60px; font-size: 14px; top: 12px;}
    .main_login ul li:first-child{top: 3px;}
    .main_login ul li:last-child{top: 2px;}
    .main_login ul li a{cursor: pointer;}
    .main_login img {width: 26px;}
    #login_cart{width: 32px;}
    .main_search input {width: 300px; height: 40px; border: 1px solid rgb(215, 213, 213); border-radius: 5px; font-size: 16px; position: relative; left: 60px; padding-left: 10px;}
    .main_search button {width: 50px; height: 40px; border: none; background-color: #21d9cb; color: white; border-radius: 3px; position: relative; left: 60px; cursor: pointer;}
    hr{border-color: white;} 
    #header_store{ height: 65px; width: 100px;} 

    /*------------------------- 마이페이지 메뉴바 스타일모음------------------------- */
    .mypage_category{width: 1400px; height: 80px; margin: 0 auto;}
    .mypage_category table {width: 700px; height: 80px; margin: 0 auto; text-align: center; font-weight: bolder;}
    #mypage_menu{font-family: 'GmarketSansMedium';}
    #mypage_menu:hover{color: #21d9cb;}    


    /*-------------------------* 드롭다운 스타일모음 /*-------------------------*/
    .header_store_dropdown{width: 1400px;margin: 0 auto; display: none; }
    .header_store_dropdown table{width: 700px; margin-left: 380px; }
    #store_dropdown_img{width: 40px;}
    .header_store_dropdown tr:first-child{ text-align: center; }
    .header_store_dropdown tr:last-child{text-align: center; font-family: 'GmarketSansMedium'}
    .header_store_bar{width: 2500px; margin-left: -900px;}

    /*----------------------------------- 푸터 스타일 모음-------------------------------------------- */
    a{text-decoration: none; color: black;}
    footer {height: 300px; background-color: #f6fdfd;}
    footer ul li{list-style: none;}
    .bottom_box{display: flex;  align-items: center;}
    .footer_wrap{display: flex; margin: 0 auto;}
    .footer_callcenter{width: 300px; font-size: 12px;}
    .footer_callcenter ul li{margin-bottom: 5px;}
    #callcenter{font-size: 22px; font-weight: bold; font-family: 'GmarketSansMedium';} 
    #callcenter_number{font-family: 'SDSamliphopangche_Outline'; font-size: 30px; color: #21d9cb; padding-top: 10px; padding-bottom: 10px;}
    .footer_category{width: 700px;display: flex; }
    .footer_sns{width: 400px; font-size: 12px;}
    .footer_sns table {margin: 0 auto;}
    .footer_sns img{width: 30px; height: 30px;padding-left: 20px;}
    #category_name{text-align: center; font-size: 15px; font-weight: bold; padding-bottom: 20px; font-family: 'GmarketSansMedium';}
    #category_text{font-size: 11px; padding-bottom: 10px; }
    #footer_logo_top {font-family: 'SDSamliphopangche_Outline'; font-size: 40px; color: #21d9cb; text-align: center; padding-top: 20px;}
    #footer_logo_bottom {font-family: 'SDSamliphopangche_Outline'; text-align: center; font-size: 20px;}

    /* --------------------- 본문 --------------------- */
    .container{
        width: 1050px;
        margin: 0 auto;
        padding: 40px 0;
        font-family: Pretendard-Regular;
        box-sizing: border-box;
    }
    .userInfo{
        border: 1px solid rgba(0, 0, 0, 0.397);
        box-shadow: 1px 3px 10px 1px rgba(0, 0, 0, 0.267);
        height: 1100px; padding: 60px 60px;
    }
    .FrmHead{
        width: 100%;
        justify-content: space-around;
    }
    .Frm{
        margin-top: 80px;
        clear: both;
        width: 100%;
        /* border: 1px solid red; */
        padding: 20px 0px;
    }
    .formElement{
        display: flex;
    }
    .formEle1{
        width: 130px;
        padding: 30px 0;
        font-size: 18px;
    }
    .formElement>div>input{
        margin: 20px 0;
        height: 40px;
        font-size: large;
        padding-left: 10px;
        font-family: 'Pretendard-Regular';
    }
    .formElement>button{
        margin: 50px 0px 0px 130px;
        width: 400px; font-size: 20px; font-weight: bolder;
        height: 50px; background-color: rgb(33, 217, 203);
        border: 0; color: rgb(255, 255, 255);
        font-family: 'Pretendard-Regular';
        font-size:18px;
        
        
    }
    .necessaryInfo::after{
        content: "*";
        color: red;
    }
    .input-file-button{
        padding: 6px 25px;
        background-color: rgb(33, 217, 203);
        border-radius: 4px;
        color: white;
        cursor: pointer;
        position:relative; bottom: 10px; left: 5px;
    }
    #rhfqoddl{color: rgba(67, 95, 89, 0.582);}
    input:focus{
        outline: none; border-color: rgb(32, 165, 154);
        border-top-color:  rgb(150, 255, 246);
        border-left-color: rgb(150, 255, 246);
    }
    .wid1400{width: 1400px;}
    .wid190{width: 184.5px;}
    .wid400{width: 400px;}
    .siz120{width: 120px; height: 120px;}
    .bd1{border: 1px solid black;}.mt30{margin-top: 30px;}
    .bdradi4{border-radius: 4px;}
</style>
<body>
    <jsp:include page="../common/header.jsp"/> 
    <jsp:include page="../common/myPageHeader.jsp"/> 

    <!-- 본문 -->
    <section class="container">
        <div class="userInfo">
            <div class="FrmHead">
                <h1 style="float: left;">회원 정보 수정</h1>
                <a href="delete.me?id=${ id }" style="float: right;">탈퇴하기</a>
            </div>
            <div class="Frm">
                <form action="updateMem.me" name="regFrm" method="post" enctype="multipart/form-data">
                    <div class="formElement">
                        <div class="formEle1 necessaryInfo">이메일</div>
                        <div>
                            <input type="text" name="idF" class="wid190 bdradi4" value="${ emailF }" readonly> 
                            <span id="rhfqoddl">@</span>
                            <input type="text" name="idS" class="wid190 bdradi4" value="${ emailS }" readonly>
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1 necessaryInfo">별명</div>
                        <div>
                            <input type="text" name="memNick" id="userNick" class="wid400 bdradi4" value="${ nick }">
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1 necessaryInfo">비밀번호</div>
                        <div>
                            <input type="password" name="memPwd" id="pass" class="wid400 bdradi4" value="">
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1 necessaryInfo">비밀번호확인</div>
                        <div>
                            <input type="password" name="memRePwd" id="repass" class="wid400 bdradi4" value="">
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1 necessaryInfo">우편번호</div>
                        <div>
                            <input type="text" name="memZipcode" id="postcode" class="wid400 bdradi4" value="${ m.memZipcode }"  style="width: 120px;">
                            <input class="sz50p kakaobut" type="button" value="우편번호찾기" onclick="findAddr()" readonly required>
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1 necessaryInfo">주소</div>
                        <div>
                            <input type="text" name="memAddr" id="addr" class="wid400 bdradi4" value="${ m.memAddr }" readonly required>
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1 necessaryInfo">상세주소</div>
                        <div>
                            <input type="text" name="memDetailAddr" id="userDetail" class="wid400 bdradi4" value="${ m.memDetailAddr }">
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1 necessaryInfo">전화번호</div>
                        <div>
                            <input type="text" name="memPhone" id="phoneNum" class="wid400 bdradi4" value="${ m.memPhone }" required>
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1">프로필 사진</div>
                        <div>
                            <img src="${path}${m.memImg}" alt="as" class="siz120 bd1 mt30 bdradi4" id="preview">
                            <label class="input-file-button" for="input-file">새로 올리기</label>
                            <input type="file" name="upfile" id="input-file" style="display:none;" onchange="readURL(this);"/> 
                        </div>
                    </div>
                    <div class="formElement">
                    <input type="hidden" name="memEmail" id="fullEmail" value="${ id }">
                    <input type="hidden" name="existImg" value="${m.memImg}">
                        <button type="button" class="bdradi4" onclick="goSubmit();">회원 정보 수정</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>