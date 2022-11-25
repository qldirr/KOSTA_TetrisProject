<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TetrisGroupware</title>


<link href="/resources/css/res.css" rel="stylesheet">


<script type="text/javascript">
	
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
				<a href="/meetingroom/listroom">회의실 관리</a>
			</div>
			<div class="s-list-item ">
				<a href="/reservation/listcar">차량관리</a>
			</div>
			<div class="s-list-item ">
				<a href="/reservation/listrescar">차량 예약관리</a>
			</div>

		</div>
		<!-- 보조메뉴바 끝 -->

		<!-- 내용 시작 -->
		<div class="wrap-box">
			<div class="s-container">

				<h2 id="c-title">차량예약 정보</h2>

				<div class="contents">
					<h3>NO.${rescar.cb_num}</h3>


					<form action="" method="get" id="rescar">
						<input type="hidden" name="mode" id="mode" value="${param.mode}" />
						<input type="hidden" name="ca_num" id="ca_num"
							value="${rescar.ca_num}" /> <input type="hidden" id="cb_num"
							value="${rescar.cb_num}" />

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="e_id">예약자</label> <input type="text" name="e_id"
									class="form-control" id="e_id" value="${rescar.e_id}"
									readonly=readonly>
							</div>
							<div class="form-group col-md-6">
								<label for="ca_num">예약차량</label> <input type="text"
									name="ca_num" class="form-control" id="ca_num"
									value="${rescar.ca_num}" readonly=readonly>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="cb_startday">예약시작 일자</label> <input type="text"
									name="cb_startday" class="form-control" id="cb_startday"
									value="<fmt:parseDate var="datefmt"
									value="${rescar.cb_startday}" pattern="yyyy-MM-dd" /> <fmt:formatDate
									value="${datefmt}" pattern="yyyy-MM-dd" />"
									readonly=readonly>
							</div>
							<div class="form-group col-md-6">
								<label for="cb_starttime">예약시작 시간</label> <input type="text"
									name="cb_starttime" class="form-control" id="cb_starttime"
									value="<fmt:parseDate var="timefmt"
									value="${rescar.cb_starttime}" pattern="hh:mm" /> <fmt:formatDate
									value="${timefmt}" pattern="hh:mm" />"
									readonly=readonly>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="cb_endday">예약종료 일자</label> <input type="text"
									name="cb_endday" class="form-control" id="cb_endday"
									value="<fmt:parseDate var="datefmt"
									value="${rescar.cb_endday}" pattern="yyyy-MM-dd" /> <fmt:formatDate
									value="${datefmt}" pattern="yyyy-MM-dd" />"
									readonly=readonly>
							</div>
							<div class="form-group col-md-6">
								<label for="cb_endtime">예약종료 시간</label> <input type="text"
									name="cb_endtime" class="form-control" id="cb_endtime"
									value="<fmt:parseDate var="timefmt"
									value="${rescar.cb_endtime}" pattern="hh:mm" /> <fmt:formatDate
									value="${timefmt}" pattern="hh:mm" />"
									readonly=readonly>
							</div>
						</div>

					</form>

					<input type="button" class="list_Btn" id="listBtn" value="목록"
						onclick="location.href = '/reservation/listrescar'" />
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>