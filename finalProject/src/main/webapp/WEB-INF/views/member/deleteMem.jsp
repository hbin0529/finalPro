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
	<form action="deleteConfirm.me">
		<input type="hidden" name="id" value="${ id }">
		패스워드를입력해주세요<br><input type="password" name="pwd">
	</form>
</body>
</html>