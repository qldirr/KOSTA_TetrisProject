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
				<h2 id="c-title">익명 건의사항</h2>
		<div class="container-fluid ">
		      <div class="row">
		      
		         <!-- sidebar -->
   
		<div style="width: 100%; height: 1000;">


        <form role="form" method="post">   

          <div class="form-group">
            <label>아이디</label> <input class="form-control" name='e_id' size=120
            value='<c:out value="${suggestions.e_id}"/>' readonly="readonly">
          </div>

          <div class="form-group">
            <label>제목</label> <input class="form-control" name='s_title'
            value='<c:out value="${suggestions.s_title}"/>' readonly="readonly">
          </div>

          <div class="form-group">
            <label>내용</label> <input class="form-control" name='s_contents' style="height:200px"
            value='<c:out value="${suggestions.s_contents}"/>' readonly="readonly">
          </div>


		<button type="button" class="btn btn-info" id="button"
		onclick="location.href='/suggestions/suggestionsmodify?s_num=<c:out value="${suggestions.s_num}"/>'"> <!-- 온클릭 이벤트, 번호 받아서 전달 -->
		수정</button>

		<button type="button" class="btn btn-info" id="button" 
		onclick="location.href='/suggestions/suggestionslist'">
		리스트</button>

    <style>
        #button{
            margin-left:5px;
        }
    </style>
	
	<form id='operForm' action="/suggesiotns/suggesiotnsmodify" method="get">
		<input type='hidden' id='s_num' name='s_num' value='<c:out value="${suggesiotns.s_num}"/>'>
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
		<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	</form>




<div class='row'>  <!-- 댓글기능 -->

	<div class ="col-lg-12">
		<div class="panel panel-default">
	<div class="panel-heading">	
 		<i class="fa fa-comments fa-fw"></i><br>
 			<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right' >댓글작성</button>  
	</div>
			
			<div class="panel-body">
			
		<ul class="chat">
		<li class="left clearfix" data-row='12'>
			<div>
		<div class="header">
			<strong class="primary-font">Reply</strong>
			<small class="pull-right text=muted">Reply</small>
		</div>
		<p>Reply</p>
	</div>
					</li>
				</ul>
			</div>	
		</div>
	</div>
</div>

    <style>
        #addReplyBtn{
            margin-left:20px;
        }
    </style>
    

                         
                           
                           
 <!-- Modal : 모달창을 통해 댓글 기능 추가--> 
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
 aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog">
         <div class="modal-content">
         
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" 
                 aria-hidden="true">&times;</button>
                 <h4 class="modal-title" id="myModalLabel"/>
             </div>
             
             <div class="modal-body">        
                  
             <div class="form-group">
             <!-- <label>Replyer</label>
             <input class="form-control" name="r_replyer" value='New Replyer'> 
             </div> -->
             
             <div class="form-group">
             <label>Reply</label>                                        
             <input class="form-control" name="r_reply" value='reply'>
             </div>
             
             <div class="form-group">
             <label>Reply Date</label>                                        
             <input class="form-control" name="replyDate" value=''>
             </div>                                                                                
             </div>   
                        
             <div class="modal-footer">
<button id='modalModBtn' type="button" class="btn btn-info">Modify</button>
<button id='modalRemoveBtn' type="button" class="btn btn-info">Remove</button>
<button id='modalRegisterBtn' type="button" class="btn btn-info">Register</button>
<button id='modalCloseBtn' type="button" class="btn btn-info">Close</button>                                        
                        </div>
                   
                    </div>
                </div>
            </div>
    
    


</form>

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action","suggestions/suggestionsmodify").submit();
		})
	
		
	var s_numValue = '<c:out value="${suggestions.s_num}"/>';
	var replyUL = $(".chat");
	
	showList(1);
	
	function showList(page){
		
		replyService.getList({s_num:s_numValue,page: page|| 1}, function(list) {
			
			var str="";
			if(list == null || list.length == 0){
				replyUL.html("");
				
				return;
			}			
			
			for(var i =0, len = list.length || 0; i < len; i++){
				str +="<li class='left clearfix' data-r_num='"+list[i].r_num+"'>";
				str +="<div><div class='header'><strong class='primary-font'>"+list[i].r_replyer+"</strong>";
				str +="<small class='pull-right text-muted'>"+replyService.displayTime(list[i].r_regdate)+"</small></div>";
				str +="<p>"+list[i].r_reply+"</p></div></li>";
			}
			replyUL.html(str);
		});
		
	}//end showlist
	
	

		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='r_reply']");
		var modalInputReplyer = modal.find("input[name='r_replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		$("#modalCloseBtn").on("click", function(e){
			modal.modal('hide');
		});
		
	$("#addReplyBtn").on("click", function(e){
		
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id !='modalCloseBtn']").hide();
		
		modalRegisterBtn.show();

		$(".modal").modal("show");
		
		
		});
	
	
	modalRegisterBtn.on("click", function(e){
		
		var reply = {
			r_reply: modalInputReply.val(),
			r_replyer:modalInputReplyer.val(),
			s_num:s_numValue 
		};
		
	replyService.add(reply, function(result){
	   
		   alert(result);
	   
		   modal.find("input").val("");
		   modal.modal("hide");
	   
		   showList(1);  
		});
	});    	
	
});
	
</script>

</div>
</div>
</div>
</div>

			</div>

			<!-- 내용 끝 -->

		<!-- 전체 wrapper 끝 -->
		<!--<jsp:include page="../includes/footer.jsp"></jsp:include>--> 
	
</body>

</html>


