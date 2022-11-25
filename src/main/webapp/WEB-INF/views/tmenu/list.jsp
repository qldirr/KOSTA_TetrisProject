<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인입니다.</title>

</head>
<body>

	<!-- jsp 인클루드 사용-->
	<jsp:include page="../includes/header.jsp"></jsp:include>

	
			<!-- 보조사이드바 -->
			<div class="s-menu">
				<div class="s-menu-title">
					<p>게시판
					<i class="bi bi-easel"></i>
				</div>
				<div class="s-list-item ">
					<a href="/notice/list">공지사항</a>
				</div>
				<div class="s-list-item ">
					<a href="/suggestions/suggestionslist">익명 건의사항</a>
				</div>
				<div class="s-list-item ">
					<a href="/tmenu/list">식단표</a>
				</div>				
			</div>
			<!-- 보조사이드바 끝-->

			<!-- 내용 시작 -->
			<div class="wrap-box">
			<div class="s-container">
				<h2 id="c-title">식단표</h2>

				<div style="width: 100%; height: 1000;">
				
					<table class="table table-hover" 
						id="list">
						<thead>
							<tr>
								<th width="10%">번호</th>
								<th width="10%">작성자</th>
								<th width="20%">제목</th>
								<th width="30%">내용</th>
								<th width="15%">작성일</th>
								<th width="15%">수정일</th>
							</tr>
						</thead>
						<c:forEach items="${list}" var="tmenu">
							<tr>
								<td><c:out value="${tmenu.t_num}" /></td>
								<td><c:out value="${tmenu.e_id}" /></td>
								<td>
								<a class='move' href='/tmenu/get?t_num=<c:out value="${tmenu.t_num}"/>'>
									<c:out value="${tmenu.t_title}" /></a>
								</td>
								<td><c:out value="${tmenu.t_contents}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${tmenu.t_regdate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${tmenu.t_moddate}" /></td>
							</tr>
						</c:forEach>
					</table>
</div>
</div>
</div>
</div>


		

			<!-- 내용 끝 -->

		<!-- 전체 wrapper 끝 -->
		<jsp:include page="../includes/footer.jsp"></jsp:include> 
	
</body>

</html>

