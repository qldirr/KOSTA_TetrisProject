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

					<c:set var="i" value="0" />
					<c:set var="j" value="3" />
					<table>

						<c:forEach var="carlist" items="${list}">
							<c:if test="${i%j == 0 }">
								<tr>
							</c:if>
							<td><div class="card" style="width: 18rem;">
									<img src="/resources/img/res/${carlist.ca_num}.jpg"
										class="card-img-top" alt="..." height="150" width="200">
									<div class="card-body">
										<h5 class="card-title">${carlist.ca_num}</h5>
										<p class="card-text">
											차량모델명: ${carlist.ca_model}<br> 차종: ${carlist.ca_type}<br>
											연식: ${carlist.ca_age}<br>
										</p>
										<a href="/reservation/registerrsecar?ca_num=${carlist.ca_num}">
											<input type="button" class="btn btn-outline-secondary"
											value="대여하기" id="rescarBtn" />
										</a>
									</div>
								</div></td>
							<c:if test="${i%j == j-1 }">
								</tr>
							</c:if>
							<c:set var="i" value="${i+1 }" />
						</c:forEach>
					</table>

				</div>

			</div>
		</div>
	</div>
	<div class="end"></div>
	
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>