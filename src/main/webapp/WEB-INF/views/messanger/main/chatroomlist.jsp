<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- chatting 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta name="description" content="Kakao Talk Clone Chat Main Page">
<meta name="keywords" content="KakaoTalk, Clone, Chat">
<meta name="robotos" content="noindex, nofollow">
<link rel="stylesheet" href="/resources/css/main-layout.css">
<link rel="stylesheet" href="/resources/css/chatting.css">
<link rel="stylesheet" href="/resources/css/general.css">
<link rel="stylesheet" href="/resources/fontello/css/fontello.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">


<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>

<script type="text/javascript">

	/* 방이름을 더블클릭 하여 cr_id 전송 => 채팅방 입장 */
	$(function() {
		$("#listChatRoom li").on('dblclick', function(){
			var cr_id = $(this).attr('class');
			var actionForm = $("#actionForm");

			var str = "";
			str += '<input type="hidden" name="cr_id" value=';
			str += cr_id;
			str += '>';
			actionForm.html(str);

			actionForm.attr("action", "/messanger/chatting").attr("method", "post")
					.attr("target", "Tetris Chatting")
					.attr("onsubmit", "window.open('', 'Tetris Chatting', 'width=450, height=600, left=2000, top=500, location=no, status=no, scrollbars=yes');");
			actionForm.submit();
			location.reload(true);
		})
	});

	/* 채팅방 나가기 */
	$(function(){
		$("#listChatRoom li #deleteChatRoom").on("click", function(e){
			e.preventDefault();
			var roomId = $(this).attr('class');
			$.ajax({
				url: '/messanger/deletechatpart',
				type: 'post',
				data: {
					cr_id : roomId
					},
				success: function(){
					alert("채팅방을 나가셨습니다.");
					window.location = "http://localhost:8081/messanger/main/chatroomlist";
				}
			})
		})
	});

	/* 즐겨찾기 */
	$(function(){
		$("#listChatRoom li #chatRoomFavor").on("click", function(e){
			e.preventDefault();
			var roomId = $(this).attr('class');
			$.ajax({
				url: '/messanger/updatecroomfavor',
				type: 'post',
				data: {
					cr_id : roomId
					},
				success: function(result){
					/* alert(result);
					var listCRoom = JSON.parse(result);
					alert(listCRoom);
					alert(listCRoom[0]);
					alert(listCRoom[0].chatPartVO.cp_isbookmark);
					for(var i=0;i<listCRoom.length;i++){
						if(listCRoom[i].chatPartVO.cp_isbookmark == "true"){
							var str = '<li class="' + listCRoom[i].cr_id + '">' + '<img src="/resources/pic/default.png" class="profile-img">
        						+ '<div class="talk">' + '<p class="friend-name">' + listCRoom[i].cr_title + '</p>' + '</div>'
        						+ '<div class="chat-status">' + '<a href="#" id="chatRoomFavor" class="' + listCRoom[i].cr_id + '">' + '<i class="icon-star-1"></i></a>'
        						+ '<a href="#" id="deleteChatRoom" class="' + listCRoom[i].cr_id + '">' + '<i class="icon-logout"></i></a>'
            					+ '</div>' + '</li>';

            				$('#favorite').append(str);
						}else{
							var str = '<li class="' + listCRoom[i].chatPartVO.cr_id + '">' + '<img src="/resources/pic/default.png" class="profile-img">
    							+ '<div class="talk">' + '<p class="friend-name">' + listCRoom[i].cr_title + '</p>' + '</div>'
    							+ '<div class="chat-status">' + '<a href="#" id="chatRoomFavor" class="' + listCRoom[i].cr_id + '">' + '<i class="icon-star"></i></a>'
    							+ '<a href="#" id="deleteChatRoom" class="' + listCRoom[i].cr_id + '">' + '<i class="icon-logout"></i></a>'
        						+ '</div>' + '</li>';

        					$('#list').append(str);
						}
					} */
					window.location = "http://localhost:8081/messanger/main/chatroomlist";
				}
			})
		})
	});

	/* Web Notification */
	function notify(){if(!("Notification" in window)){
			alert("데스크톱 알림을 지원하지 않는 브라우저입니다.");
		}
		Notification.requestPermission(function(result){
			if(result == 'denied'){
				Notification.requestPermission();
				alert("알림을 차단하셨습니다.\n브라우저의 사이트 설정에서 변경하실 수 있습니다.");
				return false;
			}
		});
	}
