<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/vender/jquery/jquery-3.6.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="/resources/vender/bootstrap/css/bootstrap.min.css">
<script type="text/javascript">


</script>
</head>
<body>
<div class="wrap">
			<jsp:include page="../includes/header.jsp"></jsp:include>
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

		<div class="s-container">
			<br><br>
			<h2 id="c-title">전자결재</h2>
			<br>
			<div class="contents_wrap">
				<h5>상신문서</h5>


<table class="table table-bordered table-sm" style="width: 110%">
		<thead>
			<tr>
				<th scope="col" style="width: 18%">문서번호</th>
				<th scope="col" style="width: 12%">유형</th>
				<th scope="col" style="width: 18%">문서제목</th>
				<th scope="col" style="width: 12%">기안자</th>
				<th scope="col" style="width: 20%">기안일</th>
				<th scope="col" style="width: 20%">결재상태</th>
			</tr>
		</thead>
		<tbody class="elecauthlist">
			<c:forEach items="${authlist1}" var="auth1" begin="0" end="4" step="1" varStatus="status">
				<tr>
					<td><c:if test="${auth1.dm_num == 1}">
							<c:out value="일반기안-${auth1.el_num }" />
						</c:if> <c:if test="${auth1.dm_num == 2}">
							<c:out value="연차신청-${auth1.el_num }" />
						</c:if></td>
					<td><c:if test="${auth1.dm_num == 1}">
							<c:out value="일반" />
						</c:if> <c:if test="${auth1.dm_num == 2}">
							<c:out value="연차" />
						</c:if></td>
					<td><a href="${auth1.el_num }">${auth1.el_name}</a></td>
					<td>${auth1.e_name}</td>
					<td><fmt:parseDate value="${auth1.el_regdate}" var="regdate"
							pattern="yyyy-MM-dd" /> <fmt:formatDate value="${regdate}"
							var="date" pattern="yyyy-MM-dd" /> <c:out value="${date}" /></td>
					<td>${auth1.el_status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			
			<br><br>	
				<h5>결재대기문서</h5>
				
					<table class="table table-bordered table-sm" style="width: 110%">
		<thead>
			<tr>
				<th scope="col" style="width: 18%">문서번호</th>
				<th scope="col" style="width: 12%">유형</th>
				<th scope="col" style="width: 18%">문서제목</th>
				<th scope="col" style="width: 12%">기안자</th>
				<th scope="col" style="width: 20%">기안일</th>
				<th scope="col" style="width: 20%">결재상태</th>
			</tr>
		</thead>
		<tbody class="elecauthlist">
			<c:forEach items="${authlist2}" var="auth" begin="0" end="4" step="1" varStatus="status">
				<tr>
					<td><c:if test="${auth.dm_num == 1}">
							<c:out value="일반기안-${auth.el_num }" />
						</c:if> <c:if test="${auth.dm_num == 2}">
							<c:out value="연차신청-${auth.el_num }" />
						</c:if></td>
					<td><c:if test="${auth.dm_num == 1}">
							<c:out value="일반" />
						</c:if> <c:if test="${auth.dm_num == 2}">
							<c:out value="연차" />
						</c:if></td>
					<td><a href="${auth.el_num }">${auth.el_name}</a></td>
					<td>${auth.e_name}</td>
					<td><fmt:parseDate value="${auth.el_regdate}" var="regdate"
							pattern="yyyy-MM-dd" /> <fmt:formatDate value="${regdate}"
							var="date" pattern="yyyy-MM-dd" /> <c:out value="${date}" /></td>
					<td>${auth.el_status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</div>
</div>
</div>
<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>