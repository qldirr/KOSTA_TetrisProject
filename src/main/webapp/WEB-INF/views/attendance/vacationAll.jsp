<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>


<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/index.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="/resources/vender/bootstrap/css/bootstrap-datepicker3.css"
	rel="stylesheet">

<!-- js -->
<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="/resources/js/index.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap-datepicker.js"></script>



<title>TETRIS Groupware</title>
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

						if (checkTime > lateCheck) {
							$('[id^=lateChecking]').css("color", "red");
						}

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
						
						$("#searchForm button").on("click", function(e){
							
							searchForm.find("input[name='pageNum']").val("1");
							e.preventDefault();
							
							searchForm.submit();
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
	<div style="width: 100%; height: 1000;">

		<!-- content -->
		<div class="container-fluid">
			<div class="col-xl-10 col-lg-9 ">

				<div class="row">

					<!-- 좌측바부분 -->
					<div>
						<div>
							<div>
								<h3>개인연차사용조회</h3>
								<h5>어서오세요 admin님</h5>
								<ul>
									<li>근태입력</li>
									<li><a href="">근태설정</a></li>
									<li><a href="">전사연차연황</a></li>
								</ul>
							</div>
						</div>

						<!-- 현재시간/출석시간/퇴근시간 -->
						<div>
							<!--  -->
							<div id="date"></div>
							<div
								style="width: 200px; height: 80px; line-height: 80px; color: #666; font-size: 40px; text-align: center;"
								id="clock"></div>
						</div>
					</div>
					<!-- 좌측바부분의 끝 -->

					<!-- 상단부분 -->
					<div></div>

					<br> <br>
					<!-- 정보출력부분 -->
					<div>

						<!-- 테이블 -->
						<div>


							<!-- 리스트 검색폼 -->
							<div class="container mt-3">
								<div class="row">
									<div class="col-lg-12">
										
										<form id='searchForm' action="/attendance/personAll" method="get">
											<!-- 부서선택 -->
											<h6>부서선택</h6>
											<input type="hidden" name="type" value="NDE">
											<select class="form-control w-25 mx-2" name="search_dnum">
												<option>전체부서</option>
												<option value='01'>개발부</option>
												<option value='02'>기획부</option>
												<option value='03'>영업부</option>
											</select>
											<!-- 선택일자 -->
											<h6>일자선택</h6>
											<input type="text" id="datePicker" name="seacrh_date">
											<!-- 사원이름검색 -->
											<h6>이름검색</h6>
											<input type="text" name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
											<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
											<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'/>
											<button class="btn btn-default mx-2">검색</button>
										</form>
									</div>
								</div>
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
											<td><a class='move' href='<c:out value="${hr.e_id }"/>'>
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


							<div class="pull-right">
								<ul class="pagination">

									<c:if test="${pageMaker.prev }">
										<li class="paginate_button previous"><a
											href="${pageMaker.startPage -1 }">Previous</a></li>
									</c:if>

									<c:forEach var="num" begin="${pageMaker.startPage }"
										end="${pageMaker.endPage}">
										<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }">
											<a href="${num }">${num }</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next }">
										<li class="paginate_button next"><a
											href="${pageMaker.endPage +1 }">Next</a></li>
									</c:if>
								</ul>
							</div>
							<!-- end Pagination -->

							<form id='actionForm' action="/attendance/personAll" method='get'>
								<input type='hidden' name='pageNum'
									value='${pageMaker.cri.pageNum }'> <input type='hidden'
									name='amount' value='${pageMaker.cri.amount }'>

							</form>
						</div>
						<!-- 테이블 끝 -->

						<!-- <div>미출근자/휴가자
							<h7>미출근자/휴가자</h7>
							<table>
								<thead>
									<tr>
										<td>미출근자</td>
										<td>휴가자</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table> 
						</div><!-- 오늘 미출근자/휴가자끝 -->
					</div>

					<!-- 정보출력부분의 끝 -->

				</div>
			</div>
		</div>

	</div>


	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->


	<%@ include file="../includes/footer.jsp"%>
</body>

</html>
