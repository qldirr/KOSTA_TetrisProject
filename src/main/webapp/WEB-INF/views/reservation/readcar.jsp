<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TetrisGroupware</title>
	<link href="/resources/vender/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="/resources/css/res.css" rel="stylesheet">
	<link href="/resources/css/main.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
	<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<div class="wrap">

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
			<h3>NO.${carFormDto.carNum}</h3>

			<form action="" id="carFormDto" method="get">
				<input type="hidden" name="mode" id="mode" value="${param.mode}" />
				<input type="hidden" name="carId" id="carId" value="${carFormDto.carId}" />
				<img src="${car.carImgDtoList[0].imgUrl}" class="rounded mx-auto d-block"
					alt="..." height="300" width="500">

				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="carNum">차량번호</label> <input type="text" name="carNum"
							class="form-control" id="carNum" value="${carFormDto.carNum}"
							readonly=readonly>
					</div>
					<div class="form-group col-md-6">
						<label for="modelNm">차량모델 명</label> <input type="text"
							name="ca_model" class="form-control" id="modelNm"
							value="${carFormDto.modelNm}" readonly=readonly>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="carType">차종</label> <input type="text" name="carType"
							class="form-control" id="carType" value="${carFormDto.carType}"
							readonly=readonly>
					</div>
					<div class="form-group col-md-6">
						<label for="carAge">연식</label> <input type="text" name="carAge"
							class="form-control" id="carAge" value="${carFormDto.carAge}"
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