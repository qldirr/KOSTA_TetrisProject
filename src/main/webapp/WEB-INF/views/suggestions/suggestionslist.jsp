<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
	<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>
					<script src="/resources/js/index.js"></script>
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
				<h2 id="c-title">익명 건의사항</h2>


					<button id='regBnt' type="button" class="btn btn-outline-primary"
						onclick="location.href='/suggestions/suggestionsregister'">등록</button>


					<table class="table table-hover" 
						id="list">
						<thead>
							<tr>
								<th width="10%">번호</th>
								<th width="10%">아이디</th>
								<th width="15%">제목</th>
								<th width="35%">내용</th>
								<th width="15%">작성일</th>
								<th width="15%">수정일</th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="suggestions">
							<tr>
								<td><c:out value="${suggestions.s_num}" /></td>
								<td><c:out value="${suggestions.e_id}" /></td>
								<td>
								<a class='move' href='<c:out value="${suggestions.s_num}"/>'>
									<c:out value="${suggestions.s_title}" /></a>
								</td>
								<td><c:out value="${suggestions.s_contents}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${suggestions.s_regdate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${suggestions.s_moddate}" /></td>
							</tr>
						</c:forEach>
					</table>

					
					<!-- Modal  추가 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<!--<h4 class="modal-title" id="myModalLabel">Modal title</h4> -->
								</div>
								<div class="modal-body">처리가 완료되었습니다.</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<!--<button type="button" class="btn btn-primary">Save
										changes</button>-->
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->					
					
					
					<div class='pull-right'>
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

					<form id='actionForm' action="/suggestions/suggestionslist"
						method='get'>
						<input type='hidden' name='pageNum'
							value='${pageMaker.cri.pageNum}'/> <input type='hidden'
							name='amount' value='${pageMaker.cri.amount}'/>
					</form>


					<script type="text/javascript">
					$(document).ready(function() {
					
						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}
						
						var actionForm = $("#actionForm");
						$(".paginate_button a").on("click", function(e) {
					
							e.preventDefault();
							
							console.log('click');
					
							actionForm.find("input[name='pageNum']").val($(this).attr("href"));
							actionForm.submit();
						});
						
						//실행x 315
						$(".move").on("click", function(e) {
							
							e.preventDefault();
							actionForm.append("<input type='hidden' name='s_num' value='"+
							$(this).attr("href")+ "'>");
							actionForm.attr("action", "/suggestions/suggestionsget");
							actionForm.submit();
							});	
			
							});
					
				
</script>











</div>
</div>
			</div>

			<!-- 내용 끝 -->

		<!-- 전체 wrapper 끝 -->
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	
</body>

</html>
