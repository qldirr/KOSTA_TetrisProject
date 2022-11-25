<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
	type="text/javascript"></script>
	<script src="/resources/vender/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script type="text/javascript">


</script>
</head>
<body>

<jsp:include page="../includes/header.jsp"></jsp:include>
			<!-- 보조메뉴바 시작 -->
			
			<div class="s-menu">
				<div class="s-menu-title">
					<p>알림 <i class="bi bi-tags"></i>
				</div>
				<div class="s-list-item ">
				    <input id="newbtn" type="button" value="알림 전체 읽음" onclick="self.location = '/notification/checkTotal';">
				</div><br>
			</div>
			
			
		<div class="s-container"><br>
			<h2 id="c-title">전체알림함</h2><br>
				<div id="totalAlarms" class="list-group" style="width: 900px">
					<c:forEach items="${list }" var="list">
					<c:if test="${list.al_status eq 'Y' }">
					<a href="#" class="list-group-item list-group-item-action">
					</c:if>
					<c:if test="${list.al_status eq 'N' }">
					<a href="#" class="list-group-item list-group-item-action list-group-item-primary">
					</c:if>
				    <div class="d-flex w-100 justify-content-between">
				    <small><strong>${list.al_type }</strong>&nbsp;&nbsp;${list.al_contents }</small></div></a>
				    </c:forEach>
				</div><br>
			
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				  
				  <c:if test="${pageMaker.prev}">
				    <li class="page-item">
				      <a class="page-link" href="${pageMaker.startPage - 1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				  </c:if>
				  
				  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				    <li class="page-item ${pageMaker.cri.pageNum == num? "active":"" }"><a class="page-link" href="${num }">${num }</a></li>
				  </c:forEach>
				   
				  <c:if test="${pageMaker.next }">
				    <li class="page-item">
				      <a class="page-link" href="${pageMaker.endPage + 1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </c:if>  
				    
				  </ul>
				</nav>
			
		</div>
		
		
		
		
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>