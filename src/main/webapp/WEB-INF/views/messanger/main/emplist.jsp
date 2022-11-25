<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- friend 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta name="description" content="Kakao Talk Clone Friend List Page">
<meta name="keywords" content="KakaoTalk, Clone, Friend">
<meta name="robotos" content="noindex, nofollow">
<link rel="stylesheet" href="/resources/css/main-layout.css">
<link rel="stylesheet" href="/resources/css/friend.css">
<link rel="stylesheet" href="/resources/css/general.css">
<link rel="stylesheet" href="/resources/fontello/css/fontello.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
        
        
<link rel="stylesheet" href="/resources/tree/css/jquery.treeview.css" />
<link rel="stylesheet" href="/resources/tree/css/screen.css" />

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="/resources/tree/lib/jquery.treeview.js" type="text/javascript"></script>
<script src="/resources/tree/lib/jquery.cookie.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		/* 사원 이름을 더블클릭하여 empId 전송 => 채팅방 생성 */
		$("#empname li").on('dblclick', function(){
			var empId = $(this).attr('class');
			var actionForm = $("#actionForm")
			
			var str = "";
			str += '<input type="hidden" name="e_id" value=';
			str += empId;
			str += '>';
			actionForm.html(str);
			
			actionForm.attr("action", "/messanger/register").attr("method", "post")
					.attr("target", "Tetris Chatting")
					.attr("onsubmit", "window.open('', 'Tetris Chatting', 'width=450, height=600, left=2000, top=500, location=no, status=no, scrollbars=yes');");
			actionForm.submit();
			location.reload(true);
		});
		
		$("#chattingMemberRegBtn").on("click", function() {
			window.open("/messanger/member", "_blank", "width=450, height=600");
        });
		
	})
	
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
				<div><sec:authentication property="principal" var="principal"/></div>
            <!-- 헤더: 제목, 친구 찾기 버튼, 친구 추가 버튼 -->
            <header>
                <h1>조직도</h1>
                <span alt="대화하기버튼" title="대화하기" id="chattingMemberRegBtn"><i class="icon-chat-1" style="cursor: pointer"></i></span>
                <span alt="통합검색버튼" title="통합검색"><i class="icon-search" title="검색"></i></span>
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
                </div>
                <div class="sub-menu">
                    
                </div>
            </nav>
            <!-- 메인: 친구창 메인 내용 -->
            <main>
                <!-- 나의 프로필 -->
                <div>
                    <ul>
                        <li>
                            <img src="/resources/pic/me.png">
                            <div class="profile">
                                <p><c:out value="${principal.user.e_name }"/></p>
                                <!-- <p>상태메시지 영역</p> -->
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- 즐겨찾기 프로필 모음-->
                <!-- <div>
                    <div class="profile-title">
                        <h2>즐겨찾기</h2>
                    </div>
                    <ul>
                        <li>
                            <img src="/resources/pic/friend1.png" alt="친구1프로필사진">
                            <div class="profile">
                                <p>친구1</p>
                                <p></p>
                            </div>
                        </li>
                    </ul>
                </div> -->
                <!-- 친구 프로필 모음 -->
                <div>
                	<form action="/messanger/register" id="actionForm" method="post">
                		<c:forEach items="${listDept }" var="dept">
                			<div class="profile-title">
                        		<h2>${dept.d_name }</h2>
                        		<p>3</p>
                    		</div>
                    		<ul id="empname">
                    			<c:forEach items="${listEmp}" var="emp">
                    				<c:if test="${dept.d_num eq emp.d_num }">
                        				<li class="${emp.e_id }">
                            				<img src="/resources/pic/default.png">
                            				<div class="profile">
												<p>${emp.e_name }</p>
                                				<!-- <p>Tetris 화이팅</p> -->
                            				</div>
                        				</li>	
                        			</c:if>
                        		</c:forEach>
                    		</ul>
						</c:forEach>
					</form>
				</div>
            </main>
		</div>
</body>
</html>