<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.listTable {
	width: 450px;
	font-size: 18px;
	font-weight: bold;
	background-color: #161E67; 
	color: #FFF2CA;
	text-align: center;
}

.members {
	height: 30px;
}


table {
	font-size: 15px;
	margin-left: 5px;
}

td {
	border: 1px solid #c0c0c0;
}

#buttonPart{
	border: none;
}

a {
	text-decoration: none;
	color: #161E67;
}


</style>
<link rel="stylesheet" href="/resources/css/jquery.treeview.css" />
<link rel="stylesheet" href="/resources/css/screen.css" />

<script src="/resources/vender/jquery/jquery-3.6.1.min.js" type="text/javascript"></script>
<script src="/resources/lib/jquery.cookie.js" type="text/javascript"></script>
<script src="/resources/lib/jquery.treeview.js" type="text/javascript"></script>

<script type="text/javascript">


	var idList = [];
	
	var button = (function(){
		function insertMember(){
			
			idList.splice(0);
			
			var checkedMember = $('input:checkbox[name=ename]:checked').length;
			
			$('input:checkbox[name=ename]:checked').each(function() {
				idList.push(this.value);
			});
			
			var loginId = '<sec:authentication property="principal.username"/>';

			idList.push(loginId);
			
			var actionForm = $("#actionForm")
			
			var str = "";
			str += '<input type="hidden" name="idList" value=';
			str += idList;
			str += '>';
			actionForm.html(str);
			
			actionForm.attr("action", "/messanger/member").attr("method", "post");
			actionForm.submit();
		}
		
		
		return {
			insertMember : insertMember
		}
		
	})();


	$(function() {
		
		$("#tree").treeview({
			collapsed : false,
			animated : "medium",
			control : "#sidetreecontrol",
			persist : "location"
		});

		$("#memberInsertBtn").on('click', button.insertMember);

	})
	
</script>
</head>
<body>
 <h2 id="c-title">채팅멤버 추가</h2>
 <form action="/messanger/member" id="actionForm" method="post">
	<table>
		<tr>
			<td class="listTable">사원목록</td>
		</tr>
		<tr>
			<td rowspan="11">
				<div id="sidetree">
					<div class="treeheader">&nbsp;</div>
					<div id="sidetreecontrol">
						<a href="?#">목록접기</a> | <a href="?#">목록펼치기</a>
					</div>
					<ul id="tree">
					<c:forEach items="${listDept}" var="dept">
							<li>
							<input type="checkbox" name="dname" value="${dept.d_name}">
							<strong>${dept.d_name}</strong>
							<ul>
								<c:forEach items="${listEmp}" var="emp">
									<c:if test="${emp.d_num eq dept.d_num}">
										<li><input type="checkbox" name="ename"
												value="${emp.e_id}"><label>[${emp.e_position}]${emp.e_name}</label></li>
									</c:if>
								</c:forEach>
							</ul>
							</li>
					</c:forEach>
					</ul>
				</div>

			</td>
	</table>
	</form>
	<br>
	<input type="button" id="memberInsertBtn" value="대화하기" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px; float:right; margin-right: 5px;">
</body>
</html>