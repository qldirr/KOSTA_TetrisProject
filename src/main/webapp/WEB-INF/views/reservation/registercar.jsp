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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="/resources/css/res.css" rel="stylesheet">
	<link href="/resources/css/main.css" rel="stylesheet" type="text/css">

<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/vender/res/bootstrap-datepicker.js"></script>
<script src="/resources/vender/res/jquery.timepicker.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		var errorMessage = [[${errorMessage}]];
		if(errorMessage != null){
			alert(errorMessage);
		}

		bindDomEvent();

	});

	function bindDomEvent(){
		$(".custom-file-input").on("change", function() {
			var fileName = $(this).val().split("\\").pop();  //이미지 파일명
			var fileExt = fileName.substring(fileName.lastIndexOf(".")+1); // 확장자 추출
			fileExt = fileExt.toLowerCase(); //소문자 변환

			if(fileExt != "jpg" && fileExt != "jpeg" && fileExt != "gif" && fileExt != "png" && fileExt != "bmp"){
				alert("이미지 파일만 등록이 가능합니다.");
				return;
			}

			$(this).siblings(".custom-file-label").html(fileName);
		});
	}





	$(function() {
		//차량등록
		$("#enroll").click(function() {
			if (confirm("등록하시겠습니까?")) {
				var mode = $("#mode").val();
				if ("write" == mode) {
					$("#registercareform").submit()

				}

			}
			return false;
		})



	});


</script>
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
				<h2 id="c-title">차량 등록</h2>

				<div class="contents_wrap">
					<div class="contents">
						<form action="/reservation/registercar" method="post" enctype="multipart/form-data"
							id="registercareform">
							<input type="hidden" name="mode" id="mode" value="write" />


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="carNum">차량 번호</label>
									<input type="text" name="carNum" class="form-control" id="carNum">
								</div>
								<div class="form-group col-md-6">
									<label for="modelNm">차량 모델 명</label>
									<input type="text" name="modelNm" class="form-control" id="modelNm">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="carType">차종</label>
									<input type="text" name="carType" class="form-control" id="carType">
								</div>
								<div class="form-group col-md-6">
									<label for="carAge">연식</label>
									<input type="text" name="carAge" class="form-control" id="carAge">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-12">
									<label class="custom-file-label">차량사진을 등록해주세요.</label>
									<input type="file" class="custom-file-input" name="carImgFile" >
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