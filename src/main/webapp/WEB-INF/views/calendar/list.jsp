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
	href="/resources/vender/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/fullcalendar/main.css" />
<link rel="stylesheet"
	href="/resources/css/mycss/bootstrap-datepicker3.css" />
<link rel="stylesheet"
	href="/resources/css/mycss/jquery.timepicker.min.css" />

<style type="text/css">
#regCalBtn {
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
	width: 100px;
	height: 70px;
}

#calendar {
	width: 1000px;
	height: 630px;
	margin-top: 10px;
}
</style>

<script src="/resources/fullcalendar/main.js" type="text/javascript"></script>
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
	type="text/javascript"></script>
<script src="/resources/fullcalendar/locales-all.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/js/myjs/bootstrap-datepicker.js"
	type="text/javascript"></script>
<script src="/resources/js/myjs/jquery.timepicker.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {

		var calArr = [];

		$.ajax({
			url : '/calendar/listCal',
			type : 'get',
			dataType : 'json',
			contentType : "application/json"
		}).done(function(data, textStatus, xhr) {

			$(data).each(function(index, value) {
				calArr.push(value)
			}); //controller의 list를 get방식으로 가져옴(Ajax 사용)

			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar : {
					left : '',
					center : 'title'

				},
				locale : 'ko',
				initialView : 'dayGridMonth',

				editable : true,//수정 여부
				events : calArr, //일정 리스트 출력
				eventClick : function(info) { //일정 클릭 시 일정 상세 페이지로 이동
					getCal(info.event.id);
				}

			});

			calendar.render();

		});

	});

	function getCal(cl_num) { //일정상세 페이지로 이동
		location.href = "/calendar/get?cl_num=" + cl_num;
	}

	var moveTo = (function() { //일정등록 버튼 눌렀을때 등록 폼으로 이동
		function registerCal() {
			self.location = "/calendar/register";
		}

		return {

			registerCal : registerCal,
		}
	})();

	$(function() {

		$('#newbtn').on('click', moveTo.registerCal);
	}) //등록 폼으로 이동 끝
</script>
</head>
<body>

	<!-- jsp 인클루드 사용-->
	<div class="wrap">
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
		<div class="wrap-box">
			<div class="s-container">



				<div id="calendar"></div>






			</div>
		</div>
	</div>

	<!-- 내용 끝 -->

	<!-- 전체 wrapper 끝 -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>

</html>



