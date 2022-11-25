<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="/resources/vender/bootstrap/css/bootstrap.min.css">
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
	type="text/javascript"></script>
	<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">

	var socket = null;
	
	$(document).ready(function(){
		connectWebSocket();
	})
	
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
		    $(".toast").toast({"animation": true, "autohide": false});
		    $('.toast').toast('show');
		}
		
		function onClose(){
			console.log("info: connection closed");
		}
		
		function onError(err){
			console.log("errors: " + err);
		}
		
	}

</script>

</head>
<body>
<div id="msgStack">

</div>
</body>
</html>