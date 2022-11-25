<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인입니다.</title>

<!-- Required meta tags -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link rel="stylesheet" href="/resources/css/main.css">
<!-- my CSS -->

<link rel="stylesheet" href="/resources/css/mycss/style.css">
<style type="text/css">
p.info {
	color: #161E67;
}

.todo-title {
	color: #161E67;
}

.todo-box {
	border: 2px solid #161E67;
}

.todo-item {
	border: 1px #161E67;
	border-collapse: collapse
}

.checkbox {
	border: 1px solid #161E67;
}
</style>


</head>
<body>

	<!-- jsp 인클루드 사용-->

	<jsp:include page="../includes/header.jsp"></jsp:include>


	<!-- 보조사이드바 -->
	<div class="s-menu">
		<div class="s-menu-title">
			<p>
				ToDoList<i class="bi bi-calendar-check"></i>
		</div>

		<div class="s-list-item ">
			<a href="/calendar/list">일정 관리</a>
		</div>
		<div class="s-list-item ">
			<a href="/todo/list">ToDoList</a>
		</div>
	</div>
	<!-- 보조사이드바 끝-->

	<!-- 내용 시작 -->

	<div class="s-container">



		<!-- content -->
		<div class="todo-wrapper">
			<div class="todo-title">Todo List</div>
			<div class="todo-box">

				<div class="todo-input-box">
					<button class="complete-all-btn">✔</button>
					<input type="text" class="todo-input" placeholder="해야 할 일을 입력해주세요.">
				</div>

				<ul class="todo-list">

				</ul>
				
				<div class="todo-bottom">
					<div class="left-items">0 items left</div>
					<div class="button-group">
						<button class="show-all-btn selected" data-type="all">All</button>
						<button class="show-active-btn" data-type="active">Active</button>
						<button class="show-completed-btn" data-type="completed">Completed</button>
					</div>
					<button class="clear-completed-btn">Clear Completed</button>
				</div>
			</div>
			
			<p class="info">더블클릭 시 수정 가능</p>

		</div>
	</div>


	<!-- 내용 끝 -->

	<!-- 전체 wrapper 끝 -->



	<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
	<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>


	<script src="/resources/js/myjs/todo.js"></script>
</body>

</html>



