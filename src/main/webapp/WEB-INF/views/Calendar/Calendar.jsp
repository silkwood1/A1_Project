<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />




    <!-- Bootstrap core CSS -->
    <link href="resources/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="resources/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="resources/assets/js/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/style.css" rel="stylesheet">
    <link href="resources/assets/css/style-responsive.css" rel="stylesheet">
    
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="resources/assets/js/jquery.js"></script>
    <script src="resources/assets/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="resources/assets/js/fullcalendar/fullcalendar.min.js"></script>    
    <script src="resources/assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="resources/assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="resources/assets/js/jquery.scrollTo.min.js"></script>
    <script src="resources/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    
    
    <!-- DATEPICKER -->
		<link rel="stylesheet" href="resources/date_picker/jquery-ui.css">
		<script src="resources/date_picker/jquery-ui.js"></script>
		<!-- <script src="resources/date_picker/jquery.js"></script> -->
		
		
		<!-- TIMEPICKER -->
		<link rel="stylesheet" href="resources/date_picker/jquery-ui-timepicker-addon.css" />
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<script src="resources/date_picker/jquery-ui-timepicker-addon.js"></script>
    
    
    
    
    
    <!--common script for all pages-->
    <script src="resources/assets/js/common-scripts.js"></script>

    <!--script for this page-->
	<script src="resources/assets/js/calendar-conf-events.js"></script>    
	
	<!-- dialog -->
	 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">

	
<script>

  jQuery(document).ready(function($) {
	  
	  
  /* 날짜 선택 창  */
	  $("#startTime").datetimepicker({
      	dateFormat: 'yy-mm-dd',
          prevText: '이전 달',
          nextText: '다음 달',
          monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
          monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
          dayNames: ['일','월','화','수','목','금','토'],
          dayNamesShort: ['일','월','화','수','목','금','토'],
          dayNamesMin: ['일','월','화','수','목','금','토'],
          showMonthAfterYear: true,
          changeMonth: true,
          changeYear: true,
          yearSuffix: '년',
          changeMonth: true,
          changeYear: true,
          showButtonPanel:true,
          closeText:'닫기',
          minDate: 0,
     
          // timepicker 설정
          timeFormat:'HH:mm:ss',
          controlType:'select',
          oneLine:true,

          onSelect: function(selected){
          	$("#endTime").datetimepicker("option","minDate",selected)
          }
      });
  
	  $("#cstartTime").datetimepicker({
	      	dateFormat: 'yy-mm-dd',
	          prevText: '이전 달',
	          nextText: '다음 달',
	          monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	          monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	          dayNames: ['일','월','화','수','목','금','토'],
	          dayNamesShort: ['일','월','화','수','목','금','토'],
	          dayNamesMin: ['일','월','화','수','목','금','토'],
	          showMonthAfterYear: true,
	          changeMonth: true,
	          changeYear: true,
	          yearSuffix: '년',
	          changeMonth: true,
	          changeYear: true,
	          showButtonPanel:true,
	          closeText:'닫기',
	          minDate: 0,
	     
	          // timepicker 설정
	          timeFormat:'HH:mm:ss',
	          controlType:'select',
	          oneLine:true,

	          onSelect: function(selected){
	          	$("#endTime").datetimepicker("option","minDate",selected)
	          }
	      });
  
	  
	  /* 날짜 선택 창 끝  */
	  
	  /* 풀캘린더 */
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
	      navLinks: true, // can click day/week names to navigate views
	      selectable: true,
	      select: function() {
	    	  dialogEvents()
	        },
	      editable: true,
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      
	      events:
	    	  ${list},
   		  eventClick: function(event) {
   			cdialogEvents(event);
    	  }
	    });
	  //퓰캘린더 끝
	  
	  
	  //다이얼로그 이벤트
	  function dialogEvents(event){
		  var eId = document.getElementById('staffId').val;
		  var eSchedulesaddress = document.getElementById('schedulesaddress').val;
		  var eStartTime = document.getElementById('startTime').val;
		  var eTitle = document.getElementById('title').val;
		  
		  $('#dialog').dialog({
		      title: '일정 등록',
		      modal: true,
		      width: '450',
		      height: '350',
		      color: '#ffffff'
		});
		 
		  
	  }
	  
	  //확인 다이얼로그 이벤트
	  function cdialogEvents(event){// id,날짜,title,시작시간,색깔 
		  //눌렀을 때 이벤트와 리스트를 비교해서  해당 input 값에 집어넣음
		  $('#confirmdialog').dialog({
		      title: '일정 확인',
		      modal: true,
		      width: '450',
		      height: '350',
		      color: '#ffffff'
		});
		 /*  document.getElementById('personlist').value=Person_ID; 셀렉트 셀렉트하는 법*/
		var ceId = document.getElementById('cstaffId');
		var ceSchedulesaddress = document.getElementById('cschedulesaddress');
		var ceStartTime = document.getElementById('cstartTime');
		var ceTitle = document.getElementById('ctitle');
		  
		ceId.value=event.id;
		ceStartTime.value=event.start;
		ceTitle.value=event.title;
		  
	  }

	});
	  

