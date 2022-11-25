<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TetrisGroupware</title>

<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/vender/res/bootstrap-datepicker3.css"
	rel="stylesheet">
<link href="/resources/vender/res/jquery.timepicker.min.css"
	rel="stylesheet">
<link href="/resources/css/res.css" rel="stylesheet">


<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/vender/res/bootstrap-datepicker.js"></script>
<script src="/resources/vender/res/jquery.timepicker.min.js"></script>

<script type="text/javascript">
	$(function() {
		//회의실등록
		$("#enroll").click(function() {
			if (confirm("등록하시겠습니까?")) {
				chkReq();
			}
			return false;
		})

	});
	//등록 필수 값 체크
	function chkReq() {
		if ($("#mr_num").val() == null || $("#mr_num").val() == "") {
			alert("회의실 번호를 입력해주세요.");
			$("#mr_num").focus();
			return false;
		}

		if ($("#mr_name").val() == null || $("#mr_name").val() == "") {
			alert("회의실 이름을 입력해주세요.");
			$("#ca_type").focus();
			return false;
		}

		if ($("#mr_total").val() == null || $("#mr_total").val() == "") {
			alert("수용 인원 수를 입력해주세요.");
			$("#ca_model").focus();
			return false;
		}

		var mode = $("#mode").val();
		if ("write" == mode) {
			$('#registerroomeform').attr("action", "/meetingroom/registerroom")
			$("#registerroomeform").submit()

		}

	}
</script>
</head>
<body>
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<!-- 보조메뉴바 시작 -->
	<div class="s-menu">
		<div class="s-menu-title">
			<p>
				예약 <i class="bi bi-tags"></i>
				<!-- 메인 메뉴바랑 동일한 i테그 넣음 -->
		</div>
		<div class="s-list-item ">
			<a href="/meetingroom/listroom">회의실 관리</a>
		</div>
		<div class="s-list-item ">
			<a href="/reservation/listcar">차량관리</a>
		</div>
		<div class="s-list-item ">
			<a href="/reservation/listrescar">차량예약 관리</a>
		</div>

	</div>
	<!-- 보조메뉴바 끝 -->

	<!-- 내용 시작 -->
	<div class="s-container">
		<h2 id="c-title">회의실 등록</h2>


		<div class="contents_wrap">
			<div class="contents">
				<form action="/meetingroom/registerroom" method="post"
					id="registerroomeform">
					<input type="hidden" name="mode" id="mode" value="write" />


					<div class="form-group">
						<label for="mr_num">회의실번호</label> <input type="text" name="mr_num"
							class="form-control" id="mr_num">
					</div>
					<div class="form-group">
						<label for="mr_name">회의실이름</label> <input type="text"
							name="mr_name" class="form-control" id="mr_name">
					</div>
					<div class="form-group">

						<label for="mr_total">수용인원</label> <input type="text"
							name="mr_total" class="form-control" id="mr_total">
					</div>

			</form>
			<div class="btn">
				<input type="button" class="list_Btn" id="listBtn" value="목록"
					onclick="location.href = '/meetingroom/listroom'" /> <input
					type="button" class="write_Btn" value="등록" id="enroll" />

			</div>
		</div>
	</div>
	</div>
</body>
</html>