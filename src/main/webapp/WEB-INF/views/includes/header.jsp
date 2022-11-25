<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->

<!-- Bootstrap CSS -->
<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">


var socket = null;
var referrer = '';



var alarmService = (function(){
	
	
	function count(){
		
		  $.ajax({
				url : '/notification/count',
				type : 'get',
				dataType : 'json',
				contentType : "application/json"
			}).done(function(data, textStatus, xhr) {
		
				var count = "";
				count = data;
				
				if(count != 0){ 
					$('#btn-alarm').attr('data-content', count); 
				} 
			});
		
	}
	
	function getList(){
		
		  $.ajax({
				url : '/notification/list',
				type : 'get',
				dataType : 'json',
				contentType : "application/json"
			}).done(function(data, textStatus, xhr) {
		
				
				$.each(data, function(index, value){
					
	
					var alarmList = '<a href="#" class="list-group-item list-group-item-action">';
				    alarmList += '<div class="d-flex w-100 justify-content-between">';
				    alarmList += '<small><strong>' + value.al_type + '</strong></small></div>';
				    alarmList += '<small>' + value.al_contents + '</small></a>';
				    
				    $('#alarmList').append(alarmList);				    
					
					
				})
				
				
				var moreAlarms = '<a href="/notification/all/1" class="list-group-item list-group-item-action">';
			    moreAlarms += '<small>알림 더보기</small></a>';
			    
			    $('#alarmList').append(moreAlarms);
			    
			});
		
	}
	
	/* 로그인 성공시 실행되어야할 함수 */
	function elecAlarm(){
		$.ajax({
			url : '/elecauth/count',
			type : 'get',
			dataType : 'json',
			contentType : "application/json"
		}).done(function(data, textStatus, xhr){
		
			if(data != 0){
			var userId = '<sec:authentication property="principal.username"/>';
			var elecalarm = {
						
						e_id : userId,
						al_type : "결재",
						al_contents : "결재 예정인 문서가 " + data + "건 있습니다."
					}
					
					
					$.ajax({
						url : '/notification/register',
						type : 'post',
						data : JSON.stringify(elecalarm),
						contentType: 'application/json'
					}).done(function() {
						
						console.log("전송 완료");
						
						if(socket){
							var socketMsg = "docs," + userId + "," + "결재 예정인 문서가 " + data + "건 있습니다." + "," + '/elecauth/uncheckedList';
							
							console.log("msg: " + socketMsg);
							socket.send(socketMsg);
						}

						
					}) 
					
					console.log(data);

				
			}
			
		})
				
				
	}
	
	return {
		
		count : count,
		getList : getList,
		elecAlarm : elecAlarm
		
	}
	
	
})();

/* 읽지 않은 알람 개수를 가져오는 함수 */




function connectWebSocket(){
	
	console.log("소켓 실행");
	socket = new SockJS("http://localhost:8081/notification/");
	
	socket.onopen = onOpen;
	socket.onmessage = onMessage;
	socket.onclose = onClose;
	socket.onerror = onError;
	
	/* 웹소켓 접속 */
	function onOpen() {
		console.log("info: connection opened");
		alarmService.count();
		

		if(referrer.endsWith('customLogin')){
		
		alarmService.elecAlarm();
		
		}
		
	}
	
	
	function onMessage(msg) {
		var data = msg.data;
		console.log("receivedMessage: " + data + "\n");
		
		let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
	    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
	    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
	    toast += "<span aria-hidden='true'>&times;</span></button>";
	    toast += "</div> <div class='toast-body'>" + data + "</div></div>";
	    $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
	    $(".toast").toast({"animation": true, "autohide": false, "delay": 3000});
	    $('.toast').toast('show');
	    
	    alarmService.count();
	    
	}
	
	function onClose(){
		console.log("info: connection closed");
	}
	
	function onError(err){
		console.log("errors: " + err);
	}
	
};


$(document).ready(
		
	function() {
		
		referrer = document.referrer;
	
		
		connectWebSocket(); 
		
		
		$('#btn-alarm').on('click', function(){
			
			$('#alarmList').empty();
				
			alarmService.getList();
		
			$('#alarms').toggle();
			
			
		})
		

});
		
</script>



<title>TETRIS Groupware</title>
</head>

<body>

	<div class="wapper">

		<!-- main sidebar 시작-->
		<div class="sidebar">
			<div class="pb-3 bottom-border" style="text-align: center">
				<a id="brand" href="/"> <img id="brandlogo"
					src="/resources/img/TETRIS.jpg" width="180px"></a>

			</div>

			<div class="sidebar-item">
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a class="a" href="/attendance/personAll"><i class="bi bi-clock"></i> 근태관리</a>
				</sec:authorize>
				
			<sec:authorize access="hasRole('ROLE_USER')">
				<a class="a" href="/attendance/person"><i class="bi bi-clock"></i> 근태관리</a>
				</sec:authorize>
			</div>
			
			<div class="sidebar-item">
				<sec:authorize access="hasRole('ROLE_USER')">
				<a class="a" href="/calendar/list"><i class="bi bi-table"></i> 일정관리</a>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a class="a" href="/hr/list"><i class="bi bi-person-lines-fill"></i> 회원관리</a>
				</sec:authorize>
			</div>
			<div class="sidebar-item">
				<sec:authorize access="hasRole('ROLE_USER')">
					<a class="a" href="/meetingroom/resroomcal?mr_num=RS001"><i
						class="bi bi-tags"></i> 예약</a>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a class="a" href="/meetingroom/listroom"><i class="bi bi-tags"></i>
						예약</a>
				</sec:authorize>

			</div>
			<div class="sidebar-item">
				<a class="a" href="/project/main"><i class="bi bi-clipboard-data"></i> 프로젝트</a>
			</div>
			<div class="sidebar-item">
				<a class="a" href="/elecauth/main"><i class="bi bi-file-text"></i> 전자결재</a>
			</div>
			<div class="sidebar-item">
				<a class="a" href="/notice/list"><i class="bi bi-easel"></i>
					게시판</a>
			</div>
			<div class="sidebar-item">
				<a class="a" href="/organization/list"><i class="bi bi-diagram-3-fill"></i> 조직도</a>
			</div>

		</div>

		<!--  main sidebar 끝-->
		<!-- navbar 시작 -->

		<div class="nav-bar">
				<div class="nav-bar-right">
					<sec:authorize access="isAuthenticated()">
					<button id="btn-alarm">
						<span style="font-size: 30px;"><i class="bi bi-bell-fill"></i></span>

						   <div id="alarms" class="collapse">
                 				 <div id="alarmList" class="list-group">
                  			</div>
               </div>

					</button>
					<button id="btn-info">
						<img src="../resources/img/res/<sec:authentication property="principal.username" />.png" alt="사진"> 
						<span class="user"><sec:authentication property="principal.user.e_name" /></span>						
					</button>
	
					<a id="out_Btn" href="/member/customLogout">로그아웃</a>
		
						</sec:authorize>							
					<sec:authorize access="isAnonymous()">
					
				      <a id="log_Btn" href="/member/customLogin">로그인</a>
				
			</sec:authorize>
				</div>
				
		
			

		</div>

		<!-- navbar 끝 -->

	</div>
	<!-- wrapper 끝 -->
</body>

</html>