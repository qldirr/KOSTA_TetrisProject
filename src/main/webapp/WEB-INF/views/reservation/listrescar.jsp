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
	$(function() {

		var cb_num = "";
		var resApp_btn = $('.resApp_Btn');

		$(resApp_btn).click(function() {

			cb_num = $(this).parent().parent().find('.num').text();

			console.info(cb_num);
			
			
			var alarm_id = $(this).parent().parent().find('.e_id').text();
			console.log(alarm_id);
			
			var resalarm = {
					
					e_id : alarm_id,
					al_type : "예약",
					al_contents : "신청하신 차랑이 예약되었습니다."
					
			}

			$.ajax({
				url : "/reservation/setCarApp",
				data : {
					cb_num : cb_num
				},
				type : "post",
			}).done(function() {

				$.ajax({
					url : '/notification/register',
					type : 'post',
					data : JSON.stringify(resalarm),
					contentType: 'application/json'
				}).done(function() {

					if(socket){
						var socketMsg = "book," + alarm_id + "," + "신청하신 차랑이 예약되었습니다." + "," + "/reservation/listcar";
						
						console.log("msg: " + socketMsg);
						socket.send(socketMsg);
					}
					self.location = "/reservation/listrescar";
					

				});
			
				

			});
			
			
		})

	});
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
	<div class="s-container">
		<h2 id="c-title">차량예약 등록</h2>
		<div class="contents_wrap">

			<div class="contents">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">예약번호</th>
							<th scope="col">차량번호</th>
							<th scope="col">사원아이디</th>
							<th scope="col">예약일자</th>
							<th scope="col">예약시간</th>
							<th scope="col">종료일자</th>
							<th scope="col">종료시간</th>
							<th scope="col"></th>						
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach var="carreslist" items="${list}">

							<tr>
								<td class="num"><a
									href="/reservation/readrescar?cb_num=${carreslist.cb_num}">${carreslist.cb_num }</a></td>
								<td>${carreslist.ca_num}</td>
								<td class="e_id">${carreslist.e_id}</td>

								<td><fmt:parseDate var="datefmt"
										value="${carreslist.cb_startday}" pattern="yyyy-MM-dd" /> <fmt:formatDate
										value="${datefmt}" pattern="yyyy-MM-dd" /></td>
								<td>${carreslist.cb_starttime}</td>
								<td><fmt:parseDate var="datefmt"
										value="${carreslist.cb_endday}" pattern="yyyy-MM-dd" /> <fmt:formatDate
										value="${datefmt}" pattern="yyyy-MM-dd" /></td>
								<td>${carreslist.cb_endtime}</td>

								<td><input type="button" class="resApp_Btn" id="resApp_Btn"
									value ="승인" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					
			</div>
		
		</div>
		
	</div>


</body>
</html>