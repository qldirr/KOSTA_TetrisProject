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
	type="text/javascript" defer>></script>

<script type="text/javascript">	

$(document).ready(
		function() {		
			$('#datepickerstartday').datepicker({
			    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			    startDate: 'd',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			    endDate: '+30d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		        daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
			    templates : {
			        leftArrow: '&laquo;',
			        rightArrow: '&raquo;'
			    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
			    title: "예약시작날짜",	//캘린더 상단에 보여주는 타이틀
			    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
			    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			    weekStart : 1 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
			    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
								
			});
			$('#datepickerendday').datepicker({
			    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			    startDate: 'd',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			    endDate: '+30d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		        daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
			    templates : {
			        leftArrow: '&laquo;',
			        rightArrow: '&raquo;'
			    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
			    title: "예약시작날짜",	//캘린더 상단에 보여주는 타이틀
			    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
			    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			    weekStart : 1 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
			    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
								
			});
						
			$('#timepicker').timepicker({
			
				
	            timeFormat: 'HH:mm',
	            interval: 60,
	            minTime: '60',
	            maxTime: '9:00pm',
	            startTime: '09:00',
	            dynamic: false,
	            dropdown: true,
	            scrollbar: true,

	        });
			
            $('#timepicker2').timepicker({
			
				
	            timeFormat: 'HH:mm',
	            interval: 60,
	            minTime: '60',
	            maxTime: '9:00pm',
	            startTime: '09:00',
	            dynamic: false,
	            dropdown: true,
	            scrollbar: true,

	        });
			
			
	//예약버튼		
	$("#rescar").click(function() {
		chkrescar();
  	})
			
	});

function chkrescar(){	
	 // 입력받은 값들 유효성 검사: 시작
    var startday = $("input[name=cb_startday]").val() + " " + $("input[name=cb_starttime]").val() + ":00";
    var endday = "";
    
    if ($("input#allday:checked").val()) {
       startday = $("input[name=cb_startday]").val() + " 00:00:00";
       endday = $("input[name=cb_startday]").val() + " 23:59:59";
    }else{
       endday = $("input[name=cb_endday]").val() + " " + $("input[name=cb_endtime]").val() + ":00";
    } 
    
    // true: 통과   false: 불통
    if (!(startday < endday && startday != endday)) {
       alert("올바른 일시를 선택해주세요.");
       return false;
    }
    
    var mode = $("#mode").val();
	if("write" == mode){	
		alert('예약신청이 완료되었습니다. ')
		$('#registerrsecar').attr("action", "/reservation/registerrsecar")
		$("#registerrsecar").submit()
	
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

				<h2 id="c-title">차량예약</h2>
				<div class="contents">

					<form action="/reservation/registerrsecar" method="post"
						id="registerrsecar">
						<input type="hidden" name="mode" id="mode" value="write" />

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="e_id">예약자</label> <input type="text" name="e_id"
									class="form-control" id="e_id" value=${userName
									}
									readonly="readonly">
							</div>
							<div class="form-group col-md-6">
								<label for="ca_num">예약차량</label> <input type="text"
									name="ca_num" class="form-control" id="ca_num"
									value="${registerrsecar.ca_num}" readonly=readonly>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="datepickerstartday">예약시작 일자</label> <input
									type="text" name="cb_startday" class="form-control"
									id="datepickerstartday" onkeyup="eventKeyup(this.value)">
							</div>
							<div class="form-group col-md-6">
								<label for="timepicker">예약시작 시간</label> <input type="text"
									name="cb_starttime" class="form-control" id="timepicker">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="datepickerendday">예약종료 일자</label> <input type="text"
									name="cb_endday" class="form-control" id="datepickerendday">
							</div>
							<div class="form-group col-md-6">
								<label for="timepicker2">예약종료 시간</label> <input type="text"
									name="cb_endtime" class="form-control" id="timepicker2">
							</div>
						</div>

						<input type="button" class="write_Btn" value="예약신청" id="rescar">
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>