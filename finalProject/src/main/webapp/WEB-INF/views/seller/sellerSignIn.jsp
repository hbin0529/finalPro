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
        .label2span{
            position: relative;
            top: 37px;
        }
        .label2text{
            width: 100%;
            position: relative; top: 67px;
        }
        .fl{display: flex;}
        .wid360{width: 360px;}.mgtb30{margin: 30px 0;}
        .sz40{width: 40px; height: 40px;}.mg10{margin: 10px;}
        .mgtb10{margin: 20px 0px;}.sz40p{width: 44%; height: 40px;}
        .bd1{border: 1px solid black;}.sz100p{width: 100%; height: 40px;}
        .ilb{display: inline-block;}.ft20{font-size: 20px;}.alcen{text-align: center;}.bora4{border-radius: 4px;}
        .mt10{margin-top: 10px;}.porel{position: relative; top: 5px; color: rgba(0, 0, 0, 0.342);}
        .idchkajax{height: 40px; font-size: 12px; padding-top: 10px;}
        .inputInfo{font-size: 13px; color: rgba(0, 0, 0, 0.493); margin: 5px 0;}
        .inputInfo2{font-size: 13px; color: rgba(0, 0, 0, 0.493); margin: 5px 0;}
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
        .disnon{display: none;}
        .labelForInterior{
            width: 80px; height: 80px; margin: 40px 0 40px 0;
            cursor: pointer; background-size: cover;
        }
        .label1{
            width: 80px;
            margin: 0;
        }
        .label2{
            width: 280px;
        }
        .interior{background-image: url(${path}/resources/img/interiorNo.png);}
        .importantInterior{background-image: url(${path}/resources/img/interior.png) !important;}
        .wid360{width: 360px;}.mgtb30{margin: 30px 0;}.kakaobut{width: 100px !important; margin-left: 40px;}
        .sz40{width: 40px; height: 40px;}.mg10{margin: 10px;}
        .mgtb20{margin: 20px 0px;}.sz40p{width: 44%; height: 40px;}
        .bd1{border: 1px solid black;}.sz100p{width: 100%; height: 40px;}
        .ilb{display: inline-block;}.ft20{font-size: 20px;}.alcen{text-align: center;}.bora4{border-radius: 4px;}
        .mt10{margin-top: 10px;}.porel{position: relative; top: 5px; color: rgba(0, 0, 0, 0.342);}
        .idchkajax{height: 40px; font-size: 12px; padding-top: 10px;}
        .inputInfo{font-size: 13px; color: rgba(0, 0, 0, 0.493); margin: 5px 0;}
        .inputInfo2{font-size: 13px; color: rgba(0, 0, 0, 0.493); margin: 5px 0;}.sz50p{width: 50%; height: 40px;}
        .rmmg{margin-bottom: 0px;}.hei190{height: 190px;}.hei550{height: 550px;}
        .emailform{
        	display:flex;
        }
    </style>
        <script>
            $(function(){
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

                $(".labelForInterior").on('click', function(){
                    $(".interior").toggleClass("importantInterior");
                    $(".label2").toggleClass("disnon")
                    var total = $("#interVal").val();
                    if(total == 'N') {
                    	$("#interVal").attr({"value":"Y"});
                    }
                    else{ 
                        $("#interVal").attr({"value":"N"})
                    }; 
                })



            })
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
</head>
<body>
    <!-- name값은 나중에 백하면서 줘야함 -->
    <div class="flex2 wrap">
        <div class="flex1 d1">
            <a href="#" class="logoa">
                <img src="${path}/resources/img/logo1.gif" alt="" class="logoimg"><span class="logotxt">오구싶은집</span>
            </a>
            <span class="wid360 mgtb30" style="text-align: left;">판매자 회원가입</span>
            <form action="sellerInsert.se" name="regFrm">
                <span class="wid360 mgtb30" style="text-align: left;">이메일</span>
                <div class="wid360 alcen emailform">
                    <input class="sz40p bd1 ilb bora4" name="selEmailF"></input>
                    <span class="mg10 ft20 porel">@</span>
                    <select class="sz40p bd1 ilb bora4" name="selEmailS">
                        <option value="none">선택해주세요</option>
                        <option value="naver.com">naver.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                    </select>
                </div>
                <div class="idchkajax wid360">
                    이미있는아이디입니다
                </div>


                <span class="wid360 mgtb30 rmmg" style="text-align: left;">비밀번호</span>
                <div class="inputInfo">영문 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요</div>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" name="selPwd">
                </div>
                <div class="idchkajax wid360">
                    이미있는아이디입니다
                </div>


                <span class="wid360 mgtb30" style="text-align: left;">비밀번호 확인</span>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4">
                </div>
                <div class="idchkajax wid360">
                    이미있는아이디입니다
                </div>

                <span class="wid360 mgtb30 rmmg" style="text-align: left;">대표자 이름(실명)</span>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" name="selName">
                </div>
                    <div class="idchkajax wid360">
                </div>


                <span class="wid360 mgtb30 rmmg" style="text-align: left;">판매자 전화번호</span>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" name="selPhone">
                </div>
                    <div class="idchkajax wid360">
                </div>


                <span class="wid360 mgtb30 rmmg" style="text-align: left;">사업자등록번호</span>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" name="selBusNo">
                </div>
                    <div class="idchkajax wid360">
                </div>


                <span class="wid360 mgtb30 rmmg" style="text-align: left;">상호명</span>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" name="selBusName">
                </div>
                    <div class="idchkajax wid360">
                </div>


                <span class="wid360 mgtb30 rmmg" style="text-align: left;">인테리어 시공 여부</span>
                <div class="wid360 hei190 fl">
                    <div class="label1">
                        <input type="checkbox" value="N" id="interSelect" class="disnon">
                        <input type="hidden" value="N" id="interVal" name="selInter">
                        <label for="interior" class="labelForInterior interior"></label>
                    </div>
                    <div class="label2 disnon">
                        <span class="label2span">인테리어 소개 문구를 작성해주세요</span>
                        <br>
                        <input type="text" placeholder="소개 문구를 작성해주세요" class="label2text" name="selInterIntroduce">
                    </div>
                </div>


                <span class="wid360 mgtb30 rmmg" style="text-align: left;">우편번호</span>
                <div class="wid360 alcen" style="text-align: left;">
                    <input class="sz50p bd1 ilb bora4" name="zipcode" placeholder="우편번호" id="postcode" readonly>
                    <input class="sz50p kakaobut" type="button" value="우편번호찾기" onclick="findAddr()">
                </div>
                <div class="idchkajax wid360"></div>


                <span class="wid360 mgtb30 rmmg" style="text-align: left;">주소</span>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" name="address" id="addr">
                </div>
                <div class="idchkajax wid360"></div>


                <span class="wid360 mgtb30 rmmg" style="text-align: left;">상세주소</span>
                <div class="wid360 alcen">
                    <input class="sz100p bd1 ilb bora4" name="detailaddress">
                </div>
                <div class="idchkajax wid360"></div>


                <span class="wid360 mgtb30 rmmg" style="text-align: left;">약관동의</span>
                <div class="bd1 wid360 terms">
                    <label for=""><input type="checkbox" id="allchk">전체동의</label>
                    <label for=""><hr></label>
                    <label for="" class="necessary"><input type="checkbox" class="chkbox">만 14세 이상입니다</label>
                    <label for="" class="necessary"><input type="checkbox" class="chkbox">이용약관</label>
                    <label for="" class="necessary"><input type="checkbox" class="chkbox">개인정보수집 및 이용동의</label>
                    <label for="" class="choice"><input type="checkbox" class="chkbox">개인정보 마케팅 활용 동의</label>
                    <label for="" class="choice"><input type="checkbox" class="chkbox">이벤트, 쿠폰, 특가 알림 메일 및 SMS 등 수신</label>
                </div>
                <input type="submit" class="submitbut wid360 bora4">
                <input type="hidden" name="selEmail">
                <input type="hidden" name="selStatus">
            </form>
        </div>
    </div>
</body>
<script>
    
</script>
</html>