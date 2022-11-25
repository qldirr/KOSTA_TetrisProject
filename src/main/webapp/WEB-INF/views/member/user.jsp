<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="/resources/css/mypage.css" rel="stylesheet" type="text/css">
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="https://kit.fontawesome.com/3c50ab6b24.js"></script>

<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/cusRegister.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<div class="wrap">
		<jsp:include page="../includes/header.jsp"></jsp:include>
		<div class="wrap-box">
			<div class="container">

				<!-- main-left 시작 -->
				<div class="main-left">
					<!-- 사원정보 -->
					<div class="myProfile Box">
						<span class="m-title">MyProfile </span> 
						<img alt="사진" src="../resources/img/res/<sec:authentication property="principal.username"/>.png">
						<div style="font-size: 18px;"><sec:authentication property="principal.user.e_name"/></div> 
					</div>

					<!-- 근태관리 -->

				<!-- 	<div class="hr Box">
						<span class="m-title">근태관리</span>
						<div class="time">
							시계모양
							<div class="att-time">
								<div>
									출근 시간<span id="att-str"></span>
								</div>
								<div>
									퇴근 시간<span id="att-fin"></span>
								</div>
							</div>
							<div class="att-btn">
								<a href="#"><i class="fa-solid fa-circle-play"></i></a> <a
									href="#"><i class="fa-solid fa-circle-stop"></i></a> <a
									href="#"><i class="fa-solid fa-circle-pause"></i></a>
							</div>
						</div>
					</div> -->
					<!-- 채팅링크박스 -->
					<!-- 
					<div class="chat Box">
						<div class="i-title" style="margin: 20px 0px 0px 0px;">
						    <a id="chat-a" href="http://localhost:8081/messanger/main" target="_blank">
							<i id="chat-i" class="fa-sharp fa-solid fa-comments fa-lg">
								Messenger</i></a>

						</div>
					</div>  -->
				</div>


				<!-- main center 시작 -->
				<div class="main-center">
					<div class="project Box">
						<span class="m-title">내 프로필<a href="/member/modifyView?e_id=<sec:authentication property="principal.username"/>" style="color: black"><i class="bi bi-chevron-right"></i></a></span><hr>
						<div style="font-size: 30px">&nbsp<i class="bi bi-person"></i> <sec:authentication property="principal.user.e_name"/></div><hr>
						<div style="font-size: 30px">&nbsp<i class="bi bi-phone"></i> 	${u.e_pnum}</div><hr>
						<div style="font-size: 30px">&nbsp<i class="bi bi-diagram-3-fill"></i> <sec:authentication property="principal.user.e_position"/></div>
						<%-- <div style="font-size: 30px"><sec:authentication property="principal.user.e_name"/></div> --%>
					</div>	
				<!-- 	<div class="elecAuth Box">
						<span class="m-title">전자결재</span>
					</div> -->
				</div>
				<!-- main center 끝 -->

				<!-- main-right 시작 -->
				<div class="main-right">
					<!-- <div class="suggest Box">
						<span class="m-title">공지사항</span>
					</div> -->
					<!-- <div class="free Box">
						<div style="float: left; margin: 0px 10px 0px 60px;;">
							<div class="current_temp" style="font-size: 50pt"></div>
							<div class="weather_description" style="font-size: 20pt"></div>
							<div class="city" style="font-size: 13pt"></div>
						</div>
						<div style="float: right; margin: 0px 10px 30px -10px;">
							<div class="temp_min"></div>
							<div class="temp_max"></div>
							<div class="humidity"></div>
							<div class="wind"></div>
							<div class="cloud"></div>
						</div>
						<div style="float: left; height: 50px; width: 50px; margin: 10px 10px 30px 10px;">
							<div class="weather_icon"></div> 
						</div>
						<br>
					</div> -->

				</div>
				<!-- main-rignt 끝 -->

			</div>
		</div>
		<!-- container 끝 -->
	</div>

<%-- <h1>user</h1>
user
<p>어서오세요.<sec:authentication property="principal.user.e_name"/>님</p>
<p>아이디: <sec:authentication property="principal.username"/></p>	
<a href="/member/customLogout">Logout</a> --%>
</body>
</html>