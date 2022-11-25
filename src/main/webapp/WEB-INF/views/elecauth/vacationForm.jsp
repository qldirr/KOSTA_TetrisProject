<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.__se_tbl {
	margin-left: 100px;
}

</style>
</head>
<body>

<table class="__se_tbl" style="width: 800px; border-collapse: collapse !important; color: black; background: white; border: 0px solid black; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;"><!-- Header --> 
 
	<tbody>
		<tr>
			<td style="width:300px; padding: 3px !important; border: 0px solid black; height: 90px !important; font-size: 30px; font-weight: bold; text-align: center; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				연&nbsp;&nbsp;차&nbsp;&nbsp;신&nbsp;&nbsp;청&nbsp;&nbsp;서
			</td>
		</tr>
		<tr>
			<td style="width:300px; border: 0; padding: 0 !important" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
<table class="__se_tbl" style="background: white; margin: 0px; border: 1px solid black; border-image: none; color: black; font-family: malgun gothic,dotum,arial,tahoma; font-size: 12px; border-collapse: collapse !important;"><!-- User --> 
     
	<tbody>
		<tr>
			<td style="width: 100px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #F5F5F5; padding: 3px !important;">
				기안자
			</td>
			<td style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="0" data-dsl="{{label:draftUser}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item">
					<div id="vacationWriter" class="docWriter">${userName }</div>
				</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="0"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
			</td>
		</tr>
		<tr>
			<td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #F5F5F5;">
				기안부서
			</td>
			<td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item">
					<div id="vacationWriterDept">개발부</div>
				</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
			</td>
		</tr>
		<tr>
			<td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #F5F5F5;">
				기안일
			</td>
			<td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="2" data-dsl="{{label:draftDate}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item">
					<div id="vacationRegDate" class="docRegdate"><c:set var="now" value="<%=new java.util.Date()%>" /><c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set><c:out value="${sysYear}" /></div>
				</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="2"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
			</td>
		</tr>
		<tr>
			<td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #F5F5F5;">
				문서번호
			</td>
			<td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{label:docNo}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item">
					<div id="vacationNum">
					
					</div>
				</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
			</td>
		</tr>
	</tbody>
</table>
 
<br>
 
<table style="width: 800px; margin-left: 0px; margin-top : 0px; border-collapse: collapse !important; color: black; background: white; border: 1px solid black; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;">
	<tbody>
		<tr>
			<td style="background: #F5F5F5; padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
				제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
			</td>
			<td style="padding: 3px; border: 1px solid black; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px;  vertical-align: middle; background: rgb(255, 255, 255);">
				<span id="restPointArea" style="font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
				<div id="vacationTitle" class="docTitle">연차 신청의 건</div><span id="applyPointArea" style="font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
			</td>
		</tr>
		<tr>
			<td style="background: #F5F5F5; padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
				기간/일시
			</td>
			<td style="padding: 3px; border: 1px solid black; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px;  vertical-align: middle; background: rgb(255, 255, 255);">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{calendar:startDate}}" data-wrapper="" style="" data-value="" data-autotype="">
				<input id="vacationStart" type="text" class="datePicker">
				<span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="4"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;~&nbsp; <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{calendar:endDate}}" data-wrapper="" style="" data-value="" data-autotype="">
				<input id="vacationEnd" type="text" class="datePicker">
				<span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="5"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> <span id="usingPointArea"></span> 
			</td>
		</tr>
		<tr>
			<td style="background: #F5F5F5; padding: 5px; border: 1px solid black; height: 80px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
				<b style="color: rgb(255, 0, 0);">*</b>&nbsp;휴가&nbsp;사유 
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px;border:1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2">
				<textarea id="vacationText" class="docText" style="width: 700px; height:200px; resize: none; border: none;"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="width:800px; padding: 20px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; background: #F5F5F5;">
				 1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다. 단, 최초 입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다.<br> 2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br> 3. 공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출 
			</td>
		</tr>
	</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<br>
</body>
</html>