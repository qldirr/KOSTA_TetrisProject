<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/fullcalendar/main.css" />
<script src="https://kit.fontawesome.com/7264476d39.js" crossorigin="anonymous"></script>
<script src="/resources/fullcalendar/main.js" type="text/javascript"></script>
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript">

	document.addEventListener('DOMContentLoaded', function() {
		
			var calArr = [];			

			$.ajax({
				url : '/projectdetail/calendarList',
				type : 'get',
				dataType : 'json',
				contentType : "application/json"
			}).done(function(data, textStatus, xhr) {
				
				$(data).each(function(index, value) {
					calArr.push(value)
					console.log(value);
				});
				
				
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {

					initialView : 'dayGridMonth',
					contentHeight : 500,//캘린더 크기 설정
					editable : true,//수정 여부
					events : calArr
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
					<p>프로젝트 <i class="bi bi-tags"></i>
				</div>
				<div class="s-list-item ">
				    <input id="newbtn" type="button" value="새 일정 등록하기" onclick="self.location = '/projectdetail/registerCal';">
				</div><br>
				<div class="s-list-item ">
					<a href="/projectdetail/home/${pj_num}">프로젝트 홈</a>
				</div>
				<div class="s-list-item ">
					<a href="/projectdetail/calendar">캘린더</a>
				</div>
				<div class="s-list-item ">
					<a href="/projectdetail/taskboard">업무보드</a>
				</div>
				<div class="s-list-item ">
					<a href="/projectdetail/tasklist">업무리스트</a>
				</div>
				<br><br>
				<div class="s-list-item ">
					<a href="/project/main" style="color:gray"><i class="fa fa-thin fa-door-open"></i> 나가기</a>
				</div>

			</div>
<div class="wrap-box">
<div class="s-container">
			<br><br>
			<h5>${project.pj_name }</h5>
			<h2 id="c-title">캘린더</h2>
			<div class="contents_wrap">

	<div id='calendar'></div>
	</div>
	</div>
	</div>
	</div>
<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>