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
 <div class="wrap">
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
				<h2 id="c-title">공지사항</h2>
 <div class="container-fluid ">
      <div class="row">
         <!-- sidebar -->
      
<div style="width: 100%; height: 1000;">


	<table class="table table-striped table-bordered table-hover">	


        <!--  <form role="form" method="post">-->         
          
          <div class="form-group">
            <label>글번호</label> <input class="form-control" name='n_num' size=1200
            value='<c:out value="${notice.n_num}"/>' readonly="readonly"> <!--readonly으로 읽기만 가능하도록  -->
          </div>

          <div class="form-group">
            <label>아이디</label> <input class="form-control" name='e_id'
            value='<c:out value="${notice.e_id}"/>' readonly="readonly">
          </div>

          <div class="form-group">
            <label>제목</label> <input class="form-control" name='n_title'
            value='<c:out value="${notice.n_title}"/>' readonly="readonly">
          </div>

		<div class="form-group">
			<label>내용</label> 			
			<textarea class="form-control" row="3" name='n_contents' style="height:200px" readonly="readonly"  ><c:out
			value="${notice.n_contents}" /></textarea>
		</div>



		<sec:authorize access="hasRole('ROLE_ADMIN')">  <!--권한에 따른 접근제한  -->
		<button type="button" class="btn btn-info" id="button"
		onclick="location.href='/notice/modify?n_num=<c:out value="${notice.n_num}"/>'">
		수정</button>
		</sec:authorize>
		<button type="button" class="btn btn-info" id="button" 
		onclick="location.href='/notice/list'">
		리스트</button>

    <style>
        #button{
            margin-left:5px;
        }
    </style>

<form id='operForm' action="/notice/modify" method="get">
	<input type='hidden' id='n_num' name='n_num' value='<c:out value="${notice.n_num}"/>'> <!--hidden으로 내용 숨기기  -->
	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
</form>

</table>


</div>
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