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
    <link href="resources/assets/css/bootstraps.css" rel="stylesheet">
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

    <!--script for this page-->
	<script src="resources/assets/js/calendar-conf-events.js"></script>    
	
	<!-- dialog -->
	 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">

	<!-- naver map -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=o26GkaCYMVJHyu1k7CZl&submodules=geocoder"></script>
	
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
	  
	  
	  
	  //풀켈린더
	  $('#calendar').fullCalendar({
		  header: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'month agendaWeek,agendaDay,listWeek '
		      },
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
	  
	  
	  //일정 삽입 다이얼로그 이벤트
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
	  
	  //이벤트 확인 다이얼로그 이벤트**********************
	  function cdialogEvents(event){// id,날짜,title,시작시간,색깔 
		  	var ceId = document.getElementById('cstaffId');
			var ceSchedulesaddress = document.getElementById('cschedulesaddress');
			var ceStartTime = document.getElementById('cstartTime');
			var ceTitle = document.getElementById('ctitle');
			var ceuserBn = document.getElementById('cuserBn');
			var cecoordinates = document.getElementById('ccoordinates');
			var cetradeStatus = document.getElementById('ctradeStatus');
			var cecolor = document.getElementById('ccolor');
			var ceschedulesNum = document.getElementById('cschedulesNum');
			var ceremark = document.getElementById('cremark');
			//cuserBn, ccoordinates, ctradeStatus, ccolor, cschedulesNum
			//창을 띄울 때 이벤트의 일정(list) title과 스케쥴의 타이틀을 비교
			//맞으면 스케쥴객체의 값을 작성
		   <c:forEach items="${list}" var="item">//${list}
			if ("${item.title}" == event.title) { 
				$("#cstaffId").val("${item.staffId}").prop("selected", true);
				$("#ctradeNo").val("${item.tradeNo}").prop("selected", true);
				
				ceSchedulesaddress.value = "${item.schedulesaddress}";
				cecoordinates.value = "${item.coordinates}";
				ceStartTime.value = "${item.startTime}";
				ceTitle.value = "${item.title}";
				ceschedulesNum.value="${item.schedulesNum}";
				ceremark.value="${item.remark}";
			}
			</c:forEach> 
		 
		  $('#confirmdialog').dialog({
		      title: '일정 확인',
		      modal: true,
		      width: '450',
		      height: '350',
		      color: '#ffffff'
		});
		  
	  }

	});
	  
  //스케쥴 삭제
  function deleteSchedule(){
		var schedulesNum = document.getElementById('cschedulesNum').value;	  
		var con_test = confirm("정말 삭제하시겠습니까?");
		if(con_test == true){
			$.ajax({
				url: 'deleteSchedule'
				, type: 'post'
				, data: {'schedulesNum' : schedulesNum}
				, success:function(str){
					if (str=='삭제성공') {
						alert('일정삭제가 완료되었습니다.');
						location.reload();
					}else{
						alert('일정삭제에 실패하였습니다.');
					}
					
				}
				, error:function(err){
					console.log(err);
				}
			});//ajax 
		}
		else if(con_test == false){
			location.reload();
		}
		
		
	
  }
  //스케쥴 수정버튼 클릭
  function updateSchedule(){//스케쥴번호,직원,거래번호,방문지,시간,내용,좌표
	  var schedulesNum = document.getElementById('cschedulesNum').value;
	  var staffId = document.getElementById('cstaffId').value;
	  var tradeNo= document.getElementById('ctradeNo').value;
	  var schedulesaddress = document.getElementById('cschedulesaddress').value;
	  var startTime = document.getElementById('cstartTime').value;
	  var title = document.getElementById('ctitle').value;
	  var coordinates = document.getElementById('ccoordinates').value;
	  var remark = document.getElementById('cremark').value;
	  
	  var con_test = confirm("이대로 수정하시겠습니까?");
		if(con_test == true){
			$.ajax({
				url: 'updateSchedule'
				, type: 'post'
				, data: {'schedulesNum' : schedulesNum,
					'staffId' : staffId,
					'tradeNo' : tradeNo,
					'schedulesaddress' : schedulesaddress,
					'startTime' : startTime,
					'title' : title,
					'coordinates' : coordinates,
					'remark' : remark
				}
				, success:function(str){
					if (str=='수정성공') {
						alert('일정이 수정되었습니다. 확인해주세요.');
						location.reload();
					}else{
						alert('일정 수정에 실패하였습니다. 다시 시도해주세요.');
					}
					
				}
				, error:function(err){
					console.log(err);
				}
			});//ajax 
		}
		else if(con_test == false){
			location.reload();
		}

	  
	  
	  
  }
  
  //스케쥴 입력 시 거래번호를 선택하면 주소와 좌표를 받아오는 부분 
  function changeSelect(){
	  var eId = document.getElementById('staffId');
	  var eSchedulesaddress = document.getElementById('schedulesaddress');
	  var eStartTime = document.getElementById('startTime').value='';
	  var eTitle = document.getElementById('title').value='';	  
	  var eCoordinates = document.getElementById('coordinates');
	  //ajax로 선택된 번호를 보낸다. 보낸 번호로 검색하여 해당 거래번호의 고객의 주소를 불러온다.
	  //고객의 주소를 주소창에 입력한다.
	  
			var TradeNo=$('#tradeNo').val();//$('#tradeNo').val()
			var tradeSampleNo;
			
			<c:forEach items="${tradeList2}" var="item">
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
					
					////
					 // 주소값
			         var myaddress = str; // 도로명 주소나 지번 주소 ok
			         // ex) var myaddress = '노원구 중계로 8길 20';

			         naver.maps.Service.geocode({
			            address : myaddress
			         }, function(status, response) {
			            if (status !== naver.maps.Service.Status.OK) {
			               return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러입니다. 다시 시도해주세요.');
			            }
			            var result = response.result;
			            // 검색 결과 갯수: result.total
			            // 첫번째 결과 결과 주소: result.items[0].address
			            // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x

			           /*  var myaddr = new naver.maps.Point(result.items[0].point.x,
			                  result.items[0].point.y); */
			            
			            
			            eCoordinates.value=result.items[0].point.y + ", " + result.items[0].point.x;
			         });
			         
					
				}
				, error:function(err){
					console.log(err);
				}
			});//ajax 

	}
  ////이벤트 클릭 시 거래번호가 바뀌면  해당 이벤트정보를 불러오는 부분
  function cchangeSelect(){
	  var ceId = document.getElementById('cstaffId');
	  var ceSchedulesaddress = document.getElementById('cschedulesaddress');
	  var ceStartTime = document.getElementById('cstartTime');
	  var ceTitle = document.getElementById('ctitle');	  
	  var cecoordinates = document.getElementById('ccoordinates');
	  //ajax로 선택된 번호를 보낸다. 보낸 번호로 검색하여 해당 거래번호의 고객의 주소를 불러온다.
	  //고객의 주소를 주소창에 입력한다.
	  
			var TradeNo=$('#ctradeNo').val();//${tradeList}
			var tradeSampleNo;//고객번호
			
			//거래 검색해서 거래리스트의 거래번호와 입력창의 거래번호가 맞으면 
			<c:forEach items="${tradeList2}" var="item">
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
					
					////
					 // 주소값
			         var myaddress = str; // 도로명 주소나 지번 주소 ok
			         // ex) var myaddress = '노원구 중계로 8길 20';

			         naver.maps.Service.geocode({
			            address : myaddress
			         }, function(status, response) {
			            if (status !== naver.maps.Service.Status.OK) {
			               return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러입니다. 다시 시도해주세요.');
			            }
			            var result = response.result;
			            // 검색 결과 갯수: result.total
			            // 첫번째 결과 결과 주소: result.items[0].address
			            // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x

			           /*  var myaddr = new naver.maps.Point(result.items[0].point.x,
			                  result.items[0].point.y); */
			            
			            
			            eCoordinates.value=result.items[0].point.y + ", " + result.items[0].point.x;
			         });
			         
					
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

.box1{
	border-bottom: 0;
}
#scrolltbody {
   display: -webkit-inline-box;
    height: 418px;
    width: 546px;
    overflow: auto;
}
#scrolltbody::-webkit-scrollbar-track
{
   -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
   background-color: #F5F5F5;
}

