<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script src="/resources/vender/res/bootstrap-datepicker.js"
	type="text/javascript" defer></script>
<script src="/resources/vender/res/jquery.timepicker.min.js"
	type="text/javascript" defer> ></script>

<script type="text/javascript">
	$(document).ready(

	function() {
		$('#datepickerstartday').datepicker({
			format : "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			startDate : 'd', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			endDate : '+30d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			daysOfWeekDisabled : [ 0, 6 ], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
			disableTouchKeyboard : false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			templates : {
				leftArrow : '&laquo;',
				rightArrow : '&raquo;'
			}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
			title : "예약일자", //캘린더 상단에 보여주는 타이틀
			todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false 
			toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			weekStart : 1,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
			language : "ko" //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.				

		});
		
        //예약일자 동일하게 지정하기.
		$("#datepickerstartday").keydown(function() {
			$('#datepickerendday').val($(this).val());
		});
		// 마지막에 입력 시 입력되게 한다.
		$("#datepickerstartday").change(function() {
			$('#datepickerendday').val($(this).val());
		});
		

		$('#timepicker').timepicker({

			timeFormat : 'HH:mm',
			interval : 120,
			minTime : '9:00Am',
			maxTime : '7:00pm',
			startTime : '09:00',
			dynamic : false,
			dropdown : true,
			scrollbar : true,

		});

		$('#timepicker2').timepicker({

			timeFormat : 'HH:mm',
			interval : 120,
			minTime : '11:00Am',
			maxTime : '9:00pm',
			startTime : '09:00',
			dynamic : false,
			dropdown : true,
			scrollbar : true,

		});

		$("#resroom").click(function() {
			chkresroom();

		})

	});

	function chkresroom() {

		// 입력받은 값들 유효성 검사: 시작
		var startday = $("input[name=rb_startday]").val() + " "
				+ $("input[name=rb_starttime]").val() + ":00";
		var endday = "";

		if ($("input#allday:checked").val()) {
			startday = $("input[name=rb_startday]").val() + " 00:00:00";
			endday = $("input[name=rb_startday]").val() + " 23:59:59";
		} else {
			endday = $("input[name=rb_endday]").val() + " "
					+ $("input[name=rb_endtime]").val() + ":00";
		}

		// true: 통과   false: 불통
		if (!(startday < endday && startday != endday)) {
			alert("올바른 일시를 선택해주세요.");
			return false;
		}
		
		//날짜중복
		if (!(startday < endday && startday != endday)) {
			alert("다른 예약날짜를 선택해주세요.");
			return false;
		}
		
		
		

		
		var mode = $("#mode").val();
		if ("write" == mode) {

			//alert('예약신청이 완료되었습니다. ')
			$('#registerrseroom')
					.attr("action", "/meetingroom/registerrseroom")
			$('#registerrseroom').submit()
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
				<a href="/meetingroom/resroomcal?mr_num=RS001">회의실(블록)예약</a>
			</div>
			<div class="s-list-item ">
				<a href="/meetingroom/resroomcal?mr_num=RS002">회의실(콤보)예약</a>
			</div>
			<div class="s-list-item ">
				<a href="/reservation/rescarmain">차량예약</a>
			</div>

		</div>
		<!-- 보조메뉴바 끝 -->

		<!-- 내용 시작 -->
		<div class="wrap-box">
			<div class="s-container">
				<h2 id="c-title">회의실예약</h2>

				<div class="contents">
					<form action="/meetingroom/registerrseroom" method="post"
						id="registerrseroom">
						<input type="hidden" name="mode" id="mode" value="write" />

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="e_id">예약자</label> <input type="text" name="e_id"
									class="form-control" id="e_id" value=${userName
									} readonly="readonly">
							</div>
							<div class="form-group col-md-6">
								<label for="mr_num">예약 회의실</label> <input type="text"
									name="mr_num" class="form-control" id="mr_num"
									value="${registerrseroom.mr_num}" readonly=readonly>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="rb_startday">예약시작 일자</label> <input type="text"
									name="rb_startday" class="form-control" id="datepickerstartday">
							</div>
							<div class="form-group col-md-6">
								<label for="timepicker">예약시작 시간</label> <input type="text"
									name="rb_starttime" class="form-control" id="timepicker">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="datepickerendday">예약종료 일자</label> <input type="text"
									name="rb_endday" class="form-control" id="datepickerendday">
							</div>
							<div class="form-group col-md-6">
								<label for="timepicker2">예약종료 시간</label> <input type="text"
									name="rb_endtime" class="form-control" id="timepicker2">
							</div>
						</div>

						<input type="button" class="write_Btn" value="예약" id="resroom">
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>