</script>

</head>
<body>

	<div id="content">
			<!-- 액션폼 -->
				<form action="/messanger/main/emplist" name="emplist" method='get'>
					<!-- <input type="submit" value="조직도"> -->
				</form><br>
				<form action="/messanger/main/chatroomlist" name="chatroomlist" method='get'>
					<!-- <input type="submit" value="채팅방"> -->
				</form><br>
            <!-- 헤더: 제목, 친구 찾기 버튼, 친구 추가 버튼 -->
            <header>
                <h1>채팅</h1>
                <i class="icon-down-dir"></i>
                <span alt="새로운채팅버튼" title="새로운 채팅">&#xe80a</span>
                <span alt="통합검색버튼" title="통합검색">&#xe801</span>
            </header>
            <!-- 친구창, 대화창, 설정창 등 이동 가능한 네비게이터 -->
            <nav>
                <div class="main-menu">
                    <a href="javascript:document.emplist.submit();">
                        <i class="icon-adult" alt="친구메뉴" title="친구"></i>
                    </a>
                    <a href="javascript:document.chatroomlist.submit();">
                        <i class="icon-chat" alt="채팅메뉴" title="채팅"></i>
                        <!-- <span class="alert-balloon" alt="알림수">3</span> -->
                    </a>
                    <a href="#" onclick="notify()">
                    	<i class="icon-bell" alt="알림버튼" title="알림"></i>
                    </a>
                    <!-- <a href="more_menu.html">
                        <i class="icon-ellipsis" alt="더보기버튼" title="더보기"></i>
                        <span class="alert-balloon" alt="알림수">N</span>
                    </a> -->
                </div>
            </nav>
            <!-- 메인: 채팅 리스트 화면 -->
            <main>
            	<form action="/messanger/chatting" id="actionForm" method="post">
                	<ul id="listChatRoom">
                	<div id="favorite">

                	</div>
                	<div id="list">

                	</div>
                		<c:forEach items="${listChatRoom }" var="list">

                			<c:choose>
                				<c:when test="${list.chatPartVO.cp_isbookmark eq true }">
                					<li class="${list.cr_id }">
                            			<img src="/resources/pic/default.png" class="profile-img">
                            			<div class="talk">
                                			<p class="friend-name">${list.cr_title }</p>
                                			<!-- <p class="chat-content">대리님! 회의 끝나시면 연락 부탁드립니다!</p> -->
                            			</div>
                            			<div class="chat-status">
                            				<a href="#" id="chatRoomFavor" class="${list.cr_id }"><i class="icon-star-1"></i></a>
                            				<a href="#" id="deleteChatRoom" class="${list.cr_id }"><i class="icon-logout"></i></a>
                                			<!-- <time datetime="10:15:00+09:00">오전 10:15</time> -->
                            			</div>
                    				</li>
                				</c:when>
                				<c:otherwise>
                					<li class="${list.cr_id }">
                            			<img src="/resources/pic/default.png" class="profile-img">
                            			<div class="talk">
                                			<p class="friend-name">${list.cr_title }</p>
                                			<!-- <p class="chat-content">대리님! 회의 끝나시면 연락 부탁드립니다!</p> -->
                            			</div>
                            			<div class="chat-status">
                            				<a href="#" id="chatRoomFavor" class="${list.cr_id }"><i class="icon-star"></i></a>
                            				<a href="#" id="deleteChatRoom" class="${list.cr_id }"><i class="icon-logout"></i></a>
                                			<!-- <time datetime="10:15:00+09:00">오전 10:15</time> -->
                            			</div>
                    				</li>
                				</c:otherwise>
                			</c:choose>
                    	</c:forEach>
                	</ul>
                </form>
            </main>
        </div>
</body>

</html>