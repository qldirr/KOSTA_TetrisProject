<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
    
<!DOCTYPE HTML>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title></title>
<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/cusModify.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>

<title></title>
</head>
<body>
<!-- 보조사이드바 -->
		<!-- 	<div class="s-menu">	
				<div class="s-menu-title">
					<p>인사정보관리</p>
					<i class="fa-solid fa-pen-to-square fa-lg"></i>
				</div>
					<div class="s-list-item ">
					    <input id="newbtn" type="button" value="사원등록"  onclick="location.href='/hr/register'">
					</div> 
					<div class="s-list-item ">
					    <br><input id="newbtn" type="button" style="font-weight: bold; font-size: 17px"   value="사원목록" onclick="location.href='/hr/list'">
					</div> 
				<div class="s-list-item ">
					<a href="">회원 목록</a>
				</div>
				<div class="s-list-item ">
					<a href="">회원 등록</a>
				</div>
			</div> -->
			<!-- 보조사이드바 끝-->

<div class="s-container">
<p style="font-size: 50px">${u.e_name}님의 정보</p>
<section id="content">
 <form role="form" method="post" action="/member/modify" autocomplete="off"	accept-charset="UTF-8" id="regForm">
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
   <input type="password" id="userPass" class="form-control" name="e_pw" value = "${u.e_pw}"  required="required" />      
  </div>
  
 
  
  <div class="form-group">
   <label for="userPhon">연락처</label>
   <input type="text" id="userPhon" class="form-control" name="e_pnum" value = "${u.e_pnum }" required="required" />      
  </div>
  
  
  
  <!--  <div class="input_area">
   <label for="userResign">퇴사일</label>
   <input type="text" id="userResign" name="userResigndate" placeholder="퇴사일을 입력해주세요."  />      
  </div> -->
  

   <div class="form-group">
   <label for="userBirth">생년월일</label>
   <input type="text" id="userBirth" class="form-control" name="e_birth" value = "${u.e_birth}"  required="required" />      
  </div>
  
  <div class="form-group">
   <label for="userPosition">직급</label>
   <input type="text" id="userPosition" class="form-control" name="e_position" value = "${u.e_position}" required="required" />      
  </div>
  <div class="form-group">
   <label for="departmentNumber">부서번호</label>
   <input type="text" id="departmentNumber" class="form-control" name="d_num" value = "${u.d_num}" />      
  </div>
 <!--  <a href="/hr/list">수정하기</a> -->
  <button type="submit" id="updateUser_btn" class="form-control" name="updateUser_btn">수정완료</button>
</div> 
 </form>   
</section>
</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/resources/vender/bootstrap/js/bootstrap.js"></script>
	<%-- 	<jsp:include page="../includes/footer.jsp"></jsp:include> --%>
</body>
</html>