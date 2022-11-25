<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/resources/vender/jquery/jquery-3.6.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="/resources/vender/bootstrap/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/7264476d39.js" crossorigin="anonymous"></script>

<style type="text/css">

tr {

text-align: center;

}

td {

text-align: center;

}

</style>
<script type="text/javascript">

var taskService = (function(){
	
	var list = "";
	
	/* 등록된 업무 보드 정보 */
	function getTask(){
		
		$.ajax({
			url : '/projectdetail/taskList',
			type : 'get',
			dataType : 'json',
			contentType : "application/json"
		}).done(function(data, textStatus, xhr) {
			
			$.each(data, function(index, value){
				
				$('.list').empty();
				
				list += "<tr><th scope=\"row\">"+ value.ts_name +"</th>";
				list += "<td>" + value.ts_manager + "</td>";
				
				if(value.ts_status == "예정"){
					
					list += "<td><span class=\"badge badge-light\">" + value.ts_status + "</span></td>";
					
				} else if(value.ts_status == "진행"){
					
					list += "<td><span class=\"badge badge-warning\">" + value.ts_status + "</span></td>";
					
				} else {
					
					list += "<td><span class=\"badge badge-success\">" + value.ts_status + "</span></td>";
				}
				
				
				if(value.ts_importance == "상"){
					
					list += "<td><span class=\"badge badge-danger\">" + value.ts_importance + "</span></td>";
					
				} else if(value.ts_importance == "중"){
					
					list += "<td><span class=\"badge badge-secondary\">" + value.ts_importance + "</span></td>";
					
				} else {
					
					list += "<td><span class=\"badge badge-light\">" + value.ts_importance + "</span></td>";
				}
			
				list += "<td>" + value.ts_startdate + "</td>";
				list += "<td>" + value.ts_enddate + "</td>";
				list += "<td>" + value.ts_contents + "</td></tr>";
				
				$('.list').append(list);
			     
			})
						
	}); /* end ajax */
		
	}/* end function getTask */
	
	
	return {
		getTask : getTask
	}
	
})();

$(function(){
	
	taskService.getTask();
	
});

</script>

</head>
<body>

<div class="wrap">
		<jsp:include page="../includes/header.jsp"></jsp:include>
			<!-- 보조메뉴바 시작 -->
			
			<div class="s-menu">
				<div class="s-menu-title">
					<p>프로젝트 <i class="bi bi-tags"></i>
				</div>
				<div class="s-list-item ">
				    <input id="newbtn" type="button" value="새 업무 등록하기" onclick="self.location = '/projectdetail/registerTask';">
				</div><br>
				<div class="s-list-item ">
					<a href="/projectdetail/home/${pj_num}">프로젝트 홈</a>
				</div>
				<div class="s-list-item ">
					<a href="/projectdetail/calendar">캘린더</a>
				</div>
				<div class="s-list-item ">
					<a href="/projectdetail/taskboard">업무보드</a>
				</div>
				<div class="s-list-item ">
					<a href="/projectdetail/tasklist">업무리스트</a>
				</div>
				<br><br>
				<div class="s-list-item ">
					<a href="/project/main" style="color:gray"><i class="fa fa-thin fa-door-open"></i> 나가기</a>
				</div>

			</div>
			
		<div class="wrap-box">			
		<div class="s-container">
			<br><br>
			<h5>${project.pj_name }</h5>
			<h2 id="c-title">업무 리스트</h2><br>
			<div class="contents_wrap">

<table class="table table-bordered table-sm" style="width: 110%">
  <thead>
    <tr>
      <th scope="col" style="width: 20%">업무명</th>
      <th scope="col" style="width: 10%">담당자</th>
      <th scope="col" style="width: 5%">상태</th>
      <th scope="col" style="width: 5%">순위</th>
      <th scope="col" style="width: 10%">시작일</th>
      <th scope="col" style="width: 10%">마감일</th>
      <th scope="col" style="width: 35%">내용</th>
    </tr>
  </thead>
  <tbody class="list">
  </tbody>
  
</table>


  </div>
  </div>
  </div>
  </div>
<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>