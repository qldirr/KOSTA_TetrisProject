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

	/* 결재자 등록 버튼 이벤트 함수 */
	var button = (function(){
		
		function add(employeeId, info){
			memberListId.push(employeeId);
			memberList.push(info);

			var sequence = memberListId.length;
			$('#member' + sequence).text(info);
			
		}

		function del(employeeId, info) {

			var delId = memberListId.indexOf(employeeId);
			var delInfo = memberList.indexOf(info);
			memberListId.splice(delId, 1);
			memberList.splice(delInfo,1);

			var sequence = memberListId.length;
			for(let memberInfo of memberList){
				$('#member' + sequence).text(memberInfo);
				$('#member' + (sequence + 1)).empty();
			}

		}
		
		function reset(){
			
			/* 결재자 배열 비우기 */
			memberListId.splice(0);
			memberList.splice(0);
			
			$('input:checkbox').each(function() {
				$(this).prop('checked', false);
				$('.members').empty();
			})
			
		}
		
		function insertMember(){

			$(".first", opener.document).val(memberList[0]);
			$(".second", opener.document).val(memberList[1]);
			$(".third", opener.document).val(memberList[2]);
			$(".fourth", opener.document).val(memberList[3]);
			$("#lineIds", opener.document).val(memberListId);
			$("#lines", opener.document).val(memberList);

			window.close();
			
		}
		
		
		return {
			add : add,
			del : del,
			reset : reset,
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

		$("#memberRegBtn").on('click', button.add);

		$("#cancelBtn").on('click', button.reset);
		
		$("#lineInsertBtn").on('click', button.insertMember);

		$('input:checkbox[name=ename]').on('click', function(){

			var employeeId = $(this).val();
			var info = $(this).next('label').text();

			var checkFunc = $(this).is(":checked")? button.add : button.del;
			checkFunc(employeeId, info);

		})


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
								<strong>${dept.name}</strong>
								<ul>
									<c:forEach items="${employees}" var="employees">
										<c:if test="${employees.department.id eq dept.id}">
											<li><input type="checkbox" name="ename"
													   value="${employees.id}"><label>[${employees.position}]${employees.name}</label></li>
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