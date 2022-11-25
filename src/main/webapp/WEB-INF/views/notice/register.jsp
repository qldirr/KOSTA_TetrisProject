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
				<h2 id="c-title">공지사항 등록</h2>
 <div class="container-fluid ">
      <div class="row">
         <!-- sidebar -->
    
<div style="width: 100%; height: 1000;">



	<table class="table table-striped table-bordered table-hover">	
    <form role="form" action="/notice/register" method="post"> 

          <div class="form-group">
            <label>아이디</label> <input class="form-control" name='e_id' id="floatingInput" value= '${userId}' readonly="readonly" size=1200>
          </div>
			
          <div class="form-group">
            <label>제목</label> <input class="form-control" name='n_title' id="floatingInput" placeholder="공지합니다.">
          </div>
	
          <div class="form-group">
            <label>내용</label> <textarea class="form-control" rows="10" name='n_contents' id="floatingInput" placeholder="공지내용입니다." style="height:200px"></textarea>
          </div>	
	
          <button type="submit" class="btn btn-secondary"> 제출</button>
          <!-- <button type="reset" class="btn btn-secondary"> Reset Button</button> -->
        </form>	



</table>
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


