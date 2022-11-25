<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/vender/bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker3.css" />
<script src="/resources/vender/jquery/jquery-3.6.1.min.js" type="text/javascript"></script>
<script src="/resources/lib/bootstrap-datepicker.js" type="text/javascript" defer></script>

<style type="text/css">

.elecLine{

margin-left: 100px;
}

</style>
<script type="text/javascript">


var checkDocType = {
		
	"일반기안" : "draft",
	"연차신청" : "vacation"
	
}

function checkForm(docType) {
	return checkDocType[docType];
}

function showForm(docType){
	showDocTypeMap[docType]();
}

function sendForm(docType, document){
	sendDocMap[docType](document);
}

var docService = function(){
	
		function add(document){
			
			$.ajax({
				url : '/elecauth/register',
				type : 'post',
				data : JSON.stringify(document),
				contentType : "application/json"
			}).done(function() {
				console.log("전달 성공")
				$('.first').val('');
				$('.second').val('');
				$('.third').val('');
				$('.fourth').val('');
				
				self.location = "/elecauth/document/0";
			}); /* end ajax */
		} /* end function add */
		
		return { add : add }
		
}();
	


var showDocTypeMap = {
	
	draft(){
		
		if($('.docForm').is(':visible')){
			$('.docForm').hide();
		}
		
		$('#draft').show(); 
		
	},
	
	
	vacation(){
		
		if($('.docForm').is(':visible')){
			$('.docForm').hide();
		}
		
		$('#vacation').show(); 
		
	}

}


var sendDocMap = {
	
		draft(document){ docService.add(document); },
		vacation(document){ docService.add(document); }
}


$(function(){
	
	$('#draft').hide();
	$('#vacation').hide();
	$('.elecLine').hide();

	$('.docType').on('change', function(){
		
		var docType = $(this).val();
		showForm(checkForm(docType));
		$('.elecLine').show();
		
	})
	
	$('.datePicker').datepicker({
		format: "yyyy-mm-dd",
		autoclose: true
	});
	
	$(".regLineBtn").on("click", function() {
		
		if($('.docForm').is(':visible') == false){
			alert("문서를 먼저 작성하세요.")
		} else {
			var child;
			child = window.open("/elecauth/line", "_blank",
					"width=500, height=450");
		}
				
	});
	 
	
	$('.sendBtn').on("click", function(){
		
		if($('#draft').is(':visible')){
			
			el_name = $('#draftTitle').val();
			el_contents = $('#draftText').val();
			el_regdate = $('#draftRegDate').text();
			e_id = '${userId}';
			
			docType = "일반기안";
			var document = {
					"el_name" : el_name,
					"el_contents" : el_contents,
					"el_startdate" : "",
					"el_enddate" : "",
					"el_regdate" : el_regdate,
					"e_id" : e_id,
					"dm_num" : 1
			}
			
			sendForm(checkForm(docType), document);
			
			
		} else if($('#vacation').is(':visible')){
			
			el_name = $('#vacationTitle').text();
			el_contents = $('#vacationText').val();
			el_regdate = $('#vacationRegDate').text();
			el_startdate = $('#vacationStart').val();
			el_enddate = $('#vacationEnd').val();
			e_id = '${userId}';
			
			docType = "연차신청";
			var document = {
					"el_name" : el_name,
					"el_contents" : el_contents,
					"el_startdate" : el_startdate,
					"el_enddate" : el_enddate,
					"el_regdate" : el_regdate,
					"e_id" : e_id,
					"dm_num" : 2
			}
			
			sendForm(checkForm(docType), document);
			
		}
		
		
	});
	
})


</script>
</head>
<body>
	<jsp:include page="../includes/header.jsp"></jsp:include>
			<!-- 보조메뉴바 시작 -->
			
			<div class="s-menu">
				<div class="s-menu-title">
					<p>전자결재 <i class="bi bi-tags"></i>
				</div>
				<div class="s-list-item ">
				    <input id="newbtn" type="button" value="새 문서 작성" onclick="self.location = '/elecauth/register';">
				</div><br>
				<div class="s-list-item ">
					<a href="/elecauth/writtenList">상신문서함</a>
				</div>
				<div class="s-list-item ">
					<a href="/elecauth/uncheckedList">결재대기문서</a>
				</div>
				<div class="s-list-item ">
					<a href="/elecauth/disapprovedList">반려문서함</a>
				</div>
				<div class="s-list-item ">
					<a href="/elecauth/sendList">발신문서함</a>
				</div>
				<div class="s-list-item ">
					<a href="/elecauth/getList">수신문서함</a>
				</div>
			</div>
			
			
		<div class="s-container"><br>
			<h2 id="c-title">새 문서 작성하기</h2><br>

				<select id="docType" class="docType" >
					<option value="none"> 문서 선택</option>
					<option value="일반기안"> 일반기안 </option>
					<option value="연차신청"> 연차신청 </option>
					<option value="지출결의"> 지출결의 </option>
					<option value="구매신청"> 구매신청 </option>
					<option value="출장보고"> 출장보고 </option>
				</select><br>

<div id="docContents">

<div id="draft" class="docForm">
<%@ include file="draftForm.jsp" %> 
</div>

<div id="vacation" class="docForm">
<%@ include file="vacationForm.jsp" %>
</div>
<%-- <div id="draft">
<%@ include file="draftForm.jsp" %> 
</div>
<div id="draft">
<%@ include file="draftForm.jsp" %> 
</div>
<div id="draft">
<%@ include file="draftForm.jsp" %> 
</div> --%>
</div>

<div class="elecLine" style="color: #161E67;">
<input type="button" class="regLineBtn" value="결재선 지정" style="background-color: #F5F5F5; color: #161E67; border-radius: 5px; border-style: none; padding: 5px;">
	&nbsp;❶&nbsp;<input type="text" class="first" readonly="readonly" style="width:150px"> 
	&nbsp;❷&nbsp;<input type="text" class="second" readonly="readonly" style="width:150px"> 
	&nbsp;❸&nbsp;<input type="text" class="third" readonly="readonly" style="width:150px"> 
	&nbsp;❹&nbsp;<input type="text" class="fourth" readonly="readonly" style="width:150px"> 
<br><br>
	<input type="button" class="sendBtn" value="상신" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px; float: right; margin-right:50px;">
</div>
</div>

</body>
</html>