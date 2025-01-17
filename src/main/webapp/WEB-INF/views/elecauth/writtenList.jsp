<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="/resources/vender/bootstrap/css/bootstrap.min.css">
<script type="text/javascript">

	$(function(){
		
		$('td a').on('click', function(e){
			e.preventDefault();
			var authId = $(this).attr('href');
			
			self.location = authId;

		})
	
	})

</script>
</head>
<body>
<%--<jsp:include page="../includes/header.jsp"></jsp:include>--%>
			<!-- 보조메뉴바 시작 -->
			
			<div class="s-menu">
				<div class="s-menu-title">
					<p>전자결재 <i class="bi bi-tags"></i>
				</div>
				<div class="s-list-item ">
				    <input id="newbtn" type="button" value="새 문서 작성" onclick="self.location = '/elecauth/register';">
				</div><br>
				<div class="s-list-item ">
					<a href="/elecauth/writtenList">상신문서함</a>
				</div>
				<div class="s-list-item ">
					<a href="/elecauth/uncheckedList">결재대기문서</a>
				</div>
				<div class="s-list-item ">
					<a href="/elecauth/disapprovedList">반려문서함</a>
				</div>
				<div class="s-list-item ">
					<a href="/elecauth/sendList">발신문서함</a>
				</div>
				<div class="s-list-item ">
					<a href="/elecauth/getList">수신문서함</a>
				</div>
			</div>
			
			<div class="wrap-box">			
		<div class="s-container"><br>
			<h2 id="c-title">상신문서함</h2><br>


	<table class="table table-bordered table-sm" style="width: 110%">
		<thead>
			<tr>
				<th scope="col" style="width: 18%">문서번호</th>
				<th scope="col" style="width: 12%">문서유형</th>
				<th scope="col" style="width: 20%">문서제목</th>
				<th scope="col" style="width: 10%">기안자</th>
				<th scope="col" style="width: 20%">기안일</th>
				<th scope="col" style="width: 20%">결재상태</th>
			</tr>
		</thead>
		<tbody class="elecauthlist">
		<c:forEach items="${authlist}" var="auth">
			<tr>
				<td><c:if test="${auth.doc_id == 1}">
					<c:out value="일반기안-${auth.id }" />
				</c:if> <c:if test="${auth.doc_id == 2}">
					<c:out value="연차신청-${auth.id }" />
				</c:if></td>
				<td><c:if test="${auth.doc_id == 1}">
					<c:out value="일반기안" />
				</c:if> <c:if test="${auth.doc_id == 2}">
					<c:out value="연차신청" />
				</c:if></td>
				<td><a href="${auth.id}">${auth.title}</a></td>
				<td>${auth.writer}</td>
				<td><fmt:parseDate value="${auth.regDate}" var="regdate"
								   pattern="yyyy-MM-dd" /> <fmt:formatDate value="${regdate}"
																		   var="date" pattern="yyyy-MM-dd" /> <c:out value="${date}" /></td>
				<td>
					<c:choose>
						<c:when test="${auth.status eq 'UNSIGNED'}">
							결재전
						</c:when>
						<c:when test="${auth.status eq 'ONGOING'}">
							결재진행중
						</c:when>
						<c:when test="${auth.status eq 'DISAPPROVED'}">
							결재진행중
						</c:when>
						<c:otherwise>
							결재완료
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		</tbody>
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