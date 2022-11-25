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

	<div class="contents_wrap">
		<!-- view -->
		<form action="" id="readroom" method="get">
			<input type="hidden" name="mode" id="mode" value="${param.mode}" />
			<input type="hidden" name="mr_num" id="mr_num"
				value="${readroom.mr_num}" />










			<div class="contents">
				<!-- 상세 정보 -->
				<table>
					<tbody>
						<tr>
							<th scope="col">회의실번호</th>
							<td class="left">${readroom.mr_num}</td>
						</tr>
						<tr>
							<th scope="col">회의실이름</th>
							<td class="left">${readroom.mr_name}</td>
						</tr>
						<tr>
							<th scope="col">수용인원</th>
							<td class="left">${readroom.mr_total}</td>
						</tr>

					</tbody>
				</table>
			</div>

		</form>
		<div class="btn_wrap">
			<input type="button" class="list_btn" id="listBtn" value="목록"
				onclick="location.href = '/meetingroom/listroom'" />
		</div>
	</div>


	$(function(){ $("#read_Btn").click(function(){ $('div.modal').modal({
	remote : 'read.jsp' }); }) })

	<button type="button" class="btn btn-primary" id="read_Btn">
		Launch demo modal</button>

	<div class="modal fade" id="showReadRoom" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content">
				<!-- modal header -->
				<div class="modal-header">

					<h4 class="modal-title" style="font-weight: bold;">회의실 정보</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="mr_num">회의실번호</label> <input type="text" name="mr_num"
							class="form-control" id="mr_num">
					</div>
					<div class="form-group">
						<label for="ca_model">회의실이름</label> <input type="text"
							name="ca_model" class="form-control" id="ca_model">
					</div>
					<div class="form-group">

						<label for="mr_total">수용인원</label> <input type="text"
							name="mr_total" class="form-control" id="mr_total">
					</div>


					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">확인</button>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>