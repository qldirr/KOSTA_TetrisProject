<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- bbu-chat-room 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta name="description" content="Kakao Talk Clone Chat Page">
<meta name="robotos" content="noindex, nofollow">
<link rel="stylesheet" href="/resources/css/chat-room.css">
<link rel="stylesheet" href="/resources/css/general.css">
<link rel="stylesheet" href="/resources/fontello/css/fontello.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap">
        
        
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

</head>
<body>
	
	<!-- bbu-chat-room 적용 -->
	<div id="chat-body">
				<!-- 방번호, 사용자 정보 -->
				<input type="hidden" id="roomId" value="${cr_id}">
				<input type="hidden" id="roomTitle" value="${cr_title}">
				<div><h4><sec:authentication property="principal" var="principal"/></h4></div>
            <!-- 알림, 메뉴 기능 -->
            <div class="main-menu">
                <i class="icon-bell" title="알림"></i>
                <i class="icon-ellipsis" title="메뉴"></i>
            </div>
            <!-- 프로필 사진, 프로필명 -->
            <header>
                <img class="profile-img" src="/resources/pic/default.png">
                <div class="profile-col">
                    <span class="profile-name">${cr_title}</span>
                    <div class="sub-menu">
                        <i class="icon-box" title="채팅방 서랍"></i>
                        <i class="icon-search" title="검색"></i>
                    </div>
                </div>
            </header>
            <main>
                <!-- 고정된 공지사항 영역 -->
                <!-- <div class="notice-bar">
                    <i class="icon-bullhorn"></i>
                    <span>멘트를 고정해놓는 곳입니다.</span>
                    <i class="icon-down-open-big"></i>
                </div> -->
                <!-- 채팅 내용 시작 -->
                <div class="chat-content">
                    <!-- 메시지 시작 날짜 -->
                    <!-- <div class="date-line">
                        <time datetime="2021-03-29">2021년 3월 29일 월요일</time>
                    </div> -->
                    <!-- 채팅 내용 -->
                    <div class="main-chat">
                        <!-- <div class="friend-chat">
                            <img class="profile-img" src="/resources/pic/default.png">
                            <div class="friend-chat-col">
                                <span class="profile-name"></span>
                                <span class="balloon"></span>
                            </div>
                            <time>오전 7:30</time>
                        </div>
                        <div class="me-chat">
                            <div class="me-chat-col">
                                <span class="balloon"></span>
                            </div>
                            <time>오전 7:32</time>
                        </div> -->
                    </div>
                </div>
                <!-- 채팅 입력창 -->
                <div class="insert-content">
                    <form name="chatform" action="#" method="post">
                        <textarea name="chat-insert" id="message" onkeypress="javascript: if(event.keyCode==13) return false;" onkeyup="javascript: limitMemo(this, 10);" required></textarea>
                        <input type="submit" class="chat-submit" id="sendBtn" value="전송">
                    </form>
                    <!-- 채팅 입력 관련 기능(파일 첨부, 캡쳐 등) -->
                    <div class="insert-menu">
                        <!-- <i class="icon-smile"></i> -->
                        <label className="input-file-button" for="file">
                        	<i class="icon-attach-1" style='cursor:pointer;'></i>
                        </label>
                    </div>
                </div>
            </main>
        </div>
    <!-- 파일 업로드 버튼 -->
    <div class='uploadDiv'>
		<input type='file' id="file" name='uploadFile' style="display:none;" multiple />
	</div>
	
