<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
	type="text/javascript"></script>
	<script src="https://kit.fontawesome.com/7264476d39.js" crossorigin="anonymous"></script>
	<link rel="stylesheet"
	href="/resources/vender/bootstrap/css/bootstrap.min.css">
<style type="text/css">
	
	.bs-callout {
margin: 20px 0;
padding: 15px 30px 15px 15px;
}
.bs-callout h4 {
margin-top: 0;
}
.bs-callout p:last-child {
margin-bottom: 0;
}
.bs-callout code,
.bs-callout .highlight {
background-color: #fff;
}

/* Themes for different contexts */
.bs-callout-danger {
background-color: #FFFFFF;
border: 1px solid #f5f5f5;
border-left: 5px solid #226666;
}
.bs-callout-warning {
background-color: #FFFFFF;
border: 1px solid #f5f5f5;
border-left: 5px solid #f0ad4e;
}
.bs-callout-info {
background-color: #FFFFFF;
border: 1px solid #f5f5f5;
border-left: 5px solid #04004D;
}

 a:link { text-decoration: none;}



</style>
</head>
<body>

<div class="wrap">
<jsp:include page="../includes/header.jsp"></jsp:include>
			<!-- 보조메뉴바 시작 -->
			
			<div class="s-menu">
				<div class="s-menu-title">
					<p>프로젝트 <i class="bi bi-clipboard-data"></i>
				</div>
				<div class="s-list-item ">
				    <input id="newbtn" type="button" value="새 프로젝트 만들기" onclick="self.location = '/project/register';">
				</div>

			</div>
			
<div class="wrap-box">

<div class="s-container">
			<br>
			<h2 id="c-title">내 프로젝트</h2>
		<c:forEach items="${list }" var="myProject">
			<c:if test="${myProject.pj_type eq '협업'}">
			
					
					<div class="bs-callout bs-callout-info">
					<span class="badge badge-secondary">${myProject.pj_type }</span>
			</c:if>	
			
			<c:if test="${myProject.pj_type eq '단일'}">
					
					<div class="bs-callout bs-callout-warning">
					<span class="badge badge-warning">${myProject.pj_type }</span>
			</c:if>		
			<c:if test="${myProject.pj_type eq '전사'}">
					
					<div class="bs-callout bs-callout-danger">
					<span class="badge badge-info">${myProject.pj_type }</span>
			</c:if>		
						<strong> ${myProject.pj_name } </strong>  ${myProject.pj_contents }  <a href="/projectdetail/home/${myProject.pj_num}"> <i class="fa-solid fa-arrow-right-to-bracket" style="color: #161E67"></i></a> <br>
						프로젝트 참여자: 
						<c:forEach items="${myProject.pj_members }" var="member"><span class="badge badge-pill badge-light">${member.d_name }</span>${member.e_name } (${member.e_id }) </c:forEach><br>
							
							
						<div class="progress">
  							<div class="progress-bar" role="progressbar" style="width: ${myProject.pj_finishedTask}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">${myProject.pj_finishedTask} %</div>
						</div>
						
						
						
					</div>

			</c:forEach>
		</div>
	</div>
</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>

