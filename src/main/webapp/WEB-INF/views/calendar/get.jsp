<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인입니다.</title>

<link rel="stylesheet"
	href="/resources/vender/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/css/mycss/bootstrap-datepicker3.css" />
<link rel="stylesheet"
	href="/resources/css/mycss/jquery.timepicker.min.css" />
<style type="text/css">
#list {
	border-style: none;
	background-color: #161E67;
	color: #FFF2CA;
	border-radius: 10px;
	padding-bottom: 7px;
	padding-top: 7px;
	padding-left: 10px;
	padding-right: 10px;
	font-weight: bold;
	font-family: sans-serif;
}

#modify {
	border-style: none;
	background-color: #FFF2CA;
	color: #161E67;
	border-radius: 10px;
	padding-bottom: 7px;
	padding-top: 7px;
	padding-left: 10px;
	padding-right: 10px;
	font-weight: bold;
	font-family: sans-serif;
	margin-left: 10px;
}

#remove {
	border-style: none;
	background-color: #D2D2D2;
	color: black;
	border-radius: 10px;
	padding-bottom: 7px;
	padding-top: 7px;
	padding-left: 10px;
	padding-right: 10px;
	font-weight: bold;
	font-family: sans-serif;
	margin-left: 10px;
}

.col-sm-2 col-form-label {
	font-family: sans-serif;
}

h1 {
	font-family: sans-serif;
}

.s-container {
	width: 950px;
	height: 350px;
}
</style>


<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
	type="text/javascript"></script>
<script src="/resources/js/myjs/bootstrap-datepicker.js"
	type="text/javascript" defer></script>
<script src="/resources/js/myjs/jquery.timepicker.min.js"
	type="text/javascript" defer></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#datePickerstart').datepicker({
			format : "yyyy-mm-dd",
			autoclose : true
		});

		$('#datePickerend').datepicker({
			format : "yyyy-mm-dd",
			autoclose : true
		});

		$('input.timepicker').timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			startTime : '06:00',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});
		
		//일정등록 버튼 눌렀을때 등록 폼으로 이동
		var moveTo = (function() { 
			function listCal() {
				self.location = "/calendar/list";
			}

			return {

				listCal : listCal
			}
		})();

		$(function() {

			$('#list').on('click', moveTo.listCal);
		}) //등록 폼으로 이동 끝

		var form = $("#form");

		$("#remove").on("click", function(e) {   //삭제버튼 눌렀을때 
			form.attr("action", "/calendar/remove").submit();
		});
		$("#modify").on("click", function(e) {   //수정버튼 눌렀을때
			form.attr("action", "/calendar/modify").submit();
		});

	});
</script>
</head>
<body>

	<!-- jsp 인클루드 사용-->

	<jsp:include page="../includes/header.jsp"></jsp:include>


	<!-- 보조사이드바 -->
	<div class="s-menu">
		<div class="s-menu-title">
			<p>
				일정 관리<i class="bi bi-table"></i>
		</div>
		<div class="s-list-item ">
			<input id="newbtn" type="button" value="일정 등록">
		</div>
		<div class="s-list-item ">
			<a href="/calendar/list">일정 관리</a>
		</div>
		<div class="s-list-item ">
			<a href="/todo/list">ToDoList</a>
		</div>
	</div>
	<!-- 보조사이드바 끝-->

	<!-- 내용 시작 -->

	<div class="s-container">
		<h2 id="c-title">일정 상세</h2>

		<form method="post" accept-charset="UTF-8" id="form">
			<input type="hidden" name="e_id"
				value='<c:out value="${calendar.e_id }"/>'> <input
				type="hidden" name="cl_num"
				value='<c:out value="${calendar.cl_num }"/>'>
			<div class="form-group row">
				<label for="input_cl_name" class="col-sm-2 col-form-label">일정명</label>
				<div class="col-sm-10">
					<input type="text" name="cl_name"
						value='<c:out value="${calendar.cl_name }"/>'>
				</div>
			</div>

			<div class="form-group row">
				<label for="input_cl_startdate" class="col-sm-2 col-form-label">일정
					시작일</label>
				<div class="col-sm-10">
					<input id="datePickerstart" type="text" name="cl_startdate"
						value='<c:out value="${calendar.cl_startdate }"/>'>
				</div>
			</div>

			<div class="form-group row">
				<label for="input_cl_starttime" class="col-sm-2 col-form-label">일정
					시작시간</label>
				<div class="col-sm-10">
					<input type="text" name="cl_starttime" class="timepicker"
						value='<c:out value="${calendar.cl_starttime }"/>'>
				</div>
			</div>

			<div class="form-group row">
				<label for="input_cl_enddate" class="col-sm-2 col-form-label">일정
					마감일</label>
				<div class="col-sm-10">
					<input id="datePickerend" type="text" name="cl_enddate"
						value='<c:out value="${calendar.cl_enddate }"/>'>
				</div>
			</div>

			<div class="form-group row">
				<label for="input_cl_endtime" class="col-sm-2 col-form-label">일정
					마감시간</label>
				<div class="col-sm-10">
					<input type="text" name="cl_endtime" class="timepicker"
						value='<c:out value="${calendar.cl_endtime }"/>'>
				</div>
			</div>

			<div class="form-group row">
				<label for="input_cl_color" class="col-sm-2 col-form-label">색깔</label>
				<div class="col-sm-10">
					<input type="color" name="cl_color"
						value='<c:out value="${calendar.cl_color }"/>'>
				</div>
			</div>

			<div class="form-group row">
				<label for="input_cl_contents" class="col-sm-2 col-form-label">일정
					내용</label>
				<div class="col-sm-10">
					<textarea rows="8" cols="50" id="cl_contents" name="cl_contents"
						value='<c:out value="${calendar.cl_contents }"/>'></textarea>
				</div>
			</div>


			<div class="form-group row">
				<div class="col-sm-10">
					<input type="button" id="list" value="일정 목록"> <input
						type="submit" id="modify" value="일정 수정"> <input
						type="submit" id="remove" value="일정 삭제">

				</div>
			</div>
		</form>






	</div>


	<!-- 내용 끝 -->

	<!-- 전체 wrapper 끝 -->


</body>

</html>



