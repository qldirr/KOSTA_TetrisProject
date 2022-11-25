<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="/resources/vender/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker3.css" />
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"
   type="text/javascript"></script>
<script src="/resources/lib/bootstrap-datepicker.js"
   type="text/javascript" defer></script>

<script type="text/javascript">
   $(document).ready(
         function() {

            $('#datePickerstart').datepicker({
               format : "yyyy-mm-dd",
               autoclose : true
            });

            $('#datePickerend').datepicker({
               format : "yyyy-mm-dd",
               autoclose : true
            });

            $("#projectMemberRegBtn").on(
                  "click",
                  function() {
                     var child;
                     child = window.open("/project/member", "_blank",
                           "width=400, height=580");
                  });

         });
</script>
</head>
<body>
   <div class="wrap">
      <jsp:include page="../includes/header.jsp"></jsp:include>
      <!-- 보조메뉴바 시작 -->
      <div class="s-menu">
         <div class="s-menu-title">
            <p>
               프로젝트 <i class="bi bi-clipboard-data"></i>
               <!-- 메인 메뉴바랑 동일한 i테그 넣음 -->
         </div>
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

      </div>
      <div class="wrap-box">
         <div class="s-container">
            <h2 id="c-title">새 프로젝트 생성</h2>

            <div class="contents_wrap">
               <div class="contents">

                  <form action="/project/register" method="post"
                     accept-charset="UTF-8">

                     <div class="form-group">
                        <label for="pj_name">프로젝트명</label> <input type="text"
                           name="pj_name" class="form-control" id="pj_name">
                     </div>
                     <div class="form-group">
                        <label for="pj_type">프로젝트유형</label> <select class="form-control"
                           name="pj_type" id="pj_type">
                           <option value="단일">단일팀프로젝트</option>
                           <option value="협업">협업프로젝트</option>
                           <option value="전사">전사프로젝트</option>
                        </select>
                     </div>
                     <div class="form-group">
                        <label for="pj_startdate">프로젝트시작일</label><input
                           id="datePickerstart" type="text" class="form-control"
                           name="pj_startdate">
                     </div>
                     <div class="form-group">
                        <label for="pj_enddate">프로젝트마감일 </label>
                        <input id="datePickerend" type="text" class="form-control" name="pj_enddate">
                     </div>
                     <div class="form-group">
                        <label for="pj_startdate">프로젝트매니저</label><input type="text"
                           name="pj_manager" id="pj_manager" class="form-control"
                           value="${loginedName }" readonly="readonly">
                     </div>
                     <div class="form-group">
                        <label for="pj_members">프로젝트참여자</label><input type="text"
                           name="e_id" id="pj_members" class="form-control">
                     </div><input
                           type="button" id="projectMemberRegBtn" value="멤버 추가" style="background-color: #F5F5F5; color: #161E67; border-radius: 5px; border-style: none; padding: 5px;">
                     
                     <div class="form-group">
                     <br>
                        <label for="pj_startdate">프로젝트내용</label><input type="text"
                           name="pj_contents" id="pj_contents" class="form-control">
                     </div>
                     <input type="submit" value="새 프로젝트 생성" style="background-color: #161E67; color: #FFF2CA; border-radius: 5px; border-style: none; padding: 5px; float: right; margin-right: 10px;">
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
   <jsp:include page="../includes/footer.jsp"></jsp:include>
</body>

</html>