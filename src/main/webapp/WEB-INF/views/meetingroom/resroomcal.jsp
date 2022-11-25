<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TetrisGroupware</title>

<link rel="stylesheet" href="/resources/fullcalendar/lib/main.css" />
<link href="/resources/css/res.css" rel="stylesheet">

<script src="/resources/fullcalendar/lib/main.js" type="text/javascript"></script>
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {

		var num = '${mr_num.mr_num}';
		var resArr = [];

		$.ajax({
			url : '/meetingroom/listresroomcal?mr_num='+ num,
			type : 'get',
			dataType : 'json',
			contentType : "application/json"
		}).done(function(data, textStatus, xhr) {

			$(data).each(function(index, value) {
				resArr.push(value)
				console.log(value);

			});

			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'timeGridWeek',
				contentHeight : 600,
				editable : true,
				events : resArr

			});

			calendar.render();

		});

	});
</script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../includes/header.jsp"></jsp:include>
		<!-- 보조메뉴바 시작 -->
		<div class="s-menu">
			<div class="s-menu-title">
				<p>
					예약 <i class="bi bi-tags"></i>
					<!-- 메인 메뉴바랑 동일한 i테그 넣음 -->
			</div>
			<div class="s-list-item ">
				<a href="/meetingroom/resroomcal?mr_num=RS001">회의실(블록)예약</a>
			</div>
			<div class="s-list-item ">
				<a href="/meetingroom/resroomcal?mr_num=RS002">회의실(콤보)예약</a>
			</div>
			<sec:authorize access="hasRole('ROLE_USER')">
				<div class="s-list-item ">
					<a href="/reservation/rescarmain">차량예약</a>
				</div>
			</sec:authorize>
		</div>
		<!-- 보조메뉴바 끝 -->

		<!-- 내용 시작 -->
		<div class="wrap-box">
			<div class="s-container">

				<h2 id="c-title">${mr_num.mr_name}회의실 예약현황 (${mr_num.mr_total})</h2>
				<sec:authorize access="hasRole('ROLE_USER')">
					<input type="button" class="write_Btn" id="resRoomBtn"
						value="회의실예약"
						onclick="location.href = '/meetingroom/registerrseroom?mr_num=${mr_num.mr_num}'" />
				</sec:authorize>
				<div id='calendar'></div>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>