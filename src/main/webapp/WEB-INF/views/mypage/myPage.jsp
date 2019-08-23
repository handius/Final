<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div class="left">
			<sec:authorize access="!hasRole('ROLE_SELLER')">
				<img alt="buyer" src="/resources/image/wink.png">
				<h3>구매자</h3>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_SELLER')">
				<img alt="seller" src="/resources/image/cool.png">
				<h3>판매자</h3>
			</sec:authorize>
			<sec:authentication property="principal.member.user_id" var="user_id" />
			<h3>${user_id }님</h3>
		</div>
		<div class="right">
			<ul>
				<li><a href="pWCheck">회원 정보 수정</a></li>
				<li><a href="buyList">나의 구매 내역</a></li>
				<li><a href="cQAList">나의 고객 문의</a></li>
				<li><a href="buyerPQAList">나의 상품 문의</a></li>
				<li><a href="buyerReviewList">나의 상품 후기</a></li>
			</ul>
			<sec:authorize access="hasRole('ROLE_SELLER')">
				<ul>
					<li><a href="sellList">나의 판매 내역</a></li>
					<li><a href="sellerReviewList">상품 문의 관리</a></li>
					<li><a href="sellerPQAList">상품 후기 관리</a></li>
				</ul>
			</sec:authorize>
		</div>
	</div>
</body>
</html>