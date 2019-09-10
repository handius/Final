<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<sec:authorize access="isAnonymous()">
		<script>
			alert("로그인이 필요한 서비스입니다.");
			document.location.href="../login";
		</script>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<script>
			alert("권한이 없습니다.");
			window.history.back();
		</script>
	</sec:authorize>
</body>
</html>