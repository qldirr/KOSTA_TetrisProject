<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TETRIS Groupware</title>

<link href="/resources/vender/bootstrap/css/bootstrap-datepicker3.css"
	rel="stylesheet">
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap-datepicker.js" type="text/javascript" defer></script>
<script>
	$(document)
			.ready(
					function() {

						//출퇴근버튼 활성화
						var currentDate = new Date();
						var currentHours = addZeros(currentDate.getHours(), 2);
						var currentMinute = addZeros(currentDate.getMinutes(),
								2);
						var currentSeconds = addZeros(currentDate.getSeconds(),
								2);
						var now_date = currentDate.getFullYear() + "-"
								+ (currentDate.getMonth() + 1) + "-"
								+ currentDate.getDate() + " " + currentHours
								+ ":" + currentMinute + ":" + currentSeconds;

						var today = $('#timecheck').val();

						var lateCheck = '09:00:00';
						var checkTime = today;//출근시간확인

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

						$('#datePicker').datepicker({
							format : "yyyy-mm-dd", //달력에서 클릭시 표시할 값 형식
							autoclose : true
						});

						$('#click-btn').on('click', function() {
							var date = $('#dateRangePicker').val();
							alert(date);
						});

						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ "번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {

							self.location = "/attendance/getAll";
						});

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {
									e.preventDefault();
									console.log('click');
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='e_id' value'"
															+ $(this).attr(
																	"href")
															+ "'>'");
											actionForm.attr("action",
													"/attendance/personal");
											actionForm.submit();
										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on("click", function(e) {

							searchForm.find("input[name='pageNum']").val("1");
							e.preventDefault();

							searchForm.submit();
						});

						if (checkTime > lateCheck) {
							$('[id^=lateChecking]').css("color", "red");
						}
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
	<div class="wrap">
		<!-- jsp 인클루드 사용-->
		<jsp:include page="../includes/header.jsp"></jsp:include>

		<div class="wrap-box">
			<!-- 보조사이드바 -->
			<div class="s-menu">
				<div class="s-menu-title">
					<p>전사 근태페이지</p>
					<i class="fa-solid fa-pen-to-square fa-lg"></i>
				</div>
				<div class="s-list-item text-center">
					<div id="date"></div>
					<div
						style="width: 200px; height: 80px; line-height: 80px; color: #666; font-size: 40px; text-align: center;"
						id="clock"></div>
				</div>
				<!-- <div class="s-list-item ">
					<a href=""></a>
				</div> -->
				<div class="s-list-item ">
					<a href="">전사연차연황</a>
				</div>
			</div>
			<!-- 보조사이드바 끝-->

			<!-- 내용 시작 -->
			<div class="s-container">

				<h2 id="c-title">근태리스트</h2>
				<div class="container2 mt-3">

					<form id='searchForm' action="/attendance/personAll" method="get">
						<div class="form-row">
							<!-- 부서선택 -->
							<div class="form-group col-md-3">
								<h6>부서</h6>
								<input type="hidden" name="type" value="NDE"> <select
									class="form-control w-60 mx-2" name="search_dnum">
									<option>전체부서</option>
									<option value='01'>개발부</option>
									<option value='02'>기획부</option>
									<option value='03'>영업부</option>
								</select>
							</div>


							<!-- 선택일자 -->
							<div class="form-group col-md-4">
								<h6>일자선택</h6>
								<input type="text" id="datePicker" name="seacrh_date">
							</div>

							<div class="form-group col-md-3">
								<!-- 사원이름검색 -->
								<h6>이름</h6>
								<input type="text" name='keyword'
									value='<c:out value="${pageMaker.cri.e_name}"/>' /> <input
									type="hidden" name="pageNum"
									value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
									type="hidden" name="amount"
									value='<c:out value="${pageMaker.cri.amount}"/>' />
							</div>

							<div class="form-group col-md-2">
								<button class="btn btn-primary mx-2">검색</button>
							</div>
						</div>
					</form>
				</div>
				<!-- container끝 -->
				<!-- 검색폼끝 -->

				<!-- 출력테이블 -->
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">일자</th>
							<th style="background-color: #eeeeee; text-align: center;">사원번호</th>
							<th style="background-color: #eeeeee; text-align: center;">이름</th>
							<th style="background-color: #eeeeee; text-align: center;">부서</th>
							<th style="background-color: #eeeeee; text-align: center;">출근시간</th>
							<th style="background-color: #eeeeee; text-align: center;">퇴근시간</th>
							<th style="background-color: #eeeeee; text-align: center;">근무상태</th>
							<th style="background-color: #eeeeee; text-align: center;">비고</th>
						</tr>
					</thead>
					<!-- 부서리스트 받아오기 -->
					<tbody>
						<c:forEach items="${list}" var="hr">
							<tr>


								<td><fmt:formatDate value="${hr.hr_date }"
										pattern="yyyy-MM-dd" /></td>
								<td><c:out value="" />${hr.e_num }</td>
								<td><a class='move'
									href='/attendance/personal?e_id=<c:out value="${hr.e_id}"/>'>
										<c:out value="${hr.e_name}" />
								</a></td>
								<td><c:out value="" />${hr.d_name}</td>
								<!-- 출근시간 -->
								<td id="lateChecking"><fmt:formatDate
										value="${hr.hr_date }" pattern="HH:mm:ss" /></td>
								<!-- 퇴근시간 -->
								<td><fmt:formatDate value="${hr.hr_leave }"
										pattern="HH:mm:ss" /></td>
								<td><c:out value="${hr.hr_status }" /></td>
								<td><c:out value="${hr.hr_note }" /></td>
							</tr>
							<input type="hidden" id="timecheck"
								value="<fmt:formatDate value="${hr.hr_date}" pattern="HH:mm:ss" />">
						</c:forEach>
					</tbody>
				</table>

				<!-- 페이징 -->
				<nav aria-label="page">
					<div class="pull-right">
						<ul class="pagination">

							<c:if test="${pageMaker.prev }">
								<li class="page-item paginate_button previous"><a
									href="${pageMaker.startPage -1 }" class="page-link">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage }"
								end="${pageMaker.endPage}">
								<li
									class="page-item paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }">
									<a href="${num }" class="page-link">${num }</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next }">
								<li class="page-item paginate_button next"><a
									href="${pageMaker.endPage +1 }" class="page-link">Next</a></li>
							</c:if>
						</ul>
					</div>
				</nav>
				<!-- end Pagination -->

				<form id='actionForm' action="/attendance/personAll" method='get'>
					<input type='hidden' name='pageNum'
						value='${pageMaker.cri.pageNum }'> <input type='hidden'
						name='amount' value='${pageMaker.cri.amount }'>

				</form>
			</div>

			<!-- 내용 끝 -->
		</div>
	</div>
	<!-- 전체 wrapper 끝 -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>

</html>


