<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
				
				$('#datePickerstart').datepicker({
					format: "yyyy-mm-dd",
					autoclose: true
				});
				
				$('#datePickerend').datepicker({
					format: "yyyy-mm-dd",
					autoclose: true
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
		<h2 id="c-title">새 프로젝트 업무</h2><br> 

            <div class="contents_wrap">

		<form action="/projectdetail/registerTask" method="post"
                     accept-charset="UTF-8">
				<input type="hidden" name="pj_num" value="${pj_num }">
                     <div class="form-group">
                        <label for="ts_name">업무명</label> <input type="text"
                           name="ts_name" class="form-control" id="ts_name">
                     </div>
                     <div class="form-group">
                        <label for="ts_name">업무내용</label> <input type="text"
                           name="ts_contents" class="form-control" id="ts_contents">
                     </div>
                      <div class="form-group">
                        <label for="ts_startdate">일정시작일</label><input
                           id="datePickerstart" type="text" class="form-control"
                           name="ts_startdate">
                     </div>
                      <div class="form-group">
                        <label for="ts_startdate">일정마감일</label><input
                           id="datePickerend" type="text" class="form-control"
                           name="ts_enddate">
                     </div>
                     <div class="form-group">
                        <label for="ts_type">업무상태</label> <select class="form-control"
                           name="ts_status" id="selectStatus">
                            <option value="예정">예정</option>
							<option value="진행">진행중</option>
							<option value="완료">완료</option>
                        </select>
                     </div>
                     <div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="ts_importance" id="inlineRadio1" value="상">
  						<label class="form-check-label" for="inlineRadio1">상</label>
					</div>
                     <div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="ts_importance" id="inlineRadio2" value="중">
  						<label class="form-check-label" for="inlineRadio2">중</label>
					</div>
                     <div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="ts_importance" id="inlineRadio3" value="하">
  						<label class="form-check-label" for="inlineRadio3">하</label>
					</div>
                    <div class="form-group">
                        <label for="ts_manager">업무담당자</label> <select class="form-control"
                           name="ts_manager">
                            <c:forEach items="${member }" var="m">
								<option value="${m.e_name}">[${m.d_name }] ${m.e_position } -  ${m.e_name }</option>			
							</c:forEach>
                        </select>
                     </div>
                     <input type="submit" value="새 업무 생성" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px; float: right; margin-right: 10px;">
                  </form>
</div>
</div>
</div>
</div>
<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>