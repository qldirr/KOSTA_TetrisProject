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
				var el_num = $(this).attr('href');
				
				self.location = '/elecauth/document/' + el_num;
		
			})
		
		})

</script>
</head>
<body>

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
		<div class="s-container"><br>
			<h2 id="c-title">수신문서함</h2><br>

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
					<td><c:if test="${auth.dm_num == 1}">
							<c:out value="일반기안-${auth.el_num }" />
						</c:if> <c:if test="${auth.dm_num == 2}">
							<c:out value="연차신청-${auth.el_num }" />
						</c:if></td>
					<td><c:if test="${auth.dm_num == 1}">
							<c:out value="일반기안" />
						</c:if> <c:if test="${auth.dm_num == 2}">
							<c:out value="연차신청" />
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
	
	
							<%-- <div class='pull-right'>
						<ul class="pagination justify-content-center">

							<li><c:if test="${pageMaker.prev}">
									<li class="paginate_button previous"><a
										href="${pageMaker.startPage -1}">Previous</a></li>
								</c:if> <c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
										<a href="${num}">${num}</a>
									</li>
								</c:forEach> <c:if test="${pageMaker.next}">
									<li class="paginate_button next"><a
										href="${pageMaker.endPage +1 }">Next</a></li>
								</c:if></li>

						</ul>
					</div>
					<!--  end Pagination -->

					<form id='actionForm' action="/elecauth/getList"
						method='get'>
						<input type='hidden' name='pageNum'
							value='${pageMaker.cri.pageNum}'/> <input type='hidden'
							name='amount' value='${pageMaker.cri.amount}'/>
					</form> --%>
	
	
</div>
</div>
</div>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>