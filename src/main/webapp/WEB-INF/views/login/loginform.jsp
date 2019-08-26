<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	
</script>
<body onload="document.f.id.focus()">
	<h1>로그인</h1>
	<%-- 	<h2>
		<c:out value="${error}"></c:out>
	</h2>
	<h2>
		<c:out value="${logout}"></c:out>
	</h2> --%>
	<form name="f" action="login" method="post">
		<c:if test="${not empty ERRORMSG }">
		<p>${ERRORMSG }</p>
	</c:if>
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" name="username"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<%-- <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
					<font color="red">
						<p>
							Your login attempt was not successful due to <br/>
							${SPRING_SECURITY_LAST_EXCEPTION.message}
						</p> <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
					</font>
				</c:if> --%>
				<tr>
					<td colspan="2"><input name="submit" type="submit" value="로그인"></td>
				</tr>
				<input name="${_csrf.parameterName}" type="hidden"
					value="${_csrf.token}">
			</tbody>
		</table>
	</form>
	<button onclick="location='searchID'">아이디 찾기</button>
	<button onclick="location='searchPassword'">비밀번호 찾기</button>
	<button onclick="location='join/joinform'">회원가입</button>
</body>
</html>