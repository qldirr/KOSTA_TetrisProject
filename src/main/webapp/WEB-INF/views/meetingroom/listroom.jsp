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
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript">

	$(function() {

	 var btn = $('#detail_Btn');

	 $(detail_Btn).click(function() {
	 $(mr_num).val(${readroom.mr_num});
	

	 });*/
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
		<h2 id="c-title">회의실 관리</h2>


			<div class="contents">

				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">회의실번호</th>
							<th scope="col">회의실이름</th>
							<th scope="col">인원수</th>
							<th scope="col">등록일자</th>
							<th scope="col">수정일자</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody id="contentsTbBody">
						<c:forEach var="roomlist" items="${list}">

							<tr>
								<td>${roomlist.mr_num }</td>
								<td class="num"><a
									href="/meetingroom/readroom?mr_num=${roomlist.mr_num}">${roomlist.mr_name}</a></td>
								<td>${roomlist.mr_total}</td>
								<td><fmt:formatDate value="${roomlist.mr_regdate}"
										pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${roomlist.mr_moddate}"
										pattern="yyyy-MM-dd" /></td>
								<td><button type="button" id="detail_Btn"
										class="btn btn-outline-secondary btn-sm" data-toggle="modal"
										data-target="#exampleModal">회의실상세보기</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div></div>
				<a href="/meetingroom/registerroom"> <input type="button"
					class="write_Btn" value="회의실등록" id="writeBtn" />
				</a> <a href="/meetingroom/listresroom"> <input type="button"
					class="list_Btn" value="회의실예약목록" id="reslistBtn" />
				</a>
				</div>
				
			</div>
		</div>
		</div>
		
		<jsp:include page="../includes/footer.jsp"></jsp:include>
		

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true" >

		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회의실정보</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="mr_num">회의실번호</label> <input type="text" name="mr_num"
							class="form-control" id="mr_num" value="RS002"
							readonly=readonly>
					</div>
					<div class="form-group">
						<label for="ca_model">회의실이름</label> <input type="text"
							name="mr_name" class="form-control" value="콤보"
							id="mr_name" readonly=readonly>
					</div>
					<div class="form-group">

						<label for="mr_total">수용인원</label> <input type="text"
							name="mr_total" class="form-control" value="20명"
							id="mr_total" readonly=readonly>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	


</body>
</html>