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
				<h2 id="c-title">차량관리</h2>



				<div class="contents">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">차량번호</th>
								<th scope="col">차량모델명</th>
								<th scope="col">차종</th>
								<th scope="col">연식</th>
								<th scope="col">등록일자</th>
								<th scope="col">수정일자</th>
							</tr>
						</thead>
						<tbody id="contentsTbBody">
							<c:forEach var="carlist" items="${list}">

								<tr>
									<td>${carlist.ca_num }</td>
									<td><a
										href="/reservation/readcar?ca_num=${carlist.ca_num}">${carlist.ca_model}</a></td>
									<td>${carlist.ca_type}</td>
									<td>${carlist.ca_age}</td>

									<td><fmt:formatDate value="${carlist.ca_regdate}"
											pattern="yyyy-MM-dd" /></td>
									<td><fmt:formatDate value="${carlist.ca_modifydate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="/reservation/registercar"> <input type="button"
						value="차량등록" class="write_Btn" id=write_Btn />
					</a>

				</div>

			</div>
		</div>

	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>