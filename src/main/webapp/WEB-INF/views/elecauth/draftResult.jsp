<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/vender/bootstrap/css/bootstrap.min.css" >
<script src="/resources/vender/jquery/jquery-3.6.1.min.js" type="text/javascript"></script>
<style type="text/css">

.signDoc{

	background-color: #E0E0E0; 
	color: #161E67; 
	border-radius: 5px; 
	border-style: none; 
	padding: 5px; 
	float: right; 
	
}

.signDoc:hover{

	background-color: #161E67; 
	color: #E0E0E0; 
	
}


table{
	margin-left: 100px;
}


</style>
<script type="text/javascript">

var lineService = function(){
	
	function update(line){
		
		$.ajax({
			url : '/elecauth/check',
			type : 'post',
			data : JSON.stringify(line),
			contentType : "application/json"
		}).done(function() {
			console.log("전달 성공");
			self.location = '/elecauth/uncheckedList';
		}); /* end ajax */
	} /* end function update */
	
	return { update : update }
	
}();


$(function(){
	
			$('#signDraft').hide();
			$('#modifyDoc').hide();
			$('#main').on('click', function(){
				self.location = "/elecauth/main";
			})
			
			var referrer = document.referrer;
			
			if(referrer.endsWith('uncheckedList')){
				$('#signDraft').show();
			} else if(referrer.endsWith('disapprovedList')){
				$('#modifyDoc').show();
			}
			
			
			$('.signDoc').on('click', function(){
				
				var status = $(this).val();
				status = (status == '승인')? '결재완료' : '반려';
				
				var e_id = '${userId}';
				var l_num = '${auth.el_num }';
				
				var line = {
						"l_num" : l_num,
						"e_id" : e_id, 
						"l_status" : status
					}
				
				lineService.update(line);
				
			})
			
			
			$('.modify').on('click', function(){
				
				var el_num = '${auth.el_num }';
					
				self.location = '/elecauth/modify/' + el_num;
			
		
			})

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
			
			
		<div class="s-container">
			<h2 id="c-title">내 작성 문서</h2><br>


<span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><!-- default copy start --><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
  
<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;"><!-- Header --> 
   <colgroup> 
    <col width="310"> 
    <col width="490"> 
   </colgroup> 
   
	<tbody>
		<tr>
			<td style="background: rgb(255, 255, 255); padding: 0px !important; border: 0px currentColor; border-image: none; height: 70px; text-align: center; color: black; font-size: 30px; font-weight: bold; vertical-align: top;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
일&nbsp;&nbsp;반&nbsp;&nbsp;기&nbsp;&nbsp;안&nbsp;&nbsp;서
			</td>
		</tr>
		<tr>
			<td style="background: white; padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
				
<table class="__se_tbl" style="background: white; margin: 0px; border: 1px solid black; border-image: none; color: black; font-family: malgun gothic,dotum,arial,tahoma; font-size: 12px; border-collapse: collapse !important;"><!-- User --> 
     
	<tbody>
		<tr>
			<td style="width: 100px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #F5F5F5; padding: 3px !important;">
				기안자
			</td>
			<td style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="0" data-dsl="{{label:draftUser}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item">
					<div id="draftWriter" class="docWriter">${auth.e_name}</div>
				</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="0"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
			</td>
		</tr>
		<tr>
			<td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #F5F5F5;">
				기안부서
			</td>
			<td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
					<div id="draftWriterDept">개발부</div>
			</td>
		</tr>
		<tr>
			<td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #F5F5F5;">
				기안일
			</td>
			<td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="2" data-dsl="{{label:draftDate}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item">
					<div id="draftRegDate" class="docRegdate"><c:set var="now" value="<%=new java.util.Date()%>" /><c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set><c:out value="${sysYear}" /> </div>
				</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="2"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
			</td>
		</tr>
		<tr>
			<td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #F5F5F5;">
				문서번호
			</td>
			<td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{label:docNo}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item">
					<div id="draftNum">일반기안-${auth.el_num }</div>
				</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
			</td>
		</tr>
	</tbody>
</table>

<!-- 2.2 Draft Line (start) -->
        
 
<br>
			</td>
			<td style="background: white; padding: 0px !important; border: currentColor; text-align: center; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
				 <div id="drafElecline" style="float: right">
					<table border="1px solid">
						<tr class="linePosition">
							<c:forEach items="${line}" var="position">
							<td style="width: 60px;">${position.e_position}</td>
							</c:forEach>
						</tr>
						<tr class="lineName" style="height:50px;">
							<c:forEach items="${line}" var="id">
							<td> ${id.e_name}</td>
							</c:forEach>
						</tr>
						<tr class="lineStatus">
							<c:forEach items="${line}" var="status">
							<td><strong>${status.l_status}</strong></td>
							</c:forEach>
						</tr>
					</table>
					</div>
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span><span contenteditable="false" class="comp_hover" data-content-protect-cover="true" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span></span><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><br>
			</td>
		</tr>
	</tbody>
</table>
 
 
<table style="border: 1px solid; width: 800px; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse; height: 385px;"><colgroup> 
   <col width="140"> 
   <col width="660"> 
  </colgroup> 
  
	<tbody>
		<tr>
			<td style="background: #F5F5F5; padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
								
제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px;border:1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{text:subject}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype="">
		
				<c:out value="${auth.el_name}"/>
				<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
			</td>
		</tr>
		<tr>
			<td style="background: #F5F5F5; padding: 5px;border:1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;" colspan="2">
				
상&nbsp;&nbsp;세&nbsp;&nbsp;내&nbsp;&nbsp;용
			</td>
		</tr>
		<tr>
			<td style="background: rgb(255, 255, 255); padding: 5px;border:1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2">
				<textarea id="draftText" class="docText" style="width: 800px; height:500px; resize: none; border: none;">${auth.el_contents }</textarea>
			</td>
		</tr>
	</tbody>
</table>
</span></span>
<p style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;"><br></p>


<div id="signDraft">
	<input type="button" class="signDoc" id="approvalDraft" value="승인" style="margin-right:50px;">
	<input type="button" class="signDoc" id="disapprovalDraft" value="반려" style="margin-right:10px;"><br>
</div>

<div id="modifyDoc">
	<input type="button" class="modify" value="문서수정" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px; float: right; margin-right:80px;">
</div>
</div>
</body>
</html>