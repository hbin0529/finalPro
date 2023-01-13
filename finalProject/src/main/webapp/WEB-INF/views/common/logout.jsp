<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
  Kakao.init('1dd3ef03f2a09b8946553bf5c5bb032f'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script>
function kakaoLogout() {
    Kakao.Auth.logout()
      .then(function() {
        alert('로그아웃됐어');
        deleteCookie();
      })
      .catch(function() {
        //alert('Not logged in');
      });
  }
function deleteCookie() {
    document.cookie = 'authorize-access-token=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
  }
function Logout(){
    sessionStorage.clear();
}
kakaoLogout()
Logout();
alert('${alertMsg}');
document.location.href="index.jsp"
</script>
</body>
</html>