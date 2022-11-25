<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지</title>
</head>
<body>
<h1>all</h1>
all
<sec:authorize access="isAnonymous()">
<a href="/member/customLogin">로그인</a><br>


</sec:authorize>
<sec:authorize access="isAuthenticated()">
<a href="/member/customLogout">로그아웃</a>
<br><a href="/member/user">마이페이지</a>
</sec:authorize>

</body>
</html>