function backMain(){
	  
	  location.href='./';
  }
  
  
  function deleteSchedule(){
	  
     
  }
  
  function updateSchedule(){
	
  }
  
  function changeSelect(){
	  var eId = document.getElementById('staffId').value='';
	  var eSchedulesaddress = document.getElementById('schedulesaddress');
	  var eStartTime = document.getElementById('startTime').value='';
	  var eTitle = document.getElementById('title').value='';	  
	  //ajax로 선택된 번호를 보낸다. 보낸 번호로 검색하여 해당 거래번호의 고객의 주소를 불러온다.
	  //고객의 주소를 주소창에 입력한다.
			var TradeNo=$('#tradeNo').val();//${tradeList}
			var tradeSampleNo;
			var list = new Array(); 
			<c:forEach items="${tradeList}" var="item">
			if ("${item.tradeNo}" == TradeNo) { 
				tradeSampleNo = "${item.customerNo}";
			}
			</c:forEach>
			
			  
			$.ajax({
				url: 'gettingAddr'
				, type: 'post'
				, data: {'tradeSampleNo':tradeSampleNo}
				, success:function(str){
					eSchedulesaddress.value= str;
				}
				, error:function(err){
					console.log(err);
				}
			});//ajax 

	}
  
  function cchangeSelect(){
	  var ceId = document.getElementById('cstaffId').value='';
	  var ceSchedulesaddress = document.getElementById('cschedulesaddress').value='';
	  var ceStartTime = document.getElementById('cstartTime').value='';
	  var ceTitle = document.getElementById('ctitle').value='';	  
	  //ajax로 선택된 번호를 보낸다. 보낸 번호로 검색하여 해당 거래번호의 고객의 주소를 불러온다.
	  //고객의 주소를 주소창에 입력한다.
			var TradeNo=$('#tradeNo').val();//${tradeList}
			var tradeSampleNo;
			var list = new Array(); 
			
			//거래 검색해서 거래리스트의 거래번호와 입력창의 거래번호가 맞으면 
			<c:forEach items="${tradeList}" var="item">
			if ("${item.tradeNo}" == TradeNo) { 
				tradeSampleNo = "${item.customerNo}";
			}
			</c:forEach>
			
			//주소 가져오기
			$.ajax({
				url: 'gettingAddr'
				, type: 'post'
				, data: {'tradeSampleNo':tradeSampleNo}
				, success:function(str){
					ceSchedulesaddress.value= str;
				}
				, error:function(err){
					console.log(err);
				}
			});//ajax 

	}
</script>
<style>
body {
	margin: 0;
	padding: 0;
	font-size: 14px;
}

#calendar {
	height : 650

}

element.style {
    position: absolute;
    z-index: 8;
    left: 243px;
    width: 52px;
    top: 222px;
}
</style>
</head>


