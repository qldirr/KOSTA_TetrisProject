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
		//차량등록
		$("#enroll").click(function() {
			if (confirm("등록하시겠습니까?")) {
				chkReq();
			}
			return false;
		})

	});
	//등록 필수 값 체크
	function chkReq() {
		if ($("#ca_num").val() == null || $("#ca_num").val() == "") {
			alert("차량번호를 입력해주세요.");
			$("#ca_num").focus();
			return false;
		}

		if ($("#ca_type").val() == null || $("#ca_type").val() == "") {
			alert("차량모델명을 입력해주세요.");
			$("#ca_type").focus();
			return false;
		}

		if ($("#ca_model").val() == null || $("#ca_model").val() == "") {
			alert("차종을 입력해주세요.");
			$("#ca_model").focus();
			return false;
		}

		if ($("#ca_age").val() == null || $("#ca_age").val() == "") {
			alert("연식을 입력해주세요.");
			$("#ca_age").focus();
			return false;
		}

		var mode = $("#mode").val();
		if ("write" == mode) {
			$('#registercareform').attr("action", "/reservation/registercar")
			$("#registercareform").submit()

		}

	}
</script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../includes/header.jsp"></jsp:include>
		<!-- 보조메뉴바 시작 -->
		<div class="s-menu">
			<div class="s-menu-title">
				<p>
					예약 <i class="bi bi-tags"></i>
					<!-- 메인 메뉴바랑 동일한 i테그 넣음 -->
			</div>
			<div class="s-list-item ">
				<a href="/meetingroom/listroom">회의실관리</a>
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

		<div class="wrap-box">
			<div class="s-container">
				<h2 id="c-title">차량 등록</h2>

				<div class="contents_wrap">
					<div class="contents">
						<form action="/reservation/registercar" method="post"
							id="registercareform">
							<input type="hidden" name="mode" id="mode" value="write" />


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="e_id">차량 번호</label> <input type="text"
										name="ca_num" class="form-control" id="ca_num">
								</div>
								<div class="form-group col-md-6">
									<label for="ca_model">차량 모델 명</label> <input type="text"
										name="ca_model" class="form-control" id="ca_model">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="ca_type">차종</label> <input type="text"
										name="ca_type" class="form-control" id="ca_type">
								</div>
								<div class="form-group col-md-6">
									<label for="ca_age">연식</label> <input type="text" name="ca_age"
										class="form-control" id="ca_age">
								</div>
							</div>


						</form>
						<div class="btn">
							<input type="button" class="list_Btn" id="listBtn" value="목록"
								onclick="location.href = '/reservation/listcar'" /> <input
								type="button" class="write_Btn" value="등록" id="enroll" />
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../includes/footer.jsp"></jsp:include>
</html>