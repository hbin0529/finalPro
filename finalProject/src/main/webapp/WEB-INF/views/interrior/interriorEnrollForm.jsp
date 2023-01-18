<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<link href="${pageContext.request.contextPath}/resources/css/homeboard.css" rel="stylesheet" type="text/css">
<style>
     .form-group{margin-top:20px;}
     
     @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
    } 
     
</style>
<body> 
<%@ include file="../common/header.jsp"%>
<div class="container" style="width:1300px; margin:50px auto; font-family: 'Pretendard-Regular';">

 <form id="enrollForm" method="post" action="insert.in" enctype="multipart/form-data">
 
  	<div class="form-group"> 
      <img src="${path}/resources/img/write.png" width="30px">필수 정보 입력  &ensp;&ensp;
        <span><strong>인테리어 후기를 자세하게 남겨주세요.</strong></span>
     </div>         
     
        <div class="form-group"> 
          <label for="homeFamilyv">가족형태</label>&ensp;&ensp;
             <select name="interFamily" style="width: 220px; height: 40px; border: 1px solid rgb(218, 218, 218);  border-radius: 4px; color: rgb(139, 138, 138); padding-left: 10px;">
                 <option value="name">선택해주세요.</option>
                 <option value="싱글라이프">싱글라이프</option>
                 <option value="신혼부부">신혼부부</option>
          </select>   
      </div>     
 
 
       <div class="form-group"> 
        <label for="homeOption">주거형태</label>&ensp;&ensp;
           <select name="interHome" style="width: 220px; height: 40px; border: 1px solid rgb(218, 218, 218); border-radius: 4px; color: rgb(161, 160, 160); padding-left: 10px;">
                 <option value="none">선택해주세요.</option>
                 <option value="원룸">원룸</option>
                 <option value="오피스텔">오피스텔</option>
                 <option value="아파트">아파트</option>
            </select>
       </div>  
     
     <div class="form-group"> 
     <label for="main_file">메인 이미지 첨부</label>&ensp;&ensp;
        <input type="file" name="upfile" class="main_file">
     </div>
     
         <div class="form-group">  
			<input type="text" class="form-control" id="title" name="boardTitle" placeholder="제목을 입력하세요" style="border-radius:5px; width:100%; padding:10px;">
		</div>
	
		<div class="form-group"> 
  			<textarea id="summernote" name="boardContent"></textarea>
		</div>
     
     <div class="pt-1 text-right" style="text-align: right; margin-top:20px;">
		 <button type="submit" class="btn btn-primary" style="cursor: pointer;  width:10%; padding:13px; font-family: 'Pretendard-Regular';background-color: #21d9cb; font-size: 16px; border: 1px solid white; color: white; border-radius: 5px;" >등록하기</button>
         <button type="reset" class="btn btn-danger" style="cursor: pointer;  width:10%; padding:13px; font-family: 'Pretendard-Regular';background-color: #21d9cb; font-size: 16px; border: 1px solid white; color: white; border-radius: 5px;">취소하기</button>
	</div>

<input type="hidden" value="${ id }" name="memId">	
	
	</form>
</div>  
 <script>
	// 툴바생략
	
	$('#summernote').summernote({
            height: 400,                 // 에디터 높이
            minHeight: 400,             // 최소 높이
            maxHeight: 400,             // 최대 높이
            focus: true,
            toolbar: [
                // 글꼴 설정
                ['fontname', ['fontname']],
                // 글자 크기 설정
                ['fontsize', ['fontsize']],
                // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                // 글자색
                ['color', ['forecolor','color']],
                // 표만들기
                ['table', ['table']],
                // 글머리 기호, 번호매기기, 문단정렬
                ['para', ['ul', 'ol', 'paragraph']],
                // 줄간격
                ['height', ['height']],
                // 그림첨부, 링크만들기, 동영상첨부
                ['insert',['picture','link','video']],
                // 코드보기, 확대해서보기, 도움말
                ['view', ['codeview','fullscreen', 'help']]
            ],
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
            
            callbacks : { 
               onImageUpload : function(files) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
                  
                     console.log(files[0]);                     
                     uploadSummernoteImageFile(files[0], this);
               }
               
            } 
      
        });
        
        
        function uploadSummernoteImageFile (file, editor) {
            var data = new FormData();
            data.append("file", file);
            data.append("pathF", "${path}")
            //console.log(file);
            console.log(editor);
            console.log("에이잭스실행전");
            $.ajax({
               data: data,
               type:"POST",
               url: "SummerNoteImageFile2",
               contentType: false,
               processData: false,
               success: function(data) {
                  console.log('성공은했냐?');
                  console.log(data);
                  console.log(data.url);
                  console.log(data.fileRoot);
                  console.log(data.fileName);
                  console.log(data.url);
                  $(editor).summernote('insertImage', data.fileRoot+"/"+data.fileName);
               },
               error: function(e) {
                  console.log(e);
               }
               
            })
         }

</script>
     
<jsp:include page="../common/footer.jsp"/>


</body>
</html>