<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-md-6">
				<div class="box1">
					<span class="li_heart"></span>
					<h3>업무 스케쥴 달력</h3>
					<div id='calendar' class="has-toolbar fc">
					
						<form name="inserting" action="" method="post">
							
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
		<!-- 날짜의 빈 공간을  클릭했을 때 출력되는 다이얼로그 --> 
		
		<div id="dialog" name="dialog" class ="dialog" title="일정 등록" style="display: none"> 
			<form method="POST" action="insertSchedule">
			<table>
				<input type="hidden" id="userBn" name="userBn" value="1"><!-- ${sessionScope.userBn} -->
				<input type="hidden" id="coordinates" name="coordinates" value="">
				<input type="hidden" id="tradeStatus" name="tradeStatus" value="">
				<input type="hidden" id="color" name="color" value="">
				<tr>
					<td>staff Id</td>
					<td>
						<select id="staffId" name="staffId">
						     <option value="">매장 내 staff</option><!-- 해당 사업장의 직원 리스트 -->
							 <option value="1">1</option> 
							    <c:forEach var="i" items="${stafflist}" >
									 <option value="1">1</option>
								</c:forEach>
								
						 </select>
					</td>
				</tr>
				
				<tr>
					<td>거래 번호</td>
					<td>
						<select id="tradeNo" name="tradeNo" onchange="changeSelect()">
						     <option value="">거래번호</option><!-- 해당 사업장의 직원 리스트 -->
							    <c:forEach var="i" items="${tradeList}" >
									 <option value="${i.tradeNo}">${i.tradeNo}</option>
								</c:forEach> 
						 </select>
					</td>
				</tr>
				
				<tr>
					<td>방문지</td>
					<td>
					<input type="text" id="schedulesaddress" name="schedulesaddress" readonly>
					</td>
				</tr>
				
				<tr>
					<td>시작시간</td>
					<td>
					<input type="text" id="startTime" name="startTime" readonly>
					</td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td>
					<input type="text" id="title" name="title" placeholder="제목">
					</td>
				</tr>
				
				<tr>
					<td>
						<input type="submit" value="일정 등록" onsubmit="scheduleInsert()">
					</td>
				
				</tr>
				
			</table>
			</form>
		</div>
		
		
		<!-- 이벤트를 클릭 했을 때 나오는 다이얼로그 -->
		<div id="confirmdialog" title="일정 확인" style="display: none"> 
			<form id="addForm" name="addForm" method="post">
			<table>
			
				<input type="hidden" id="cuserBn" name="userBn" value="${sessionScope.userBn}">
				<input type="hidden" id="ccoordinates" name="coordinates" value="">
				<tr>
					<td>staff Id</td>
					<td>
						<select id="cstaffId" name="cstaffId">
						     <option value="">매장 내 staff</option><!-- 해당 사업장의 직원 리스트 -->
							 <option value="1">1</option> 
							    <c:forEach var="i" items="${stafflist}" >
									 <option value="1">1</option>
								</c:forEach>
								
						 </select>
					</td>
				</tr>
				
				<tr>
					<td>거래 번호</td>
					<td>
						<select id="ctradeNo" name="ctradeNo" onchange="cchangeSelect()">
						     <option value="">거래번호</option><!-- 해당 사업장의 직원 리스트 -->
							    <c:forEach var="i" items="${tradeList}" >
									 <option value="${i.tradeNo}">${i.tradeNo}</option>
								</c:forEach> 
						 </select>
					</td>
				</tr>
				
				<tr>
					<td>방문지</td>
					<td>
					<input type="text" id="cschedulesaddress" name="cschedulesaddress" readonly>
					</td>
				</tr>
				
				<tr>
					<td>시작시간</td>
					<td>
					<input type="text" id="cstartTime" name="cstartTime" readonly>
					</td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td>
					<input type="text" id="ctitle" name="ctitle" placeholder="제목">
					</td>
				</tr>
				
				<tr>
					<td>
						<input type="input" value="일정 수정" onclick="updateSchedule()">
						<input type="input" value="일정 삭제" onsubmit="deleteSchedule()">
					</td>
				
				</tr>
				
			</table>
			</form>
		</div>

	</section>
</section>

</html>

<%@include file="../include/footer.jsp"%>