</body>
<script type="text/javascript">

	var roomId = $("#roomId").val();
	var webSocke = new SockJS("http://localhost:8081/chatting/" + roomId);
    var stomp = Stomp.over(webSocket);
	/*webSocket.onopen = onOpen;
	webSocket.onmessage = onMessage;
	webSocket.onclose = onClose;*/
	
	$(document).ready(function(){
		
		$("#sendBtn").on('click', function() {
			sendMessage();
			$('#message').val('')
		});
	
		$('#message').on('keydown', function(){
			if(event.keyCode == '13'){
				sendMessage();
				$('#message').val('')
			}
		});
	
		$("#file").on('change', function (){
			sendFile();
		});
	
	});
	
	//웹소켓 접속
	function onOpen(){
		//ajax로 cr_id 전송 => 해당 cr_id에 해당하는 채팅내용 가져와서 뿌려줌
		$.ajax({
			url: '/messanger/getListMsg',
			type: 'post',
			contentType: 'application/json; charset:UTF-8',
			async: false,
			data: JSON.stringify({
				"cr_id" : roomId
			}),
			success : function(result){
				var e_id = '${principal.username}';
				var chatContents = JSON.parse(result);
				for(var i=0;i<chatContents.length;i++){
					var str = "";
					var date = new Date(chatContents[i].cc_regdate).toLocaleString();
					var time = date.slice(14, -3);
					
					if(chatContents[i].e_id == e_id){
						if(chatContents[i].cc_file == "false"){
							str += '<div class="me-chat">' + '<div class="me-chat-col">' + '<span class="balloon">'
	        					+ chatContents[i].cc_contents + '</span>' + '</div>'
	    	    				+ '<time>' + time + '</time>' + '</div>';
						}else{
							if(!chatContents[i].cc_image){
								var fileCallPath =  encodeURIComponent(chatContents[i].cc_path + "/" + chatContents[i].cc_uuid + "_" + chatContents[i].cc_contents);

								str += '<div class="me-chat">' + '<div class="me-chat-col">' + '<span class="balloon">'
									+ '<a href="download?fileName=' + fileCallPath + '">' + '<img src="/resources/img/attachfile.png">' + '</a>' + '</span>' + '</div>'
									+ '<time>' + time + '</time>' + '</div>';
							}else{
								var fileCallPath =  encodeURIComponent(chatContents[i].cc_path + "/" + chatContents[i].cc_uuid + "_" + chatContents[i].cc_contents);
								
								str += '<div class="me-chat">' + '<div class="me-chat-col">' + '<span class="balloon">'
									+ '<a href="download?fileName=' + fileCallPath + '">' + '<img src="display?fileName=' + fileCallPath + '" width="200"></a>' + '</span>' + '</div>'
									+ '<time>' + time + '</time>' + '</div>';
								}
						}
						$(".main-chat").append(str);
					}else{
						if(chatContents[i].cc_file == "false"){
							str += '<div class="friend-chat">' + '<img class="profile-img" src="/resources/pic/default.png">'
        						+ '<div class="friend-chat-col">' + '<span class="profile-name">' + chatContents[i].userVO.e_name + '</span>'
        						+ '<span class="balloon">' + chatContents[i].cc_contents + '</span>' + '</div>'
        						+ '<time>' + time + '</time>' + '</div>';
						}else{
							console.log(chatContents[i]);
							if(!chatContents[i].cc_image){
								var fileCallPath =  encodeURIComponent(chatContents[i].cc_path + "/" + chatContents[i].cc_uuid + "_" + chatContents[i].cc_contents);

								str += '<div class="friend-chat">' + '<img class="profile-img" src="/resources/pic/default.png">' 
									+ '<div class="friend-chat-col">' + '<span class="profile-name">' + chatContents[i].userVO.e_name + '</span>' + '<span class="balloon">'
									+ '<a href="download?fileName=' + fileCallPath + '">' + '<img src="/resources/img/attachfile.png">' + '</a>' + '</span>' + '</div>'
									+ '<time>' + time + '</time>' + '</div>';
								}else{
									var fileCallPath =  encodeURIComponent(chatContents[i].cc_path + "/" + chatContents[i].cc_uuid + "_" + chatContents[i].cc_contents);
								
									str += '<div class="friend-chat">' + '<img class="profile-img" src="/resources/pic/default.png">' 
										+ '<div class="friend-chat-col">'+ '<span class="profile-name">' + chatContents[i].userVO.e_name + '</span>' + '<span class="balloon">'
										+ '<a href="download?fileName=' + fileCallPath + '">' + '<img src="display?fileName=' + fileCallPath + '" width="200"></a>' + '</span>' + '</div>'
										+ '<time>' + time + '</time>' + '</div>';
								}
						}
						$(".main-chat").append(str);
					}
				}
			}
		});
	}

	// 메시지 전송
	function sendMessage() {
		var e_id = '${principal.username}';
		var e_name = '${principal.user.e_name}';
		var date = new Date();
		var time = date.toLocaleString();
		
		$.ajax({
			url: '/messanger/registerMsg',
			type: 'post',
			contentType: 'application/json; charset:UTF-8',
			async: false,
			data: JSON.stringify({
				"cr_id" : roomId,
				"e_id" : e_id,
				"cc_contents" : $("#message").val(),
				"cc_regdate" : time,
				"cc_sender" : e_name
			}),
			success : function(result){
				webSocket.send(result);
				var chatContents = JSON.parse(result);
				
				var str = '<div class="me-chat">' + '<div class="me-chat-col">' + '<span class="balloon">'
    				+ chatContents.cc_contents + '</span>' + '</div>'
    				+ '<time>' + chatContents.cc_regdate.slice(14, -3) + '</time>' + '</div>';
	
				$(".main-chat").append(str);
			}
		});
	}
	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		
		var data = msg.data;
		msgData = JSON.parse(data);
		
		var str = "";
		if(msgData.cc_file == "true"){
			if(!msgData.cc_image){
				var fileCallPath =  encodeURIComponent(msgData.cc_path + "/" + msgData.cc_uuid + "_" + msgData.cc_contents);

				str += '<div class="friend-chat">' + '<img class="profile-img" src="/resources/pic/default.png">' 
					+ '<div class="friend-chat-col">' + '<span class="profile-name">' + msgData.cc_sender + '</span>' + '<span class="balloon">'
					+ '<a href="download?fileName=' + fileCallPath + '">' + '<img src="/resources/img/attachfile.png">' + '</a>' + '</span>' + '</div>'
					+ '<time>' + msgData.cc_regdate.slice(14, -3) + '</time>' + '</div>';
				}else{
					var fileCallPath =  encodeURIComponent(msgData.cc_path + "/" + msgData.cc_uuid + "_" + msgData.cc_contents);
				
					str += '<div class="friend-chat">' + '<img class="profile-img" src="/resources/pic/default.png">' 
						+ '<div class="friend-chat-col">' + '<span class="profile-name">' + msgData.cc_sender + '</span>' + '<span class="balloon">'
						+ '<a href="download?fileName=' + fileCallPath + '">' + '<img src="display?fileName=' + fileCallPath + '" width="200"></a>' + '</span>' + '</div>'
						+ '<time>' + msgData.cc_regdate.slice(14, -3) + '</time>' + '</div>';
				}
			$(".main-chat").append(str);
		}else{
			str += '<div class="friend-chat">' + '<img class="profile-img" src="/resources/pic/default.png">'
				+ '<div class="friend-chat-col">' + '<span class="profile-name">' + msgData.cc_sender + '</span>'
				+ '<span class="balloon">' + msgData.cc_contents + '</span>' + '</div>'
				+ '<time>' + msgData.cc_regdate.slice(14, -3) + '</time>' + '</div>';

			$(".main-chat").append(str);
		}
		
		new Notification(msgData.cc_sender, {body: msgData.cc_contents, icon:"/resources/img/TETRIS.jpg"});
	}
	
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$(".main-chat").append("연결 끊김");
	}
	
	//파일 전송
	function sendFile(){
		var e_id = '${principal.username}';
		var e_name = '${principal.user.e_name}';
		var regex = new RegExp("(.*?)\.(exe)$");
		var maxSize = 41943040; //40MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
			
		for (var i = 0; i < files.length; i++) {
			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);
			formData.append("cr_id", roomId);
			formData.append("cc_sender", e_name);
		}
		 
		$.ajax({
			url: '/messanger/upload',
			processData: false,
			contentType: false,
			data: formData,
			type: 'post',
			dataType: 'json',
			success: function(result){
				var date = new Date();
				var time = date.toLocaleString();
				var data = {
					"type" : "file",
					"e_id" : e_id,
					"cr_id" : roomId,
					"cc_uuid" : result[0].cc_uuid,
					"cc_contents" : result[0].cc_contents,
					"cc_size" : result[0].cc_size,
					"cc_regdate" : time,
					"cc_image" : result[0].cc_image,
					"cc_path" : result[0].cc_path,
					"cc_file" : result[0].cc_file,
					"cc_sender" : e_name
				}
				webSocket.send(JSON.stringify(data));
				showUploadedFile(result);	 		
				}
			});
		};
		
		var uploadResult = $(".main-chat");
		 
		function showUploadedFile(uploadResultArr){
			var str = "";
			$(uploadResultArr).each(function(i, obj){
				var date = new Date();
				var time = date.toLocaleString();
				
				if(!obj.cc_image){
					var fileCallPath =  encodeURIComponent(obj.cc_path + "/" + obj.cc_uuid + "_" + obj.cc_contents);

					str += '<div class="me-chat">' + '<div class="me-chat-col">' + '<span class="balloon">'
						+ '<a href="download?fileName=' + fileCallPath + '">' + '<img src="/resources/img/attachfile.png">' + '</a>' + '</span>' + '</div>'
						+ '<time>' + time.slice(14, -3) + '</time>' + '</div>';
					}else{
						var thumbCallPath =  encodeURIComponent(obj.cc_path + "/s_" + obj.cc_uuid + "_" + obj.cc_contents);
						var fileCallPath =  encodeURIComponent(obj.cc_path + "/" + obj.cc_uuid + "_" + obj.cc_contents);
				
						str += '<div class="me-chat">' + '<div class="me-chat-col">' + '<span class="balloon">'
							+ '<a href="download?fileName=' + fileCallPath + '">' + '<img src="display?fileName=' + fileCallPath + '" width="200"></a>' + '</span>' + '</div>'
							+ '<time>' + time.slice(14, -3) + '</time>' + '</div>';
					}
			});
				uploadResult.append(str);
			}
		
</script>
</html>