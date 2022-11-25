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
.uploadResult li {
	list-style: none;
	background-color: #f5f5f5;
	cursor: pointer;
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
				url : '/projectdetail/registerReply',
				type : 'post',
				data : JSON.stringify(reply),
				dataType : 'json',
				cache : false,
				contentType : "application/json"
			}).done(function(data, textStatus, xhr) {

				if (callback) {
					callback(data);
				}
				/* 댓글 추가 성공시 해당 글의 댓글 부분만 load */
				$("#pr_contents" + pb_num).val('');
				
				$("#" + pb_num).load(location.href + " #reply" + pb_num);

				/* id="reply${b.pb_num}" */

			}); /* end ajax */
		} /* end function add */

		/* 댓글 삭제 */
		function del(reply, callback, error) {
			$.ajax({
				url : '/projectdetail/removeReply',
				type : 'post',
				data : JSON.stringify(reply),
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

		/* 첨부파일 정보 */
		function get(pj_num, callback, error) {

			$
					.ajax({
						url : '/projectdetail/getAttachList',
						type : 'get',
						data : {
							pj_num : pj_num
						},
						contentType : "application/json"
					})
					.done(
							function(arr, textStatus, xhr) {

								if (callback) {
									callback(arr);
								}

								var str = "";
								var boardNum = [];
								var attachInfo = [];
								var attachBoardNum = [];

								$
										.each(
												arr,
												function(i, attach) {

													var attachPb_num = Object
															.keys(attach);
													var attachData = Object
															.values(attach);

													boardNum.push(attachPb_num);
													var finalBoard = boardNum
															.pop();

													for ( var i in attachData) {

														if (finalBoard == attachData[i]["pb_num"]) {
															attachInfo
																	.push(attachData[i]);
															attachBoardNum
																	.push(finalBoard);
														}
													}
												})

								for (var i = 0; i < attachInfo.length; i++) {

									if (attachBoardNum[i] == attachInfo[i].pb_num) {

										str += "<li data-path='"+attachInfo[i]["pf_path"]+"' data-uuid='" +attachInfo[i]["pf_uuid"]+"' data-filename='" +attachInfo[i]["pf_name"]+"'><div>";
										str += "<img src='/resources/img/attachfile.png'>";
										str += "<span>"
												+ attachInfo[i]["pf_name"]
												+ "</span><br>";
										str += "</div>";
										str += "</li>";

										$(
												"#uploadResult"
														+ attachInfo[i].pb_num
														+ " ul").append(str);
										str = "";

									}
								}

							}); /* end ajax */

		}/* end function get */

		/* 첨부파일 다운로드 */
		function download(path) {

			self.location = "/projectdetail/download?fileName=" + path;

		}/* end function download */

		return {
			get : get,
			download : download
		};

	})();
	


	$(document).ready(
			function() {
			

				var pj_num = '<c:out value="${pj_num}"/>';

				attachService.get(pj_num, function(result) {
					console.log(result);
				});


				
				$(document).on('click', 'input[name=replyRegBtn]', function() {
					
					pb_num = $(this).closest('.replyContents').attr('id');
					pb_contents = $('#boardContents' + pb_num).text().substr(2, 12);
					pr_writer = '${loginedId}';
					
					
					var reply = {
						"pr_writer" : pr_writer,
						"pr_contents" : $('#pr_contents' + pb_num).val(),
						"pb_num" : pb_num
					};
					replyService.add(reply, function(result) {
						console.log(result);
					})
					
					
					var alarm_id = ($('#boardWriter' + pb_num)).text().trim();
					
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

						
					}) /* end ajax */
					

				});

				$(document).on('click', 'span[name=replyDelBtn]', function() {
					var pr_num = $(this).parent().attr('id');
					pb_num = $(this).closest('.replyContents').attr('id');


					var reply = {
						"pr_num" : pr_num,
						"pb_num" : pb_num
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
		<jsp:include page="../includes/header.jsp"></jsp:include>
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

			<input type="hidden" id="pj_num" name="pj_num" value="${pj_num}">
			<br><br>
			<h5>${project.pj_name }</h5>
			<h2 id="c-title">글 목록</h2>
			<div class="contents_wrap">
			<form action="/projectdetail/home/ + ${ pj_num}" method="get">
			<input type="text" name="searchkey" placeholder="검색 내용 입력" style="border: 1px solid #c0c0c0;">
			<input type="submit" id="search" value="검색" style="background-color: #f5f5f5; color: #161E67; border-radius: 5px; border-style: none; padding: 5px;"><br><br>
			</form>


	<div id="contentsBox">
			<div class="board">
				<div class="boardContents">
					<c:forEach items="${board}" var="b">
						<div class="media">
							<i id="usericon" class="fa-regular fa-circle-user fa-2x"></i>
							<div class="media-body">
								<h5 class="mt-0" id="boardWriter${b.pb_num}">&nbsp;&nbsp;${b.pb_writer}</h5>
								<p id="boardContents${b.pb_num}">&nbsp;&nbsp;${b.pb_contents }</p><br>
								<div id='uploadResult${b.pb_num}' class='uploadResult'>
									<ul>
									</ul>
								</div>
		
		
							</div>
						</div>
		
						<div id="${b.pb_num}" class="replyContents">
							<div id="reply${b.pb_num}" class="boardReplies">
								<ul class="replies">
									<c:forEach items="${replies}" var="r">
										<c:if test="${b.pb_num eq r.pb_num }">
											<li><i id="usericon" class="fa-regular fa-circle-user fa-2x"></i> ${r.pr_writer}:
												${r.pr_contents} 
												<c:if test="${r.pr_writer eq loginedId }">
													<button type="button" class="close" id="${r.pr_num}" aria-label="Close">
  															<span aria-hidden="true" name="replyDelBtn" >&times;</span>
													</button>
												</c:if> 
												<c:set var="now" value="${r.pr_moddate}" />
												<c:set var="sysYear">
												<fmt:formatDate value="${now}" pattern="yy-MM-dd hh:mm" /></c:set>
												<span style="float:right; margin-right: 3px;"><c:out value="${sysYear}" /></span>
												</li>
										</c:if>
									</c:forEach>
								</ul>
									<div class="form-group">
    									<textarea class="form-control" id="pr_contents${b.pb_num}" name="pr_contents" rows="3" placeholder="댓글을 입력하세요."></textarea>
  									</div>
									<input type="button" id="replyReg${b.pb_num}" name="replyRegBtn" value="등록" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px; float: right; margin-right: 10px;"><br>
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