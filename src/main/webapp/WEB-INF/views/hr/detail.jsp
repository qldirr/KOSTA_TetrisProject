<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/mypage.css" rel="stylesheet" type="text/css">
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="https://kit.fontawesome.com/3c50ab6b24.js"></script>

<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/cusModify.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>

</head>

<body>
<!-- 보조사이드바 -->
			<div class="s-menu">	
				<div class="s-menu-title">
					<p>인사정보관리</p>
				<!-- 	<i class="fa-solid fa-pen-to-square fa-lg"></i> -->
				</div>
					<div class="s-list-item ">
					    <input id="newbtn" type="button" value="사원목록" onclick="location.href='/hr/list'">
					</div> 
					<div class="s-list-item ">
					   <br> <input id="newbtn" type="button" style="font-weight: bold; font-size: 17px"  value="사원등록"  onclick="location.href='/hr/register'">
					</div> 
				
				<!-- <div class="s-list-item ">
					<a href="">회원 목록</a>
				</div> -->
			<!-- 	<div class="s-list-item ">
					<a href="">회원 등록</a>
				</div> -->
			</div>
			<!-- 보조사이드바 끝-->


<h1>${u.e_name}의 상세정보</h1>
<%-- <div class="detailBody">
	<table class="detailTable" border ="1" width = "1000px">
		<thread>
			<tr>
				<th>사원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>총연차일수</th>
				<th>연차사용일수</th>
				<th>생일</th>
				<th>직급</th>
				<th>부서번호</th>
				<th>권한</th>
				
			</tr>
		</thread>
	
		<tr>
			<td style="text-align: center">${u.e_num}</td>
			<td style="text-align: center">${u.e_id}</td>
			<td style="text-align: center">${u.e_name}</td>
			<td style="text-align: center">${u.e_pnum}</td>
			<td style="text-align: center"> ${u.e_totalvac}</td>
			<td style="text-align: center">${u.e_usevac}</td>
			<td style="text-align: center">${u.e_birth}</td>
			<td style="text-align: center">${u.e_position}</td>
			<td style="text-align: center">${u.d_num}</td>
			<td style="text-align: center">${a.a_auth}</td>	
			<td>${auth.auth}</td>	
			<td>${a.auth}</td>	
			
		</tr>
	
	</table>
	<a href="/hr/modifyView?e_id=${u.e_id}">수정하기</a>

</div> --%>
<div class="s-container">
<p style="font-size: 50px">${u.e_name}님의 정보</p>
<section id="content">
 <form role="form" method="get" action="/hr/modifyView" autocomplete="off"	accept-charset="UTF-8" id="regForm">
  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
   
   <div class="all-group">
   <div class="form-group">
   <label for="userId">아이디</label>
   <input type="text" id="userId" class="form-control" name="e_id" value = "${u.e_id}" readonly="readonly" />      
  </div>
   <div class="form-group">
   <label for="userName">이름</label>
   <input type="text" id="userName" class="form-control" name="e_name" value = "${u.e_name}" readonly="readonly" />      
  </div>
  <div class="form-group">
   <label for="userPass">패스워드</label>
   <input type="password" id="userPass" class="form-control" name="e_pw" value = "${u.e_pw}"  readonly="readonly" />      
  </div>
  

  
  <div class="form-group">
   <label for="userPhon">연락처</label>
   <input type="text" id="userPhon" class="form-control" name="e_pnum" value = "${u.e_pnum }" readonly="readonly" />      
  </div>
  
     <div class="form-group">
   <label for="uservac">총연차수일</label>
   <input type="text" id="totalvac" class="form-control" name="e_totalvac" value = "${u.e_totalvac}" readonly="readonly" />      
  </div>
  
     <div class="form-group">
   <label for="uservac">연차사용일</label>
   <input type="text" id="uservac" class="form-control" name="e_usevac" value = "${u.e_usevac}" readonly="readonly" />      
  </div>
  
  <!--  <div class="input_area">
   <label for="userResign">퇴사일</label>
   <input type="text" id="userResign" name="userResigndate" placeholder="퇴사일을 입력해주세요."  />      
  </div> -->
  

   <div class="form-group">
   <label for="userBirth">생년월일</label>
   <input type="text" id="userBirth" class="form-control" name="e_birth" value = "${u.e_birth}"  readonly="readonly" />      
  </div>
  
  <div class="form-group">
   <label for="userPosition">직급</label>
   <input type="text" id="userPosition" class="form-control" name="e_position" value = "${u.e_position}" readonly="readonly" />      
  </div>
  <div class="form-group">
   <label for="departmentNumber">부서번호</label>
   <input type="text" id="departmentNumber" class="form-control" name="d_num" value = "${u.d_num}" readonly="readonly" />      
  </div>
  
  <div class="form-group">
   <label for="auth">권한</label>
   <input type="text" id="auth" class="form-control" name="a_auth" value = "${a.a_auth}" readonly="readonly" />      
  </div>
 <!--  <a href="/hr/list">수정하기</a> -->
 <div class="modifybtn">
  <button type="submit" id="updateUser_btn" class="form-control" name="updateUser_btn">수정하기</button>
  </div>

</div> 
 </form>   
 <form action="/hr/delete" method="post">
  <div class="deletebtn">
  <button type="submit" id="deleteUser_btn" class="form-control" name="updateUser_btn">탈퇴하기</button>
</div>
 </form>
 
</section>
</div>
</body>
</html>