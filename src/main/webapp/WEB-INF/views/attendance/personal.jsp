<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TETRIS Groupware</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
   href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
   type="text/css" />
<script src="/resources/vender/jquery/jquery-3.6.1.min.js"></script>
<script src="/resources/vender/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/index.js"></script>
<script src="https://kit.fontawesome.com/3c50ab6b24.js" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link href="/resources/vender/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<link href="/resources/css/index.css" rel="stylesheet">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script>
   $(document).ready(
         function() {

            //출퇴근버튼 활성화
            var currentDate = new Date();
            var currentHours = addZeros(currentDate.getHours(), 2);
            var currentMinute = addZeros(currentDate.getMinutes(), 2);
            var currentSeconds = addZeros(currentDate.getSeconds(), 2);
            var now_date = currentDate.getFullYear() + "-"
                  + (currentDate.getMonth() + 1) + "-"
                  + currentDate.getDate() + " " + currentHours + ":"
                  + currentMinute + ":" + currentSeconds;

            //출근클릭
            $('#startD').click(function() {
               if (confirm('출근하시겠습니까?')) {
                  alert('출근하셨습니다');
                  //startTime.innerHTML = now_date;
                  var e_id = getParam('e_id');
                  //e_id = e_id.slice(3, -3);
                  console.log(e_id);
                  $.ajax({
                     url : 'insertAction.do',
                     type : 'POST',
                     contentType : 'application/json',
                     data : JSON.stringify({
                        e_id : e_id
                     }),
                     success : function(result) {
                        alert("출근성공");

                     },
                     error : function(result) {
                        alert("출근실패 (관리자에게 문의해주세요)");
                     }
                  }); //$.ajax 
               }
            });

            var today = $('#timecheck').val();

            var lateCheck = '09:00:00';
            var checkTime = today;//출근시간확인

            if (checkTime > lateCheck) {
               $('[id^=startTime2]').css("color", "red");
            }

            //퇴근클릭
            $("#endD").on("click", function() {
               if (confirm('퇴근하시겠습니까?')) {
                  alert('퇴근하셨습니다');
                  //endTime.innerHTML = now_date;
                  var e_id = getParam('e_id');
                  //e_id = e_id.slice(3, -3);
                  console.log(e_id);

                  $.ajax({
                     url : 'endAction.do',
                     type : 'POST',
                     contentType : 'application/json',
                     data : JSON.stringify({
                        e_id : e_id
                     }),
                     success : function(result) {
                        alert("퇴근성공");
                     },
                     error : function(result) {
                        alert("퇴근실패 (관리자에게 문의해주세요)");
                     }
                  }); //$.ajax 
               }
            });

            $("#outD").on("click", function() {
               if (confirm('외근하시겠습니까?')) {
                  alert('안녕히다녀오세요');
                  var e_id = getParam('e_id');
                  console.log(e_id);

                  $.ajax({
                     url : 'outAction.do',
                     type : 'POST',
                     contentType : 'application/json',
                     data : JSON.stringify({
                        e_id : e_id
                     })
                  });
               }
            });
         });

   function getParameterByName(name) {
      name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
      var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
            .exec(location.search);
      return results == null ? "" : decodeURIComponent(results[1].replace(
            /\+/g, " "));
   }

   function getParam(sname) {
      var params = location.search.substr(location.search.indexOf("?") + 1);
      var sval = "";
      params = params.split("&");
      for (var i = 0; i < params.length; i++) {
         temp = params[i].split("=");
         if ([ temp[0] ] == sname) {
            sval = temp[1];
         }
      }
      return sval;
   }

   function printClock() {
      var clock = document.getElementById("clock"); // 출력할 장소 선택
      var currentDate = new Date(); // 현재시간
      var calendar = currentDate.getFullYear() + "-"
            + (currentDate.getMonth() + 1) + "-" + currentDate.getDate() // 현재 날짜
      var currentHours = addZeros(currentDate.getHours(), 2);
      var currentMinute = addZeros(currentDate.getMinutes(), 2);
      var currentSeconds = addZeros(currentDate.getSeconds(), 2);
      clock.innerHTML = currentHours + ":" + currentMinute + ":"
            + currentSeconds; //날짜를 출력해 줌
      //날짜 출력
      var date = document.getElementById("date");
      date.innerHTML = currentDate.getFullYear() + "년 "
            + (currentDate.getMonth() + 1) + "월 " + currentDate.getDate()
            + "일";
      setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
   }

   function addZeros(num, digit) { // 자릿수 맞춰주기
      var zero = '';
      num = num.toString();
      if (num.length < digit) {
         for (i = 0; i < digit - num.length; i++) {
            zero += '0';
         }
      }
      return zero + num;
   }