#scrolltbody::-webkit-scrollbar
{
   width: 10px;
   background-color: #F5F5F5;
}

#scrolltbody::-webkit-scrollbar-thumb
{
   background-color: #ffd777;   
   background-image: -webkit-linear-gradient(45deg,
                                             rgba(255, 255, 255, .2) 25%,
                                   transparent 25%,
                                   transparent 50%,
                                   rgba(255, 255, 255, .2) 50%,
                                   rgba(255, 255, 255, .2) 75%,
                                   transparent 75%,
                                   transparent)
}
#table_dialog{
	margin-left: 45px;
	margin-top: 25px;

}
#addForm{
	margin-left: 45px;
}

</style>
</head>


<section id="main-content">
	<section class="wrapper">

			<h3><i class="fa fa-angle-right">현장관리</i></h3>
			<!-- page start -->
		<div class="row.mt">
		<!-- 크기 -->
			<aside class="col-md-6" style="margin-top: 40px;">
			 	<section class="panel">
			 	<div id="totalcal">
                    <div class="panel-body" align="center">
                    <div id="calendarr" align="center" style="width: 590px; ">
                        <div id="calendar" class="has-toolbar"></div>
                    </div>
                    </div>
                   </div>
                </section>
			</aside>
		<div class="col-md-6">
			<div class="box1">
				<div class="row mt">
					<div class="col-lg-12">
						<div class="content-panel">
							<h4>
								<i class="fa fa-angle-right"></i> 업무 스케쥴 리스트
							</h4>
							<section id="unseen">
								<table
									class="table table-bordered table-striped table-condensed"  id="scrolltbody">
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
									<tbody >
									
										<c:forEach var="i" items="${tradeList}">
											<tr>
												<td class="numeric">${i.tradeNo}</td>
												<td class="numeric">${i.customerNo}</td>
												<td class="numeric">${i.itemCode}</td>
												<td class="numeric">${i.tradeQuantity}</td>
												<td class="numeric">${i.tradePayable}</td>
												<td class="numeric">${i.tradeReceivable}</td>
												<td class="numeric">${i.tradeTotal}</td>
												<td class="numeric">${i.paymentDiv}</td>
												<td class="numeric">${i.tradeIndate}</td>
											</tr>
										</c:forEach>
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
			<table id="table_dialog">
				<input type="hidden" id="userBn" name="userBn" value="1"><!-- ${sessionScope.userBn} -->
				<input type="hidden" id="coordinates" name="coordinates" value="">
				<input type="hidden" id="tradeStatus" name="tradeStatus" value="">
				<input type="hidden" id="color" name="color" value="">
				<tr>
					<td>staff Id</td>
					<td>
						<select id="staffId" name="staffId" class="form-control">
						     <!-- 해당 사업장의 직원 리스트 -->
							    <c:forEach var="i" items="${staffList}" >
							    	 <option value="${i.staffId}">${i.staffName}</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>거래 번호</td>
					<td>
						<select id="tradeNo" name="tradeNo" onchange="changeSelect()" class="form-control">
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
					<input type="text" id="schedulesaddress" name="schedulesaddress" class="form-control" readonly="readonly">
					</td>
				</tr>
				
				<tr>
					<td>시작시간</td>
					<td>
					<input type="text" id="startTime" name="startTime" class="form-control" readonly="readonly" placeholder="클릭해주세요.">
					</td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td>
					<input type="text" id="title" name="title" placeholder="제목" class="form-control">
					</td>
				</tr>
				
				<tr>
					<td>
					<br>
						<input type="submit" value="일정 등록" class="btn btn-success" onsubmit="scheduleInsert()">
					</td>
				
				</tr>
				
			</table>
			</form>
		</div>
		
		
		<!-- 이벤트를 클릭 했을 때 나오는 다이얼로그 -->
		<div id="confirmdialog" title="일정 확인" style="display: none"> 
			<form id="addForm" name="addForm" method="post" >
			<table>
				<input type="hidden" id="cuserBn" name="cuserBn" value="1"><!-- ${sessionScope.userBn} -->
				<input type="hidden" id="ccoordinates" name="ccoordinates" value="">
				<input type="hidden" id="ctradeStatus" name="ctradeStatus" value="">
				<input type="hidden" id="ccolor" name="ccolor" value="">
				<input type="hidden" id="cschedulesNum" name="cschedulesNum" value="">
				<tr>
					<td>매장 내 직원</td>
					<td>
						<select id="cstaffId" name="cstaffId" class="form-control">
						     <!-- 해당 사업장의 직원 리스트 -->
							  <c:forEach var="i" items="${staffList}" >
							    	 <option value="${i.staffId}">${i.staffName}</option>
								</c:forEach>
								
						 </select>
					</td>
				</tr>
				
				<tr>
					<td>거래 번호</td>
					<td>
						<select id="ctradeNo" name="ctradeNo" onchange="cchangeSelect()" class="form-control">
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
					<input type="text" id="cschedulesaddress" name="cschedulesaddress" readonly class="form-control">
					</td>
				</tr>
				
				<tr>
					<td>시작시간</td>
					<td>
					<input type="text" id="cstartTime" name="cstartTime" readonly class="form-control">
					</td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td>
					<input type="text" id="ctitle" name="ctitle" placeholder="제목" class="form-control">
					</td>
				</tr>
				<tr>
					<td>인수인계</td>
					<td>
					<input type="text" id="cremark" name="cremark" placeholder="인수인계" class="form-control">
					</td>
				</tr>
				
				<tr>
					<td>
						<input type="button" value="일정 수정"  class="btn btn-warning"  onclick="updateSchedule()">
						
					</td>
					
					<td>
						<input type="button" class="btn btn-danger" value="일정 삭제" onclick="deleteSchedule()">
					</td>
				</tr>
				
			</table>
			</form>
		</div>

	</section>
</section>

</html>

<%@include file="../include/footer.jsp"%>