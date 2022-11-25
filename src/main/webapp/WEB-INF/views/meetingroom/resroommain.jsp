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
	<div class="s-container">
		<h2 id="c-title">예약</h2>
		<div class="contents">

			<div class="card">
				<div class="card-header">회의실이용 안내사항</div>
				<div class="card-body">
					<blockquote class="blockquote mb-0">
						<p>
							회의실사용은 하루단위로만 가능하며, 예약횟수 및 일수에는 제한이 없습니다.<br> 동일시간 중복예약은
							불가능하며,주말이나 21시이후 사용에 대해선 관리자에게 문의해주시기 바랍니다.
						</p>
					</blockquote>
				</div>
			</div>
			<br> <br>
		
				<div class="card">
					<div class="card-header">차량대여 안내사항</div>
					<div class="card-body">
						<blockquote class="blockquote mb-0">
							<p>
								차량대여는 원하는 차량,일자를 선택해 예약신청후 승인요청에 따라 사용하실수 있습니다.<br> 동일시간
								중복예약은 불가능하며,기타 문의사항은 관리자에게 문의해주시기 바랍니다.
							</p>
						</blockquote>
					</div>
				</div>


				<div class="contents_wrap">
					<table>
						<thead>
							<tr>
								<th scope="col">회의실번호</th>
								<th scope="col">회의실이름</th>
								<th scope="col">인원수</th>
								<th scope="col">등록일자</th>
								<th scope="col">수정일자</th>
							</tr>
						</thead>
						<tbody id="contentsTbBody">
							<c:forEach var="roomlist" items="${list}">

								<tr>
									<td><a
										href="/meetingroom/resroomcal?mr_num=${roomlist.mr_num}">${roomlist.mr_num }</a></td>
									<td><a
										href="/meetingroom/registerrseroom?mr_num=${roomlist.mr_num}">${roomlist.mr_name}</a></td>
									<td>${roomlist.mr_total}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
</body>
</html>