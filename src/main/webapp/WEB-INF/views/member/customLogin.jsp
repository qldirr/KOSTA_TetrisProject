<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/login.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$(document).ready(
		
		function(){
			$("#submit").on("click", function(){
				if($("#username").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				else if($("#username").val()!=null&&$("#password").val()!=null){
					$("#login").submit();
				}
		}
		
	)}
	)

</script>
</head>
 
<body>
<h1></h1>
<%-- <h2><c:out value="${error}"/></h2> --%>
<h2><c:out value="${logout}"/></h2>

<div class="container">
		<div class=" col-xs-6"></div>
		<div class=" col-xs-6">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="/login" id="login">
				
					<img alt="tetrislogo" src="/resources/img/TETRIS.jpg" width="200" height="200" id="imgc">
					
					<!--  <h3 style="text-align: center;">로그인 화면</h3>-->
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" id="username" name="username" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" id="password" name="password" maxlength="20">
					</div>
			
					<div class="check">
					<input type="checkbox" name="remember-me">로그인 유지
					</div>
					<input type="submit" id="submit" class="btn btn-primary form-control" value="로그인">
					<p style="color: red; font-size: 5px;"><c:out value="${error}"/></p>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</div>
		</div>
		<div class=" col-xs-6"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/resources/vender/bootstrap/js/bootstrap.js"></script>
</body>
</html>