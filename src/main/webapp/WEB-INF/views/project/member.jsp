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
	width: 200px;
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


	var memberListId = [];
	var memberList = [];
	var tmp = "";
	
	/* 프로젝트 멤버 등록 페이지 버튼 이벤트 함수 */
	var button = (function(){
		
		function deptCheck(){
			$(this).nextAll().find('input[type=checkbox]').prop('checked', true);
		}
		
		function add(){
			
			/* 프로젝트 참여자 배열 비우기 */
			memberListId.splice(0);
			memberList.splice(0);
			
			var checkedMember = $('input:checkbox[name=ename]:checked').length;
			
			$('input:checkbox[name=ename]:checked').each(function() {
				memberListId.push(this.value);
				memberList.push($(this).next('label').text());
			});

			for (var i = 0; i <= checkedMember; i++) {
				$('#member' + (i + 1)).text(memberList[i]);
			}
			
		}
		
		function del(){
			
			/* 프로젝트 참여자 배열 비우기 */
			memberListId.splice(0);
			memberList.splice(0);
			
			$('input:checkbox').each(function() {
				$(this).prop('checked', false);
				$('.members').empty();
			})
			
		}
		
		function insertMember(){
			
			var managerId = '<sec:authentication property="principal.username"/>';

			memberListId.push(managerId);
			
			/* 추가된 사원의 아이디와 임시 프로젝트 참여 리스트 값을 전달 */
			$.ajax({
				url: '/project/member',
				type: 'post',
				data: JSON.stringify({"pl_num": tmp, "pmembers" : memberListId}),
		        contentType: "application/json",
				success: function(){
					$("#pj_members", opener.document).val(memberList);
					window.close();
				}, error: function(er){
					alert("참여자 등록 실패");
				}
			}); /* end ajax */
			
		}
		
		
		return {
			deptCheck : deptCheck,
			add : add,
			del : del,
			insertMember : insertMember
		}
		
	})();


	$(function() {
	
		/* 프로젝트 매니저 아이디를 임시 프로젝트 참여 리스트 번호로 받음 */
		tmp = $( "#pj_manager", opener.document ).val();
		
		$("#tree").treeview({
			collapsed : false,
			animated : "medium",
			control : "#sidetreecontrol",
			persist : "location"
		});

		$('input:checkbox[name=dname]').on('click', button.deptCheck);

		$("#memberRegBtn").on('click', button.add);

		$("#cancelBtn").on('click', button.del);
		
		$("#memberInsertBtn").on('click', button.insertMember);

	})
	
</script>
</head>
<body>
 <h2 id="c-title">프로젝트 멤버 추가</h2>
	<table>
		<tr>
			<td class="listTable">사원목록</td>
			<td id="buttonPart" rowspan="12"><input type="button" id="memberRegBtn" value="＞" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px;"></td>
			<td class="listTable">참여자</td>
		</tr>
		<tr>
			<td rowspan="11">
			
				<div id="sidetree">
					<div class="treeheader">&nbsp;</div>
					<div id="sidetreecontrol">
						<a href="?#">목록접기</a> | <a href="?#">목록펼치기</a>
					</div>
					<ul id="tree">
					<c:forEach items="${dept}" var="dept">
							<li>
							<input type="checkbox" name="dname" value="${dept.d_name}">
							<strong>${dept.d_name}</strong>
							<ul>
								<c:forEach items="${employees}" var="employees">
									<c:if test="${employees.d_num eq dept.d_num}">
										<li><input type="checkbox" name="ename"
												value="${employees.e_id}"><label>[${employees.e_position}]${employees.e_name}</label></li>
									</c:if>
								</c:forEach>
							</ul>
							</li>
					</c:forEach>
					</ul>
				</div>

			</td>
		<tr>
			<td class="members" id="member1"></td>
		</tr>
		<tr>
			<td class="members" id="member2"></td>
		</tr>
		<tr>
			<td class="members" id="member3"></td>
		</tr>
		<tr>
			<td class="members" id="member4"></td>
		</tr>
		<tr>
			<td class="members" id="member5"></td>
		</tr>
		<tr>
			<td class="members" id="member6"></td>
		</tr>
		<tr>
			<td class="members" id="member7"></td>
		</tr>
		<tr>
			<td class="members" id="member8"></td>
		</tr>
		<tr>
			<td class="members" id="member9"></td>
		</tr>
		<tr>
			<td class="members" id="member10"></td>
		</tr>
	</table>
	<br>
	<input type="button" id="cancelBtn" value="초기화" style="background-color: #f5f5f5; color: #161E67; border-radius: 5px; border-style: none; padding: 5px; margin-left: 5px;">
	<input type="button" id="memberInsertBtn" value="등록" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px; float:right; margin-right: 5px;">
</body>
</html>