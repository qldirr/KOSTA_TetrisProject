<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    <%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title></title>
<link href="/resources/css/cusList.css" rel="stylesheet">
<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 보조사이드바 -->
			<div class="s-menu">	
				<div class="s-menu-title">
					<p>인사정보관리</p>
					<i class="fa-solid fa-pen-to-square fa-lg"></i>
				</div>
				
				<div class="s-list-item ">
					   <input id="newbtn" type="button" style="font-weight: bold; font-size: 17px" value="사원목록" onclick="location.href='/hr/list'">
					</div> 
					<div class="s-list-item ">
					     <br><input id="newbtn" type="button" value="사원등록" onclick="location.href='/hr/register'">
					</div> 
					
				<!-- <div class="s-list-item ">
					<a href="">회원 목록</a>
				</div> -->
			<!-- 	<div class="s-list-item ">
					<a href="">회원 등록</a>
				</div> -->
			</div>
			<!-- 보조사이드바 끝-->
<div class="htwo">
<h2>사원목록</h2>
<br>
</div>			


<div class="listBody">
	<table class="table table-striped table-bordered table-hover" border ="1" width = "700px" style= "text-align:center">
		<thread>
			<tr>
				<th>사원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>입사일</th>
			</tr>
		</thread>
		
		<tbody>
	<c:forEach items="${list}" var="u" >

		<tr>
			<%-- <td><a href="/hr/detail?userNumber=${u.userNumber}">${u.userNumber}</a></td> --%>
			<td style="text-align: center">${u.e_num}</td>
			<td style="text-align: center"><a href="/hr/detail?e_id=${u.e_id}">${u.e_id}</a></td>	
			<td style="text-align: center">${u.e_name}</td>
			<td style="text-align: center">${u.e_hireddate}</td>
			<!-- <td style="text-align: center"><a href="/hr/delete">삭제하기</a></td>	 -->	
			<!-- <input type="submit" > -->		
		</tr>
		
	</c:forEach>
		</tbody>
	</table>


</div>
<%-- 	<jsp:include page="../includes/footer.jsp"></jsp:include> --%>


</body>
</html>