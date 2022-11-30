<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/resources/vender/bootstrap/css/bootstrap.min.css">
<style type="text/css">

	.uploadResult {
		width: 100%;
		background-color: #f5f5f5;
	}

	.uploadResult ul {
		background-color: #f5f5f5;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}

	.uploadResult ul li {
		list-style: none;
		padding: 10px;
		align-content: center;
		text-alingn: center;
		cursor: pointer;
	}

	.uploadResult ul li img {

		width: 200px;

	}

	.replies li {

		list-style: none;
	}

	#board {
		border: 1px solid;
	}


	#contentsBox{
		height: 450px;
		overflow-y: scroll;
	}

	#contentsBox::-webkit-scrollbar {
		display: none;
	}

</style>
<script src="https://kit.fontawesome.com/7264476d39.js" crossorigin="anonymous"></script>
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
	type="text/javascript"></script>
<script src="/resources/vender/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>


<script type="text/javascript">
	var pb_num = '';
	/* 댓글 서비스를 제공하는 함수 */
	var replyService = (function() {

		/* 댓글 추가 */
		function add(reply, callback, error) {
			$.ajax({
				url : '/projectdetail/registerReply/' + reply.boardId,
				type : 'post',
				data : JSON.stringify(reply),
				dataType : 'json',
				cache : false,
				contentType : "application/json"
			}).done(function(data, textStatus, xhr) {

				/* 댓글 추가 성공시 해당 글의 댓글 부분만 load */
				$("#pr_contents" + pb_num).val('');
				
				$("#" + pb_num).load(location.href + " #reply" + pb_num);

				/* id="reply${b.pb_num}" */

			}); /* end ajax */
		} /* end function add */

		/* 댓글 삭제 */
		function del(reply, callback, error) {

			$.ajax({
				url : '/projectdetail/removeReply/' + reply.boardId + "/" + reply.replyId,
				type : 'delete',
				dataType : 'json',
				contentType : "application/json"
			}).done(function(data, textStatus, xhr) {

				/* 댓글 삭제 성공시 해당 글의 댓글 부분만 load */
				$("#" + pb_num).load(location.href + " #reply" + pb_num);
			}) /* end ajax */
		} /* end function del */
		return {
			add : add,
			del : del
		};
	})();

	/* 첨부파일 서비스를 제공하는 함수 */
	var attachService = (function() {

		/* 첨부파일 다운로드 */
		function download(path) {

			self.location = "/projectdetail/download?fileName=" + path;

		}/* end function download */

		return {
			download : download
		};

	})();
	


	$(document).ready(
			function() {
			

				/*var pj_num = '<c:out value="${pj_num}"/>';

				attachService.get(pj_num, function(result) {
					console.log(result);
				});*/


				
				$(document).on('click', 'input[name=replyRegBtn]', function() {
					
					pb_num = $(this).closest('.replyContents').attr('id');
					pb_contents = $('#boardContents' + pb_num).text().substr(2, 12);
					pr_writer = '2';
					
					
					var reply = {
						"writerId" : pr_writer,
						"contents" : $('#pr_contents' + pb_num).val(),
						"boardId" : pb_num
					};
					replyService.add(reply, function(result) {
						console.log(result);
					})
					
					
					/*var alarm_id = ($('#boardWriter' + pb_num)).text().trim();
					
					var alarm = {
						
						e_id : alarm_id,
						al_type : "댓글",
						al_contents : "작성글 \"" + pb_contents + "...\"에 댓글이 달렸습니다."
					}
					
					
					$.ajax({
						url : '/notification/register',
						type : 'post',
						data : JSON.stringify(alarm),
						contentType: 'application/json'
					}).done(function() {
						
						console.log("전송 완료");
						console.log(alarm_id);
						if(socket){
							var socketMsg = "reply," + alarm_id + "," + "작성글 \"" + pb_contents + "...\"에 댓글이 달렸습니다." + "," + ${pj_num};
							
							console.log("msg: " + socketMsg);
							socket.send(socketMsg);
						}

						
					}) /!* end ajax *!/*/
					

				});

				$(document).on('click', 'span[name=replyDelBtn]', function() {
					var pr_num = $(this).parent().attr('id');
					pb_num = $(this).closest('.replyContents').attr('id');


					var reply = {
						replyId : pr_num,
						boardId : pb_num
					};

					replyService.del(reply)

				});

				$('.uploadResult').on(
						'click',
						'li',
						function(e) {

							var liObj = $(this);
							var path = encodeURIComponent(liObj.data("path")
									+ "/" + liObj.data("uuid") + "_"
									+ liObj.data("filename"));
							attachService.download(path);

						})

			});
