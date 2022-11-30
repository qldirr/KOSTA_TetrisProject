<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--
<%@ include file="../includes/header.jsp"%>
--%>
<html xmlns:th="http://www.thymeleaf.org">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title></title>
<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/cusRegister.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
<%--	<script th:inline="javascript">--%>
	$(document).ready(

			function(){
			<%--	if(errorMessage !=null) {--%>
			<%--		alert(errorMessage);}--%>


		/*$('#idChk').on('click', function(){
			var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
			console.log($('#userId').val());

			$.ajax({
				url : "/hr/idCheck",
				type : "post",
				dataType : "json",
				data : {e_id: $('#userId').val()},
				success : function(data){
					if(idReg.test($('#userId').val())){
						if(data == 1){
							alert("중복된 아이디입니다.");
						}else if(data == 0){
							$("#idChk").attr("value", "Y");
							alert("사용가능한 아이디입니다.");
						}

					}
					else if(!idReg.test($('#userId').val())){
						   alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");



					}
				}
			})
		});*/

		$("#submit").on("click", function(){
					<%--let errorMessage = [[${errorMessage}]];--%>
					<%--if(errorMessage !=null) {--%>
					<%--	alert(errorMessage);--%>
					<%--	console.log(errorMessage);--%>
					<%--	return false;--%>

					<%--}--%>
		<%--	// if($("#userId").val()==""){--%>
		<%--	// 	alert("아이디를 입력해주세요.");--%>
		<%--	// 	$("#userId").focus();--%>
		<%--	// 	return false;--%>
		<%--	// }--%>
		<%--	// if($("#userPass").val()==""){--%>
		<%--	// 	alert("비밀번호를 입력해주세요.");--%>
		<%--	// 	$("#userPass").focus();--%>
		<%--	// 	return false;--%>
		<%--	// }--%>
		<%--	// if($("#userPassck").val()==""){--%>
		<%--	// 	alert("비밀번호 확인란을 입력해주세요.");--%>
		<%--	// 	$("#userPassck").focus();--%>
		<%--	// 	return false;--%>
		<%--	// }--%>
		<%--	// if($("#userName").val()==""){--%>
		<%--	// 	alert("성명을 입력해주세요.");--%>
		<%--	// 	$("#userName").focus();--%>
		<%--	// 	return false;--%>
		<%--	// }--%>
		<%--	// var idChkVal = $("#idChk").val();--%>
		<%--	// var userpass = $("#userPass").val();--%>
		<%--	// var userpassck =  $("#userPassck").val()--%>
		<%--	// if(idChkVal == "N"){--%>
		<%--	// 	alert("중복확인 버튼을 눌러주세요.");--%>
		<%--	// 	return false;--%>
		<%--	// }--%>
		<%--	// else if(userpass != userpassck){--%>
		<%--	// 	alert("비밀번호를 확인해주세요");--%>
		<%--	// 	return false;--%>
		<%--	// }--%>
		<%--	//--%>
		<%--	// else if(idChkVal == "Y" && $("#userPass").val() == $("#userPassck")){--%>
		<%--	// 	$("#regForm").submit();--%>
		<%--	// }--%>


		<%--});--%>

		// $('#userPass, #userPassck').on('keyup', function () {
		//
		// 	  if ($('#userPass').val() == $('#userPassck').val()) {
		//
		// 	    $('#confirmMsg').html('비밀번호가 일치합니다.').css('color', 'green');
		//
		// 	  } else
		//
		// 	    $('#confirmMsg').html('비밀번호가 일치하지않습니다.').css('color', 'red');
		//
		// 	});


			}
		)
			});
	</script>
</head>
<body>
<!-- 보조사이드바 -->
			<div class="s-menu">
				<div class="s-menu-title">
					<p>인사정보관리</p>
					<i class="fa-solid fa-pen-to-square fa-lg"></i>
				</div>
					<div class="s-list-item ">
					    <input id="new-btn" type="button" value="사원목록" onclick="location.href='/hr/list'">
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





	<div class="s-container">
	<div class="htwo">
				<h2>사원등록:</h2>
				</div>
		<section id="content">
			<form action="/admin/new" role="form" method="post" autocomplete="off"
				accept-charset="UTF-8" id="regForm" >


				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="form-group">
					<label for="name"> 이름:</label> <input type="text" id="name"
							class="form-control" name="name" value="${employeeFormDto.name}" placeholder="이름"
						required="required"/>
