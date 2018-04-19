<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css'
	rel='stylesheet'>
<link
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
	rel='stylesheet' />

<link href='resources/CalendarLib/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/CalendarLib/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />
<script src='resources/CalendarLib/moment.min.js'></script>
<script src='resources/CalendarLib/jquery.min.js'></script>
<script src='resources/CalendarLib/fullcalendar.min.js'></script>


<script>

  $(document).ready(function() {

	  console.log(${list});
	
	  var d = new Date();
	  if (d.getMonth()+1<10) {
		var strMonth = "0"+(d.getMonth()+1);
	}else{
		var strMonth = d.getMonth()+1;
	}
	  if (d.getDate()<10) {
		  var strDate = "0"+d.getDate();
	}else{
		var strDate = d.getDate();
	}
	  var nowDate = "'"+d.getFullYear()+"-"+strMonth+"-"+strDate+"'";
	  
	  $('#calendar').fullCalendar({
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month agendaWeek,agendaDay,listWeek ' ,
	      },
	      defaultDate: nowDate,
	      navLinks: true, // can click day/week names to navigate views
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      //입력받을 때는 스케쥴넘과 id는 자동입력, title,start,end는 수동 입력
	      
	      //출력받을 때는 id를 받아와서 해당 id의 것만 출력
	      
	      //수정
	      
	      //삭제
	      events:
	    	  ${list}
	    });
	  });


function backMain(){
	  
	  location.href='./';
  }
  


  function insertSchedule(){
	  var gsWin = window.open('about:blank','IDsearcher','width=500,height=500');
      var frm =document.inserting;
      frm.action = 'scheduleForm';
      frm.target ="IDsearcher";
      frm.method ="post";
      frm.submit();
  }
  
  function deleteSchedule(){
	  window.open('deleteForm','IDdeleter','width=500,height=500');
     
  }
  
  function updateSchedule(){
	  var gsWin = window.open('about:blank','IDsearcher','width=500,height=500');
      var frm =document.inserting;
      frm.action = 'schedule1';
      frm.target ="IDsearcher";
      frm.method ="post";
      frm.submit();
  }
</script>
<style>
body {
	margin: 0;
	padding: 0;
	font-size: 14px;
}

#calendar {
	/* max-width: 900px; */
	margin: 40px auto;
	padding: 0 10px;
	width: 35%;
	height: 35%;
}
</style>
</head>
<!--  
<body>

  	<div id='calendar'>
	  <br>
	  
	  <form name="inserting" action="" method="post">
 		<input type="button" value="일정 추가" onclick="insertSchedule()">
	  	<input type="button" value="일정 삭제&변경" onclick="deleteSchedule()">
	  	<input type="button" value="메인으로" onclick="backMain()">
	  </form>
	</div>
	
</body>
-->

<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-md-6">
				<div class="box1">
					<span class="li_heart"></span>
					<h3>업무 스케쥴 달력</h3>
					<div id='calendar'>
					
						<form name="inserting" action="" method="post">
							<input type="button" value="일정 추가" onclick="insertSchedule()">
							<input type="button" value="일정 삭제&변경" onclick="deleteSchedule()">
							<input type="button" value="메인으로" onclick="backMain()">
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box1">
					<span class="li_heart"></span>
					<h3>
						<i class="fa fa-angle-right"></i> < 오늘 할 일 >
					</h3>

					<div class="row mt">
						<div class="col-lg-12">
							<div class="content-panel">
								<h4>
									<i class="fa fa-angle-right"></i> 업무 스케쥴 리스트
								</h4>
								<section id="unseen">
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th class="numeric">번호</th>
												<th class="numeric">거래처</th>
												<th class="numeric">품목</th>
												<th class="numeric">거래량</th>
												<th class="numeric">미지급</th>
												<th class="numeric">미수금</th>
												<th class="numeric">총액</th>
												<th class="numeric">거래수단</th>
												<th class="numeric">거래일자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="numeric"><!--EL 번호--></td>
												<td class="numeric"><!--EL 거래처--></td>
												<td class="numeric"><!--EL 품목--></td>
												<td class="numeric"><!--EL 거래량--></td>
												<td class="numeric"><!--EL 미지급--></td>
												<td class="numeric"><!--EL 미수금--></td>
												<td class="numeric"><!--EL 총액--></td>
												<td class="numeric"><!--EL 거래수단--></td>
												<td class="numeric"><!--EL 거래일자--></td>
											</tr>
											
										</tbody>
									</table>
								</section>
							</div>
							<!-- /content-panel -->
						</div>
						<!-- /col-lg-4 -->
					</div>
					<!-- /row -->



				</div>
			</div>
		</div>
	</section>
</section>

</html>

<%@include file="../include/footer.jsp"%>