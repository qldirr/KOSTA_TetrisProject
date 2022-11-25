<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
	type="text/javascript"></script>
<style type="text/css">
li {
	 list-style:none;
}
</style>
<script type="text/javascript">

var cloneObj = $(".upload").clone();


function showUploadFile(uploadResultArr){
	
	if(!uploadResultArr || uploadResultArr.length == 0){return;}
	
	var uploadUL = $(".uploadResult ul");
	
	var str = "";
	
	$(uploadResultArr).each(function(i, obj){
		
		if(obj.image){
			var fileCallPath = encodeURIComponent(obj.pf_path + "/s_" + obj.pf_uuid + "_" + obj.pf_name);
			str += "<li data-path='"+obj.pf_path+"'";
			str += " data-uuid='" + obj.pf_uuid+ "' data-filename ='" + obj.pf_name +"'";
			str += "><div>";
			str += "<span>" + obj.pf_name + "</span>";
			str += "<input type='button' value='삭제'></button><br>";
			str += "<a><img src = '/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str += "</li>";
		} else {
			var fileCallPath = encodeURIComponent(obj.pf_path + "/" + obj.pf_uuid + "_" + obj.pf_name);
			var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
			
			str += "<li data-path='" + obj.pf_path +"'";
			str += " data-uuid= '" + obj.pf_uuid+ "' data-filename ='" + obj.pf_name +"'";
			str += "><div>";
			str += "<span>" + obj.pf_name + "</span>";
			str += "<input type='button' value='삭제'></button><br>";
			str += "<img src = '/resources/img/attachfile.png'></a>";
			str += "</div>";
			str += "</li>";
		}
	});
	
	uploadUL.append(str);
}

$(function() {
	

	$("input[type='file']").on('change', function(e){
	//<input type='file'>의 내용이 변경 되었을 때 파일 업로드 시작
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		console.log(files);
		
		//파일을 formData에 저장하기
		for(var i=0; i<files.length; i++){
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			
			url: "/projectdetail/uploadfile",
			processData: false,
			contentType: false,
			data: formData, 
			type: 'POST',
			dataType: 'json',
			success: function(result){
				showUploadFile(result);
				$(".upload").html(cloneObj.html());
			}
		});
	});
	

	
	var formObj = $("form[role='form']");
	
	$("#registProjectBoard").on("click", function(e){
		
		e.preventDefault();
		
		console.log("submit clicked");
		
		var str = "";
	
		
		$('.uploadResult ul').find('li').each(function(i, obj){
			var jobj = $(obj);
			
			console.log(jobj);
			
			str += "<input type='hidden' name='attachList["+i+"].pf_name' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].pf_uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].pf_path' value='"+jobj.data("path")+"'>"; 
		});
		
	
		formObj.append(str).submit(); 
	
	});
})


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
		<br>
		<h2 id="c-title">새 피드 글쓰기</h2><br> 

            <div class="contents_wrap">
            
		<form role="form" action="/projectdetail/register" method="post">
		<input type="hidden" id="pj_num" name="pj_num" value="${pj_num}">
		<input type="hidden" id="pb_writer" name="pb_writer" value="${loginedId }">
		<div class="form-group">
    		<textarea class="form-control" name="pb_contents" rows="10"></textarea>
  		</div>
		<input type="hidden" id="notice" name="pb_status" value="Y">
		<div class='upload'>
			<input type="file" name='uploadFile' multiple>
		</div>
	<div class="uploadResult">
		<ul>
	
		</ul>
	</div>
		<input type="submit" id="registProjectBoard" value="글 등록하기" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px; float: right; margin-right: 10px;"><br>
		<br>
	</form>
</div>
</div>
</div>
</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>