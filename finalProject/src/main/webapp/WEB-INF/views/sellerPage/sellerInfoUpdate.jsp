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
<title>오구싶은집 > 나의 회원 정보 수정</title>
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
</script>
<style>
   
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
        height: 810px; padding: 60px 60px;
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
        padding: 32px 0;
        font-size: 18px;
    }
    .formElement>div>input{
        margin: 20px 0;
        height: 40px;
        font-size: large;
        padding-left: 10px;
    }
    .formElement>button{
        margin: 50px 0px 0px 130px;
        width: 400px; font-size: 20px; font-weight: bolder;
        height: 50px; background-color: rgb(33, 217, 203);
        border: 0; color: rgb(255, 255, 255);
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
<script type="text/javascript">
	function checkAndSubmit() {
		/* 판매자명 정규표현식 */
		var selName = document.getElementById("selName").value;
	   	var selNameRegExp = /^[가-힣]{2,5}$/
	   	if(selNameRegExp.test(selName)){
	   	}else{
	   		alert("이름을 올바르게 입력해주세요")
	   		return;
	   	}
	   	
	   	/* 핸드폰 정규표현식 */
	   	var selPhone = document.getElementById("selPhone").value;
	   	var selPhoneRegExp = /^(010|011)-[0-9]{4}-[0-9]{4}$/
		if(selPhoneRegExp.test(selPhone)){
		}else{
			alert("핸드폰 번호를 올바르게 입력해주세요")
	   		return;
		}
	   	regFrm.submit();
	}
</script>
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
		<c:if test="${ not empty alertMsg }">
			<script>
				alert("${ alertMsg }");
			</script>
			<c:remove var="alertMsg" scope="session" />
		</c:if> 
<body>
    <jsp:include page="../common/header.jsp"/>

    <!-- 본문 -->
    <section class="container">
        <div class="userInfo">
            <div class="FrmHead">
                <h1 style="float: left;">판매자 회원 정보 수정</h1>
                <a href="탈퇴처리할곳" style="float: right;">탈퇴하기</a>
            </div>
            <div class="Frm">
                <form action="doUpdate.se" name="regFrm">
                    <div class="formElement">
                    <input type="hidden" name="selEmail" value="${ s.selEmail }">
                    <input type="hidden" name="selNo" value="${ s.selNo }">
                        <div class="formEle1 necessaryInfo">이메일</div>
                        <div>
                            <input type="text" name="selEmailF" class="wid190 bdradi4" value="${ seller.selEmailF }" readonly> 
                            <span id="rhfqoddl">@</span>
                            <input type="text" name="selEmailS" class="wid190 bdradi4" value="${ seller.selEmailS }" readonly>
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1">판매자대표이름</div>
                        <div>
                            <input type="text" name="selName" id="selName" class="wid400 bdradi4" value="${ seller.selName }" placeholder="2~5글자 사이의 한글 입력">
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1 necessaryInfo">우편번호</div>
                        <div>
                            <input type="text" name="zipcode" id="postcode" class="wid400 bdradi4" value="${ seller.selZipcode }"  style="width: 120px;" readonly>
                            <input class="sz50p kakaobut" type="button" value="우편번호찾기" onclick="findAddr()">
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1 necessaryInfo">주소</div>
                        <div>
                            <input type="text" name="address" id="addr" class="wid400 bdradi4" value="${ seller.selAddr }" readonly>
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1 necessaryInfo">상세주소</div>
                        <div>
                            <input type="text" name="detailaddress" class="wid400 bdradi4" value="${ seller.selDetailAddr }">
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1 necessaryInfo">전화번호</div>
                        <div>
                            <input type="text" name="selPhone" id="selPhone" class="wid400 bdradi4" value="${ seller.selPhone }" placeholder="010-0000-0000">
                        </div>
                    </div>
                    <div class="formElement">
                        <div class="formEle1"><small>인테리어 업체 소개</small></div>
                        <div>
                        <c:if test="${ not empty seller.selInterIntroduce }">
                            <input type="text" name="selInterIntroduce" class="wid400 bdradi4" value="${ seller.selInterIntroduce }">
                        </c:if>
                        <c:if test="${ empty seller.selInterIntroduce }">
                            <input type="text" name="selInterIntroduce" class="wid400 bdradi4" value="인테리어업체 등록을 하지 않은 판매업자입니다" readonly>
                        </c:if>
                        </div>
                    </div>
                    
                    <div class="formElement">
                        <button class="bdradi4" type="button" onclick="checkAndSubmit();">회원 정보 수정</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>