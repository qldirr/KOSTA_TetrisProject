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
 <div class="container-fluid ">
      <div class="row">
         <!-- sidebar -->
      
<div style="width: 100%; height: 1000;">



	<table class="table table-striped table-bordered table-hover">	


        <!--  <form role="form" method="post">-->         
          
         <!--  <div class="form-group">
            <label>Num</label> <input class="form-control" name='t_num'
            value='<c:out value="${tmenu.t_num}"/>' readonly="readonly">
          </div>

          <div class="form-group">
            <label>title</label> <input class="form-control" name='t_title'
            value='<c:out value="${tmenu.t_title}"/>' readonly="readonly">
          </div>--> 

          <div class="form-group">
            <label></label> <input class="form-control" name='t_contents'
            value='<c:out value="${tmenu.t_contents}"/>' readonly="readonly">
          </div>


    <style>
        #button{
            margin-left:5px;
        }
    </style>
    


		<c:if test="${tmenu.t_num eq 1}"> <!--월별로 사진 첨부  -->
		<p><img src="/resources/img/menu1.jpg" width="900px"></p> 
		</c:if>
		<c:if test="${tmenu.t_num eq 2}">
		<p><img src="/resources/img/menu2.jpg" width="900px"></p> 
		</c:if>
		<c:if test="${tmenu.t_num eq 3}">
		<p><img src="/resources/img/menu3.jpg" width="900px"></p> 
		</c:if>	  
		<c:if test="${tmenu.t_num eq 4}">
		<p><img src="/resources/img/menu4.jpg" width="900px"></p> 
		</c:if>	  
		<c:if test="${tmenu.t_num eq 5}">
		<p><img src="/resources/img/menu5.jpg" width="900px"></p> 
		</c:if>
		<c:if test="${tmenu.t_num eq 6}">
		<p><img src="/resources/img/menu6.jpg" width="900px"></p> 
		</c:if>
		<c:if test="${tmenu.t_num eq 7}">
		<p><img src="/resources/img/menu7.jpg" width="900px"></p> 
		</c:if>	  
		<c:if test="${tmenu.t_num eq 8}">
		<p><img src="/resources/img/menu8.jpg" width="900px"></p> 
		</c:if>	 	  
		<c:if test="${tmenu.t_num eq 9}">
		<p><img src="/resources/img/menu9.jpg" width="900px"></p> 
		</c:if>
		<c:if test="${tmenu.t_num eq 10}">
		<p><img src="/resources/img/menu10.jpg" width="900px"></p> 
		</c:if>
		<c:if test="${tmenu.t_num eq 11}">
		<p><img src="/resources/img/menu11.jpg" width="900px"></p> 
		</c:if>	  
		<c:if test="${tmenu.t_num eq 12}">
		<p><img src="/resources/img/menu12.jpg" width="900px"></p> 
		</c:if>	  
	  
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
