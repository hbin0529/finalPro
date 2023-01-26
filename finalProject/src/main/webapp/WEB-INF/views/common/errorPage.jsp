<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구싶은집 > 에러가 났습니다?</title>
<!-- 파비콘 로고 -->
<link rel="icon" href="${path}/resources/img/pavilogo.png">
</head>
<body>
    <jsp:include page="header.jsp"/>

    <br>
    <div align="center">
        <img src="https://cdn-icons-png.flaticon.com/512/4522/4522205.png">
        <br><br>
        <!--에러 문구 넣을 곳-->
        <h1 style="font-weight:bold">${ errorMsg }</h1>
    </div>
    <br>

    <jsp:include page="footer.jsp" />
</body>
</html>