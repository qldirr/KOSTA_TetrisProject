<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/vender/bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="/resources/css/jquery.timepicker.min.css" />
<script src="/resources/vender/jquery/jquery-3.6.1.min.js" type="text/javascript"></script>
<script src="/resources/lib/bootstrap-datepicker.js" type="text/javascript" defer></script>
<script src="/resources/lib/jquery.timepicker.min.js" type="text/javascript" defer></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				
				$('#dateStart').datepicker({
					format: "yyyy-mm-dd",
					autoclose: true
				});
				
				$('#dateEnd').datepicker({
					format: "yyyy-mm-dd",
					autoclose: true
				});
				
				$('#timepickerStart').timepicker({
		            timeFormat: 'HH:mm',
		            interval: 30,
		            startTime: '06:00',
		            dynamic: false,
		            dropdown: true,
		            scrollbar: true
		        });
				
				$('#timepickerEnd').timepicker({
		            timeFormat: 'HH:mm',
		            interval: 30,
		            startTime: '06:00',
		            dynamic: false,
		            dropdown: true,
		            scrollbar: true
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
					<p>프로젝트 <i class="bi bi-clipboard-data"></i>
				</div>
				<div class="s-list-item ">
				    <input id="newbtn" type="button" value="새 글쓰기" onclick="self.location = '/projectdetail/register';">
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
		<br>
		<h2 id="c-title">새 프로젝트 일정</h2><br> 

            <div class="contents_wrap">
	
	  		<form action="/projectdetail/registerCal" method="post"
                     accept-charset="UTF-8">
				<input type="hidden" name="pj_num" value="${pj_num }">
                     <div class="form-group">
                        <label for="pc_name">일정명</label> <input type="text"
                           name="pc_name" class="form-control" id="pc_name">
                     </div>
                      <div class="form-group">
                        <label for="pc_startdate">일정시작일</label><input
                           id="dateStart" type="text" class="form-control"
                           name="pc_startdate">
                     </div>
                      <div class="form-group">
                        <label for="pc_starttime">일정시작시간</label><input
                           id="timepickerStart" type="text" class="form-control"
                           name="pc_starttime">
                     </div>
                     
                     <div class="form-group">
                        <label for="pc_enddate">일정마감일</label><input
                           id="dateEnd" type="text" class="form-control"
                           name="pc_enddate">
                     </div>
                      <div class="form-group">
                        <label for="pc_endtime">일정시작시간</label><input
                           id="timepickerEnd" type="text" class="form-control"
                           name="pc_endtime">
                     </div>
                     <input type="submit" value="새 일정 생성" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px; float: right; margin-right: 10px;">
                  </form>
               </div>
	
	
</div>
</div>
</div>
<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>