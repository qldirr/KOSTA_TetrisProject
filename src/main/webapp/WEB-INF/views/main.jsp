<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인입니다.</title>
	<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
		  rel="stylesheet">
	<link href="/resources/css/home.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
	<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="https://kit.fontawesome.com/3c50ab6b24.js"></script>


<script type="text/javascript">
	//날씨 api - fontawesome 아이콘
	$(function() {

		var weatherIcon = {
			'01' : 'fas fa-sun',
			'02' : 'fas fa-cloud-sun',
			'03' : 'fas fa-cloud',
			'04' : 'fas fa-cloud-meatball',
			'09' : 'fas fa-cloud-sun-rain',
			'10' : 'fas fa-cloud-showers-heavy',
			'11' : 'fas fa-poo-storm',
			'13' : 'far fa-snowflake',
			'50' : 'fas fa-smog'
		};

		// 날씨 api - 서울
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="
				+ 'seoul' + "&appid=" + "56bff2528df80541a31119dee50abe0b";

		$
				.ajax({
					url : apiURI,
					dataType : "json",
					type : "GET",
					async : "false",
					success : function(resp) {
						console.log("ddd");

						var $Icon = (resp.weather[0].icon).substr(0, 2);
						var $weather_description = resp.weather[0].main;
						var $Temp = Math.floor(resp.main.temp - 273.15) + 'º';
						var $humidity = '습도&nbsp;&nbsp;&nbsp;&nbsp;'
								+ resp.main.humidity + ' %';
						var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;'
								+ resp.wind.speed + ' m/s';
						var $city = '서울';
						var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;'
								+ resp.clouds.all + "%";
						var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;'
								+ Math.floor(resp.main.temp_min - 273.15) + 'º';
						var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;'
								+ Math.floor(resp.main.temp_max - 273.15) + 'º';

						$('.weather_icon')
								.append(
										'<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 150px; width : 150px;"></i>');
						$('.weather_description').prepend($weather_description);
						$('.current_temp').prepend($Temp);
						$('.humidity').prepend($humidity);
						$('.wind').prepend($wind);
						$('.city').append($city);
						$('.cloud').append($cloud);
						$('.temp_min').append($temp_min);
						$('.temp_max').append($temp_max);
					}
				})

	})
	
	$(document).ready(
			function() {

				//출퇴근버튼 활성화
				var currentDate = new Date();
				var currentHours = addZeros(currentDate.getHours(), 2);
				var currentMinute = addZeros(currentDate.getMinutes(), 2);
				var currentSeconds = addZeros(currentDate.getSeconds(), 2);
				var now_date = currentDate.getFullYear() + "-"
						+ (currentDate.getMonth() + 1) + "-"
						+ currentDate.getDate() + " " + currentHours + ":"
						+ currentMinute + ":" + currentSeconds;

				//출근클릭
				$('#startD').click(function() {
					if (confirm('출근하시겠습니까?')) {
						alert('출근하셨습니다');
						//startTime.innerHTML = now_date;
						var e_id = getParam('e_id');
						//e_id = e_id.slice(3, -3);
						console.log(e_id);
						$.ajax({
							url : 'insertAction.do',
							type : 'POST',
							contentType : 'application/json',
							data : JSON.stringify({
								e_id : e_id
							}),
							success : function(result) {
								alert("출근성공");

							},
							error : function(result) {
								alert("출근실패 (관리자에게 문의해주세요)");
							}
						}); //$.ajax 
					}
				});

				var today = $('#timecheck').val();

				var lateCheck = '09:00:00';
				var checkTime = today;//출근시간확인

				if (checkTime > lateCheck) {
					$('[id^=startTime2]').css("color", "red");
				}

				//퇴근클릭
				$("#endD").on("click", function() {
					if (confirm('퇴근하시겠습니까?')) {
						alert('퇴근하셨습니다');
						//endTime.innerHTML = now_date;
						var e_id = getParam('e_id');
						//e_id = e_id.slice(3, -3);
						console.log(e_id);

						$.ajax({
							url : 'endAction.do',
							type : 'POST',
							contentType : 'application/json',
							data : JSON.stringify({
								e_id : e_id
							}),
							success : function(result) {
								alert("퇴근성공");
							},
							error : function(result) {
								alert("퇴근실패 (관리자에게 문의해주세요)");
							}
						}); //$.ajax 
					}
				});

				$("#outD").on("click", function() {
					if (confirm('외근하시겠습니까?')) {
						alert('안녕히다녀오세요');
						var e_id = getParam('e_id');
						console.log(e_id);

						$.ajax({
							url : 'outAction.do',
							type : 'POST',
							contentType : 'application/json',
							data : JSON.stringify({
								e_id : e_id
							})
						});
					}
				});
			});

	function getParameterByName(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
				.exec(location.search);
		return results == null ? "" : decodeURIComponent(results[1].replace(
				/\+/g, " "));
	}

	function getParam(sname) {
		var params = location.search.substr(location.search.indexOf("?") + 1);
		var sval = "";
		params = params.split("&");
		for (var i = 0; i < params.length; i++) {
			temp = params[i].split("=");
			if ([ temp[0] ] == sname) {
				sval = temp[1];
			}
		}
		return sval;
	}

	function printClock() {
		var clock = document.getElementById("clock"); // 출력할 장소 선택
		var currentDate = new Date(); // 현재시간
		var calendar = currentDate.getFullYear() + "-"
				+ (currentDate.getMonth() + 1) + "-" + currentDate.getDate() // 현재 날짜
		var currentHours = addZeros(currentDate.getHours(), 2);
		var currentMinute = addZeros(currentDate.getMinutes(), 2);
		var currentSeconds = addZeros(currentDate.getSeconds(), 2);
		clock.innerHTML = currentHours + ":" + currentMinute + ":"
				+ currentSeconds; //날짜를 출력해 줌
		//날짜 출력
		var date = document.getElementById("date");
		date.innerHTML = currentDate.getFullYear() + "년 "
				+ (currentDate.getMonth() + 1) + "월 " + currentDate.getDate()
				+ "일";
		setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
	}

	function addZeros(num, digit) { // 자릿수 맞춰주기
		var zero = '';
		num = num.toString();
		if (num.length < digit) {
			for (i = 0; i < digit - num.length; i++) {
				zero += '0';
			}
		}
		return zero + num;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>
</head>
<body onload="printClock()">
	<!-- jsp 인클루드 사용-->
	<!-- 메인내용 container시작 -->
	<h1></h1>
	<div class="wrap">

		<div class="wrap-box">
			<div class="container">

				<!-- main-left 시작 -->
				<div class="main-left">
					<!-- 사원정보 -->
					<div class="myProfile Box">
						<span class="m-title">MyProfile </span> <a href="/member/user?e_id=${userid}"> <img
							alt="사진" src="../resources/img/res/${userid}.png"></a>
						<div style="font-size: 18px;">${userName }</div>
						
						<div>
					<!--  -->
					<div id="date"></div>
					<div
						style="width: 200px; height: 80px; line-height: 80px; color: #666; font-size: 40px; text-align: center; margin-left: 25px;"
						id="clock"></div>
					<!-- <input id="newbtn" type="button" value="새 파일" onclick=""> -->
					<!-- 출근시간 -->
					<dl class="my-3 ">
						<dt>출근시간</dt>
						<dd id="startTime">
							<fmt:formatDate value="${hrVO.hr_date }"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</dd>
					</dl>
					<!-- 퇴근시간 -->
					<dl class="mb-3">
						<dt>퇴근시간</dt>
						<dd id="endTime">
							<fmt:formatDate value="${hrVO.hr_leave }"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</dd>
					</dl>
					<!-- 누적근무시간 -->
					<dl>
						<!-- <dt>누적근무시간</dt> -->
						<dd id=""></dd>
					</dl>
					<!-- 출퇴근버튼 -->
					<div class="my">
						<i id="startD" style="color: #151d66 ; background:white" class="fa-solid fa-circle-play fa-3x"></i> <i
									id="endD" style="color: #151d66 ; background:white" class="fa-solid fa-circle-stop fa-3x"></i> <i
									id="outD" style="color: #151d66 ; background:white" class="fa-solid fa-circle-pause fa-3x"></i>
					</div>
				</div>
					</div>

			
					<!-- 채팅링크박스 -->
					<a id="chat-a" href="http://localhost:8081/messanger/main" onclick="window.open(this.href, 'Tetris Messanger', 'width=450, height=600, left=2000, top=500, location=no, status=no, scrollbars=yes'); return false;">
					<div class="chat Box">
						<div class="i-title" style="margin: 20px 0px 0px 0px;">
							<i id="chat-i" class="fa-sharp fa-solid fa-comments fa-lg">
								Messenger</i>
						</div>
					</div>
					</a>
				</div>


				<!-- main center 시작 -->
				<div class="main-center">
					<div class="project Box">
						<a href="/project/main"><span class="m-title">프로젝트</span></a>
						<c:forEach items="${list }" var="myProject" begin="0" end="2" varStatus="status">
							<c:if test="${myProject.pj_type eq '협업'}">
								<div class="bs-callout bs-callout-info">
								<span class="badge badge-secondary">${myProject.pj_type }</span>
								<strong> ${myProject.pj_name } </strong>  ${myProject.pj_contents }  <a href="/projectdetail/home/${myProject.pj_num}"> <i class="fa-solid fa-arrow-right-to-bracket" style="color: #161E67"></i></a> 
									
						<div class="progress">
  							<div class="progress-bar" role="progressbar" style="width: ${myProject.pj_finishedTask}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">${myProject.pj_finishedTask} %</div>
						</div>
								</div>
							</c:if>	
									
							<c:if test="${myProject.pj_type eq '단일'}">
					
								<div class="bs-callout bs-callout-warning">
								<span class="badge badge-warning">${myProject.pj_type }</span>
								<strong> ${myProject.pj_name } </strong>  ${myProject.pj_contents }  <a href="/projectdetail/home/${myProject.pj_num}"> <i class="fa-solid fa-arrow-right-to-bracket" style="color: #161E67"></i></a>
								
									
						<div class="progress">
  							<div class="progress-bar" role="progressbar" style="width: ${myProject.pj_finishedTask}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">${myProject.pj_finishedTask} %</div>
						</div>
								
								</div>
							</c:if>		
							<c:if test="${myProject.pj_type eq '전사'}">
					
								<div class="bs-callout bs-callout-danger">
								<span class="badge badge-info">${myProject.pj_type }</span>
								<strong> ${myProject.pj_name } </strong>  ${myProject.pj_contents }  <a href="/projectdetail/home/${myProject.pj_num}"> <i class="fa-solid fa-arrow-right-to-bracket" style="color: #161E67"></i></a> 
									
						<div class="progress">
  							<div class="progress-bar" role="progressbar" style="width: ${myProject.pj_finishedTask}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">${myProject.pj_finishedTask} %</div>
						</div>
								</div>
							</c:if>	
						<!-- 프로젝트 참여자: 
						<c:forEach items="${myProject.pj_members }" var="member"><span class="badge badge-pill badge-light">${member.d_name }</span>${member.e_name } (${member.e_id }) </c:forEach><br>
							
							
						<div class="progress">
  							<div class="progress-bar" role="progressbar" style="width: ${myProject.pj_finishedTask}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">${myProject.pj_finishedTask} %</div>
						</div>-->
						</c:forEach>
					

				</div>


			<div class="elecAuth Box">
				<a href="/elecauth/main"><span class="m-title">전자결재</span></a>
				<div class="card-columns" style="text-align:center">
					<div id="cardone" class="card bg-light">
						<div class="card-header ">반려</div>
						<div class="card-body " style="height: 100px">
							<h5 class="card-title"><a href="elecauth/disapprovedList">${dis }<span style="font-size: 15px;">건</span></a></h5>
							<p class="card-text"></p>
						</div>
					</div>
						<div id="cardone" class="card text-white bg-dark">
						<!--  style="width: 50%; height: 30%; padding: 0px">-->
						<div class="card-header">결재진행</div>
						<div class="card-body" style="height: 100px">
							<h5 class="card-title"><a href="elecauth/writtenList">${proceed }<span style="font-size: 15px;">건</span></a></h5>
							<p class="card-text"></p>
						</div>
					</div>
						<div id="cardone" class="card text-white bg-info">
						<!--  style="width: 50%; height: 30%; padding: 0px">-->
						<div class="card-header ">결재대기</div>
						<div class="card-body " style="height: 100px">
							<h5 class="card-title"><a href="elecauth/uncheckedList">${uncheck }<span style="font-size: 15px;">건</span></a></h5>
							<p class="card-text"></p>
						</div>
					</div>
					
				







				</div>


			</div>
		</div>
		<!-- main center 끝 -->

		<!-- main-right 시작 -->
		<div class="main-right">
			<div class="suggest Box">
				<a href="/notice/list"><span class="m-title">공지사항</span></a>

				<table class="table table-hover"
					style="width: 90%; margin-left: auto; margin-right: auto;"
					id="list">
					<thead>
						<tr>
							<th width="15%">제목</th>
						</tr>
					</thead>

					<c:forEach items="${notlist}" var="notice" begin="0" end="2"
						varStatus="status">
						<tr>
							<td><a class='move'
								href='/notice/get?pageNum=1&amount=10&n_num=<c:out value="${notice.n_num}"/>'> <c:out
										value="${notice.n_title}" /></a></td>
										
						
						</tr>
					</c:forEach>
				</table>



			</div>
			<div class="free Box">
				<div style="float: left; margin: 0px 10px 0px 60px;">
					<div class="current_temp" style="font-size: 50pt"></div>
					<div class="weather_description" style="font-size: 20pt"></div>
					<div class="city" style="font-size: 13pt"></div>
				</div>
				<div style="float: right; margin: 0px -5px 30px -10px;">
					<div class="temp_min"></div>
					<div class="temp_max"></div>
					<div class="humidity"></div>
					<div class="wind"></div>
					<div class="cloud"></div>
				</div>
				<div
					style="float: left; height: 50px; width: 50px; margin: 10px 10px 30px 0px;">
					<div class="weather_icon"></div>
				</div>
				<br>
			</div>

		</div>
		<!-- main-rignt 끝 -->

	</div>
	</div>
	<!-- container 끝 -->
	</div>

	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>

</html>