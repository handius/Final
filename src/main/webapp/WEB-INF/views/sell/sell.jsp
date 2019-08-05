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

	
	<c:if test="${PageDTO.startblock>1 }">
		<a href="sell?currpage=${PageDTO.startblock-1 }">이전</a>
	</c:if>
	<c:forEach var="i" begin="${PageDTO.startblock }" end="${PageDTO.endblock }">
		<c:if test="${i==PageDTO.currpage }">
			<c:out value="${i }"></c:out>
		</c:if>
		<c:if test="${i!=PageDTO.currpage }">
			<a href="sell?currpage=${i }"><c:out value="${i}"></c:out></a>
		</c:if>
	</c:forEach>
	<c:if test="${PageDTO.endblock < PageDTO.totalpage }">
		<a href="sell?currpage=${PageDTO.endblock+1}">▶</a> 
	</c:if>
</body>
</html>