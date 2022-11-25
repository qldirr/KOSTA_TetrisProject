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
			<a href="/reservation/listrescar">차량 예약관리</a>
		</div>

	</div>
	<!-- 보조메뉴바 끝 -->

	<!-- 내용 시작 -->
	<div class="s-container">

		<h2 id="c-title">회의실예약 정보</h2>

		<div class="contents">
			<h3>NO.${readresroom.mr_num}</h3>

				<form action="" method="get" id="readresroom">
					<%-- <input type = "hidden" name = "mode" id = "mode" value = "${param.mode}" />  --%>
					
					
					
					<div class="form-row">
					<div class="form-group col-md-6">
						<label for="e_id">예약자</label> <input type="text" name="e_id"
							class="form-control" id="e_id"  value="${readresroom.e_id}" readonly=readonly>
					</div>
					<div class="form-group col-md-6">
						<label for="mr_num">예약 회의실</label> <input type="text" name="mr_num"
							class="form-control" id="mr_num"
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

				
						<table>
							<tbody id="contentsTbBody">
								<tr>
									<th scope="col">예약자</th>
									<td class="left"><c:out value="${readresroom.e_id}"></c:out></td>
								</tr>
								<tr>
									<th scope="col">예약회의실</th>
									<td class="left">${readresroom.mr_num}</td>
								</tr>
								<tr>
									<th scope="col">예약시작일자</th>
									<td class="left"><fmt:parseDate var="datefmt"
											value="${readresroom.rb_startday}" pattern="yyyy-MM-dd" /> <fmt:formatDate
											value="${datefmt}" pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<th scope="col">예약시작시간</th>
									<td class="left"><fmt:parseDate var="timefmt"
											value="${readresroom.rb_starttime}" pattern="hh:mm" /> <fmt:formatDate
											value="${timefmt}" pattern="hh:mm" /></td>
								</tr>
								<tr>
									<th scope="col">예약종료일자</th>
									<td class="left"><fmt:parseDate var="datefmt"
											value="${readresroom.rb_endday}" pattern="yyyy-MM-dd" /> <fmt:formatDate
											value="${datefmt}" pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<th scope="col">예약종료시간</th>
									<td class="left"><fmt:parseDate var="timefmt"
											value="${readresroom.rb_endtime}" pattern="hh:mm" /> <fmt:formatDate
											value="${timefmt}" pattern="hh:mm" /></td>
								</tr>

							</tbody>
						</table>
					</div>
				</form>

				<input type="button" class="list_btn" id="listBtn" value="메인페이지 이동"
					onclick="location.href = '/meetingroom/listroom'" />

			</div>
		</div>


	</div>
</body>
</html>