</script>

</head>
<body>
<div class="wrap">
		<%--<jsp:include page="../includes/header.jsp"></jsp:include>--%>
			<!-- 보조메뉴바 시작 -->
				<div class="s-menu">
				<div class="s-menu-title">
					<p>프로젝트 <i class="bi bi-clipboard-data"></i>
				</div>
				<div class="s-list-item ">
				    <input id="newbtn" type="button" value="새 글쓰기" onclick="self.location = '/projectdetail/register';">
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

			<input type="hidden" id="pj_num" name="pj_num" value="${project.id}">
			<br><br>
			<h5>${project.name }</h5>
			<h2 id="c-title">글 목록</h2>
			<div class="contents_wrap">
			<form action="/projectdetail/ + ${project.id}" method="get">
			<input type="text" name="searchkey" placeholder="검색 내용 입력" style="border: 1px solid #c0c0c0;">
			<input type="submit" id="search" value="검색" style="background-color: #f5f5f5; color: #161E67; border-radius: 5px; border-style: none; padding: 5px;"><br><br>
			</form>


	<div id="contentsBox">
			<div class="board">
				<div class="boardContents">
					<c:forEach items="${boards}" var="b">
						<div class="media">
							<i id="usericon" class="fa-regular fa-circle-user fa-2x"></i>
							<div class="media-body">
								<h5 class="mt-0" id="boardWriter${b.id}">&nbsp;&nbsp;${b.writer.name}</h5>
								<p id="boardContents${b.id}">&nbsp;&nbsp;${b.contents }</p><br>
								<div id='uploadResult${b.id}' class='uploadResult'>
									<ul>
										<c:if test="${b.boardAttachDtos != null }">
											<c:forEach items="${b.boardAttachDtos}" var="attach">
												<li data-path="${attach.attachPath}" data-filename="${attach.attachName}" data-type="${attach.type}">
													<c:choose>
														<c:when test="${attach.type eq 'image'}">
															<div>
																<img src='/display?fileName=/s_${attach.attachName}'>
															</div>
														</c:when>
														<c:otherwise>
															<div>
																<img src='/resources/img/attachfile.png' style='width: 30px;'>
																<span>${attach.oriAttachName}</span>
															</div>
														</c:otherwise>
													</c:choose>
												</li>
											</c:forEach>
										</c:if>
									</ul>
								</div>
		
		
							</div>
						</div>
		
						<div id="${b.id}" class="replyContents">
							<div id="reply${b.id}" class="boardReplies">
								<ul class="replies">
									<c:forEach items="${replies}" var="r">
										<c:if test="${b.id eq r.boardId }">
											<li><i id="usericon" class="fa-regular fa-circle-user fa-2x"></i> ${r.writer.name}:
												${r.contents}
												<c:if test="${r.writer.id eq 2 }">
													<button type="button" class="close" id="${r.id}" aria-label="Close">
  															<span aria-hidden="true" name="replyDelBtn" >&times;</span>
													</button>
												</c:if>
												<%--<c:set var="now" value="${r.pr_moddate}" />
												<c:set var="sysYear">
												<fmt:formatDate value="${now}" pattern="yy-MM-dd hh:mm" /></c:set>
												<span style="float:right; margin-right: 3px;"><c:out value="${sysYear}" /></span>--%>
												</li>
										</c:if>
									</c:forEach>
								</ul>
									<div class="form-group">
    									<textarea class="form-control" id="pr_contents${b.id}" name="contents" rows="3" placeholder="댓글을 입력하세요."></textarea>
  									</div>
									<input type="button" id="replyReg${b.id}" name="replyRegBtn" value="등록" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px; float: right; margin-right: 10px;"><br>
									<br>
								
							</div>
						</div>
						<hr>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
	</div>
</div>
<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>