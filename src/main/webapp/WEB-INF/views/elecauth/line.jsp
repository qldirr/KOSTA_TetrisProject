<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

#Row {
	width: 80px;
	font-size: 18px;
	font-weight: bold;
	background-color: #FFF2CA; 
	color: #161E67;
	text-align: center;
}


table {
	font-size: 15px;
	margin-left: 16px;
	margin-top: 5px;
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

.number{
	text-align: center;
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
			
			/* 결재자 배열 비우기 */
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
			
			/* 결재자 배열 비우기 */
			memberListId.splice(0);
			memberList.splice(0);
			
			$('input:checkbox').each(function() {
				$(this).prop('checked', false);
				$('.members').empty();
			})
			
		}
		
		function insertMember(){
			

			/* 추가된 사원의 아이디와 임시 결재라인 값을 전달 */
			$.ajax({
				url: '/elecauth/line',
				type: 'post',
				data: JSON.stringify({"l_num": tmp, "lines" : memberListId}),
		        contentType: "application/json",
				success: function(){
					
					$(".first", opener.document).val(memberList[0]);
					$(".second", opener.document).val(memberList[1]);
					$(".third", opener.document).val(memberList[2]);
					$(".fourth", opener.document).val(memberList[3]);
					
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
		
		tmp = '${userId}';
		
		$("#tree").treeview({
			collapsed : false,
			animated : "medium",
			control : "#sidetreecontrol",
			persist : "location"
		});

		$('input:checkbox[name=dname]').on('click', button.deptCheck);

		$("#memberRegBtn").on('click', button.add);

		$("#cancelBtn").on('click', button.del);
		
		$("#lineInsertBtn").on('click', button.insertMember);

	})
	
</script>
</head>
<body>
	<table>
		<tr>
			<td class="listTable">사원목록</td>
			<td id="buttonPart" rowspan="12"><input type="button" id="memberRegBtn" value="＞" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px;"></td>
			<td id="Row"> 결재순번 </td>
			<td class="listTable">결재자</td>
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
			</tr>
		<tr>
			<td class="number">1</td>
			<td class="members" id="member1"></td>
		</tr>
		<tr>
			<td class="number">2</td>
			<td class="members" id="member2"></td>
		</tr>
		<tr>
			<td class="number">3</td>
			<td class="members" id="member3"></td>
		</tr>
		<tr>
			<td class="number">4</td>
			<td class="members" id="member4"></td>
		</tr>
	</table>
	<br>
	<input type="button" id="cancelBtn" value="초기화" style="background-color: #f5f5f5; color: #161E67; border-radius: 5px; border-style: none; padding: 5px; margin-left: 5px;">
	<input type="button" id="lineInsertBtn" value="등록" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px; float:right; margin-right: 5px;">
</body>
</html>