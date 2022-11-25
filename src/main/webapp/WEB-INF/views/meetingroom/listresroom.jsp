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
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
	type="text/javascript"></script>
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
				<a href="/reservation/listrescar">차량예약 관리</a>
			</div>

		</div>
		<!-- 보조메뉴바 끝 -->

		<!-- 내용 시작 -->
		<div class="wrap-box">
			<div class="s-container">
				<h2 id="c-title">회의실예약 목록</h2>


				<div class="contents">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">예약번호</th>
								<th scope="col">회의실번호</th>
								<th scope="col">사원아이디</th>
								<th scope="col">예약일자</th>
								<th scope="col">종료일자</th>
							</tr>
						</thead>
						<tbody id="contentsTbBody">
							<c:forEach var="roomreslist" items="${list}">

								<tr>
									<td><a
										href="/meetingroom/readresroom?rb_num=${roomreslist.rb_num}">${roomreslist.rb_num }</a></td>
									<td>${roomreslist.mr_num}</td>
									<td>${roomreslist.e_id}</td>

									<td><fmt:parseDate var="datefmt"
											value="${roomreslist.rb_startday}" pattern="yyyy-MM-dd" /> <fmt:formatDate
											value="${datefmt}" pattern="yyyy-MM-dd" /></td>
									<td><fmt:parseDate var="datefmt"
											value="${roomreslist.rb_startday}" pattern="yyyy-MM-dd" /> <fmt:formatDate
											value="${datefmt}" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<input type="button" class="list_Btn" id="listBtn" value="회의실관리페이지"
						onclick="location.href = '/meetingroom/listroom'" />


				</div>

			</div>
		</div>
	</div>

	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>