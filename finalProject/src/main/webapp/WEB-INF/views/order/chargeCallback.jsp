<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구싶은집 > 충전 완료창</title>
<!-- 파비콘 로고 -->
<link rel="icon" href="${path}/resources/img/pavilogo.png">
</head>
<script type="text/javascript">
	alert("${alertMsg}");
	window.close();
</script>
<body>
	
</body>
</html>