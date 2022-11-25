<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인입니다.</title>
   <script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>	
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
				<h2 id="c-title">수정</h2>

 <div class="container-fluid ">
      <div class="row">
         <!-- sidebar -->
  
<div style="width: 100%; height: 1000;">


	 <form class="aaaform" role="form" action="/suggestions/suggestionsmodify" method="post">	 
		 
		<div class="form-group">
			<label>글번호</label> 
			<input class="form-control" name='s_num' size=120
				value='<c:out value="${suggestions.s_num}"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>아이디</label> 
			<input class="form-control" name='e_id'
				value='<c:out value="${suggestions.e_id}"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>제목</label> 			
			<input class="form-control" name='s_title'
				value='<c:out value="${suggestions.s_title}"/>' >
		</div>

		<div class="form-group">
			<label>내용</label> 			
			<textarea class="form-control" row="3" name='s_contents' style="height:200px" ><c:out
			value="${suggestions.s_contents}"/></textarea>
		</div>

		  <button type="submit" data-oper='modify' class="btn btn-info">수정</button>
		  <button type="submit" data-oper='remove' class="btn btn-info">삭제</button>			  
		  <button type="submit" data-oper='list' class="btn btn-info">리스트</button>

	</form>

 
		<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $(".aaaform");

			
			$('button').on("click", function(e){
				e.preventDefault();
				
				var operation = $(this).data("oper");
				
				console.log(operation);
				
				if(operation === 'remove'){
					formObj.attr("action", "/suggestions/remove");
				}else if(operation === 'list'){
					
					window.location.href="/suggestions/suggestionslist";
					return;
				}
				formObj.submit();
			});
		}); 
		</script>	

</div>
</div>
</div>
</div>



			</div>

			<!-- 내용 끝 -->

		<!-- 전체 wrapper 끝 -->
		 <jsp:include page="../includes/footer.jsp"></jsp:include> 
	
</body>

</html>