<%--					<button type="button" id="idChk" value="N">이름확인</button>--%>

				</div>

				<div class="form-group">
					<label for="email"> 이메일:</label> <input type="text" id="email"
						class="form-control" name="email" value="${employeeFormDto.email}" placeholder="이메일을 입력해주세요"
						required="required" />
				</div>
				<div class="form-group">
					<label for="password">패스워드:</label> <input type="password"
						id="password" class="form-control" name="password" required="required" value="${employeeFormDto.password}"
						placeholder="비밀번호를 입력해주세요." />
				</div>

<%--				<div class="form-group">--%>
<%--					<label for="password">패스워드 확인:</label>--%>
<%--					 <input type="password"--%>
<%--						id="userPassck" class="form-control" name="e_pwchk"--%>
<%--						required="required"  placeholder="비밀번호를 다시 입력해주세요."--%>
<%--							/>--%>
<%--						<span id="confirmMsg" ></span>--%>
<%--				</div>--%>




				<div class="form-group">
					<label for="phoneNumber"> 연락처:</label> <input type="text"
						id="phoneNumber" class="form-control" name="phoneNumber" value="${employeeFormDto.phoneNumber}"
						placeholder="연락처를 입력해주세요" required="required" />
				</div>
<%--
				<div class="form-group">
					<label for="hireddate">입사일:</label> <input type="text" id="hireddate"
						class="form-control" name="hireddate" value="${employeeFormDto.hireddate}"
						placeholder="입사일을 입력해주세요.." required="required" />
				</div>--%>

				<!--  <div class="input_area">
   <label for="userResign">퇴사일</label>
   <input type="text" id="userResign" name="userResigndate" placeholder="퇴사일을 입력해주세요."  />
  </div> -->

				<div class="form-group">
					<label for="totalVac">총연차일수:</label> <input type="text"
						id="totalvac" class="form-control" name="totalVac" value="${employeeFormDto.totalVac}"
						placeholder="총연차일수를 입력해주세요." required="required" />
				</div>

				<div class="form-group">
					<label for="useVac">사용연차수:</label> <input type="text"
						id="useVac" class="form-control" name="useVac" value="${employeeFormDto.useVac}"
						placeholder="사용연차일수를 입력해주세요." required="required" />
				</div>

				<div class="form-group">
					<label for="birth">생년월일:</label> <input type="text"
						id="birth" class="form-control" name="birth" value="${employeeFormDto.birth}"
						placeholder="생년월일을 입력해주세요." required="required" />
				</div>

				<div class="form-group">
					<label for="position">직급:</label> <input type="text"
						id="position" class="form-control" name="position" value="${employeeFormDto.position}"
						placeholder="직급을 입력해주세요." required="required" />
				</div>
<%--
				<div class="form-group">
					<label for="departmentNum">부서번호:</label> <input type="text"
						id="departmentNum" class="form-control" name="departmentNum" value="${employeeFormDto.departmentId}"
						placeholder="부서번호를 입력해주세요..." />
				</div>--%>
				<div class="form-group">
					<label for="departmentName">부서이름:</label> <input type="text"
						id="departmentName" class="form-control" name="departmentName" value="${employeeFormDto.departmentName}"
						placeholder="부서번호를 입력해주세요..." />

				</div>
				<p><c:out value="${errorMessage}"/></p>
				<%--<div class="form-group">
					<label for="authmapping">권한:</label> <input type="text" id="auth"
						class="form-control" name="a_auth" placeholder="권한을 입력해주세요..." />
				</div>--%>

				<button type="submit" id="submit" class="form-control"
					name="insertUser_btn">회원가입</button>

			</form>
		</section>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/resources/vender/bootstrap/js/bootstrap.js"></script>
<%-- 	<jsp:include page="../includes/footer.jsp"></jsp:include> --%>
</body>
</html>