</script>
</head>
<body onload="printClock()">
    <div class="wrap">
   <!-- jsp 인클루드 사용-->
   <jsp:include page="../includes/header.jsp"></jsp:include>

   
         <!-- 보조사이드바 -->
         <div class="s-menu">
            <div class="s-menu-title text-center">
               <p>근태관리
               <i class="bi bi-clock"></i>
               <h5>반갑습니다 ${hrVO.e_name }님</h5>
            </div>
            <div class="s-list-item text-center">
                <div>
                     <!--  -->
                     <div id="date"></div>
                     <div
                        style="width: 200px; height: 80px; line-height: 80px; color: #666; font-size: 40px; text-align: center;"
                        id="clock"></div>
                      <!-- <input id="newbtn" type="button" value="새 파일" onclick=""> -->
                     <!-- 출근시간 -->
                     <dl class="my-3 ">
                        <dt>출근시간</dt>
                        <dd id="startTime">
                           <fmt:formatDate value="${hrVO.hr_date }"
                              pattern="yyyy-MM-dd HH:mm:ss" />
                        </dd>
                     </dl>
                     <!-- 퇴근시간 -->
                     <dl class="mb-3">
                        <dt>퇴근시간</dt>
                        <dd id="endTime">
                           <fmt:formatDate value="${hrVO.hr_leave }"
                              pattern="yyyy-MM-dd HH:mm:ss" />
                        </dd>
                     </dl>
                     <!-- 누적근무시간 -->
                     <dl>
                        <!-- <dt>누적근무시간</dt> -->
                        <dd id=""></dd>
                     </dl>
                     <!-- 출퇴근버튼 -->
                     <div class="my-5">
                      <i id="startD" style="color: #151d66 ; background:white" class="fa-solid fa-circle-play fa-3x"></i> <i
									id="endD" style="color: #151d66 ; background:white" class="fa-solid fa-circle-stop fa-3x"></i> <i
									id="outD" style="color: #151d66 ; background:white" class="fa-solid fa-circle-pause fa-3x"></i>
                     </div>
                  </div>
            </div>
            <%-- <div class="s-list-item ">
               <a href='/attendance/personal?e_id=<c:out value="${hrVO.e_id}"/>' target="_blank">개인근태기록조회</a>
            </div> --%>
         </div>
         <!-- 보조사이드바 끝-->
  
         <!-- 내용 시작 -->
         <div class="wrap-box">
         <div class="s-container">
            <h2 id="c-title">소속부서: ${hrVO.d_name }</h2>
            <!-- 근태누계 -->
                  <div class="panel panel-default my-5">
                     <div class="panel-heading"><h2>근태누계</h2></div>
                     <div class="panel-body">
                        <table class="table table-hover">
                           <thead>
                              <tr class="text-center">
                                 <th>사원번호</th>
                                 <th>이름</th>
                                 <th>부서</th>
                                 <th>정상출근</th>
                                 <th>지각</th>
                                 <th>결근</th>
                                 <th>휴가</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr class="text-center">
                                 <td>${hrVO.e_num }</td>
                                 <td>${hrVO.e_name }</td>
                                 <td>${hrVO.d_name }</td>
                                 <td>${hrVO2.working_day }</td>
                                 <td>${hrVO2.late_day }</td>
                                 <td>${hrVO2.skip_day }</td>
                                 <td>${hrVA.e_totalvac-hrVA.e_usevac}</td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
                  <!-- 누계정보끝 -->
                  <!-- 연차누계 -->
                  <div class="panel panel-default my-5">
                     <div class="panel-heading">연차현황</div>
                     <div class="panel-body">
                        <table class="table table-hover">
                           <thead>
                              <tr class="text-center">
                                 <th>Total</th>
                                 <th>사용일수</th>
                                 <th>잔여일수</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr class="text-center">
                                 <td>${hrVA.e_totalvac }</td>
                                 <td>${hrVA.e_usevac }</td>
                                 <td>${hrVA.e_totalvac-hrVA.e_usevac}</td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
                  <!-- 누계정보끝 -->
                  
                  <!-- 테이블 -->
                  <div>
                     <!-- 
                        <div>선택날짜</div>
                      -->
                     <table class="table table-striped mt-8"
                        style="text-align: center; border: 1px solid #dddddd">
                        <thead>
                           <tr>
                              <th style="background-color: #eeeeee; text-align: center;">일자</th>
                              <th style="background-color: #eeeeee; text-align: center;">사원번호</th>
                              <th style="background-color: #eeeeee; text-align: center;">이름</th>
                              <th style="background-color: #eeeeee; text-align: center;">부서</th>
                              <th style="background-color: #eeeeee; text-align: center;">출근시간</th>
                              <th style="background-color: #eeeeee; text-align: center;">퇴근시간</th>
                              <th style="background-color: #eeeeee; text-align: center;">근무상태</th>
                              <th style="background-color: #eeeeee; text-align: center;">비고</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach items="${list}" var="hr">
                              <tr>
                                 <td><fmt:formatDate value="${hr.hr_date }"
                                       pattern="yyyy-MM-dd" /></td>
                                 <td><c:out value="" />${hr.e_num }</td>
                                 <td><c:out value="" />${hr.e_name }</td>
                                 <td><c:out value="" />${hr.d_name}</td>
                                 <!-- 출근시간 -->
                                 <td id="startTime2"><fmt:formatDate
                                       value="${hr.hr_date }" pattern="HH:mm:ss" /></td>
                                 <!-- 퇴근시간 -->
                                 <td><fmt:formatDate value="${hr.hr_leave }"
                                       pattern="HH:mm:ss" /></td>
                                 <td><c:out value="${hr.hr_status }" /></td>
                                 <td><c:out value="${hr.hr_note }" /></td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>


                  </div>
                  <!-- 테이블 끝 -->
                  
         </div>

         <!-- 내용 끝 -->
<input type="hidden" id="timecheck"
                  value="<fmt:formatDate
                                    value="${hrVO.hr_date }" pattern="HH:mm:ss" />">
               <!-- 정보출력부분의 끝 -->
      <!-- 전체 wrapper 끝 -->
      </div>
      </div>
      <jsp:include page="../includes/footer.jsp"></jsp:include>
   
</body>

</html>

