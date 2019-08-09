<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>principle : <sec:authentication property="principal"/></p>
	<p>MemberDTO : <sec:authentication property="principal.member"/></p>
	<p>사용자 이름: <sec:authentication property="principal.member.user_id"/></p>
	<p> 사용자 아이디: <sec:authentication property="principal.member.user_name"/></p>
	<p> 권한 리스트: <sec:authentication property="principal.member.authorityList"/></p>
</body>
</html>