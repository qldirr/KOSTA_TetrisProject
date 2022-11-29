<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="/webjars/stomp-websocket/2.3.3/stomp.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>

</head>
<body>
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
                <textarea name="chat-insert" id="message" onkeypress="javascript: if(event.keyCode==13) return false;"
                          onkeyup="javascript: limitMemo(this, 10);" required></textarea>
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
    <input type='file' id="file" name='uploadFile' style="display:none;" multiple/>
</div>
<script>
    $(document).ready(function(){
      var websocket = new SockJS("http://localhost:8081/chatting/" + roomId);
      var stomp = Stomp.over(websocket);
      stomp.connect({}, function(){
        console.log("STOMP Connection")

        stomp.subscribe("/sub/chatting/" + roomId, function(data){
          var message = JSON.parse(data.body);
          var sender = message.cc_sender
          var str = '';

          str += '<div class="friend-chat">' + '<img class="profile-img" src="/resources/pic/default.png">'
                  + '<div class="friend-chat-col">' + '<span class="profile-name">' + sender + '</span>'
                  + '<span class="balloon">' + message.cc_contents + '</span>' + '</div>'
                  + '<time>' + message.cc_regdate.slice(14, -3) + '</time>' + '</div>';
        });
        stomp.send('/pub/chatting/enter', {}, JSON.stringify({roomId: roomId, sender: "김길동"}))
      });
      $("#sendBtn").on('click', function() {
        var message = $('#message').val();
        stomp.send("/pub/chatting/", {}, JSON.stringify({roomId: roomId, message: message}));
        $('#message').val('');
        var str = '<div class="me-chat">' + '<div class="me-chat-col">' + '<span class="balloon">'
                + message + '</span>' + '</div>'
                + '<time>' + /*chatContents.cc_regdate.slice(14, -3)*/ + '</time>' + '</div>';

        $(".main-chat").append(str)
      });
    });
</script>
</body>
</html>
