<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TetrisGroupware</title>
<link href="/resources/css/res.css" rel="stylesheet">
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
		<h2 id="c-title">차량정보</h2>

		<div class="contents">
			<h3>NO.${readcar.ca_num}</h3>

			<form action="" id="readcar" method="get">
				<input type="hidden" name="mode" id="mode" value="${param.mode}" />
				<input type="hidden" name="ca_num" id="ca_num"
					value="${readcar.ca_num}" /> <img
					src="/resources/img/res/${readcar.ca_num}.jpg" class="rounded mx-auto d-block"
					alt="..." height="300" width="500">

				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="ca_num">차량번호</label> <input type="text" name="ca_num"
							class="form-control" id="ca_num" value="${readcar.ca_num}"
							readonly=readonly>
					</div>
					<div class="form-group col-md-6">
						<label for="ca_model">차량모델 명</label> <input type="text"
							name="ca_model" class="form-control" id="ca_model"
							value="${readcar.ca_model}" readonly=readonly>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="ca_type">차종</label> <input type="text" name="ca_type"
							class="form-control" id="ca_num" value="${readcar.ca_type}"
							readonly=readonly>
					</div>
					<div class="form-group col-md-6">
						<label for="ca_age">연식</label> <input type="text" name="ca_age"
							class="form-control" id="ca_model" value="${readcar.ca_age}"
							readonly=readonly>
					</div>
				</div>

				<div class="btn_wrap">
					<input type="button" class="list_Btn" id="listBtn" value="목록"
						onclick="location.href = '/reservation/listcar'" />
				</div>

			</form>
		</div>
		
	</div>
	</div>
	</div>
<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>