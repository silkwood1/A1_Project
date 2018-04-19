<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>[ 스케쥴 입력 ]</title>
		
		<!-- DATEPICKER -->
		<link rel="stylesheet" href="resources/date_picker/jquery-ui.css">
		<script src="resources/date_picker/jquery.js"></script>
		<script src="resources/date_picker/jquery-ui.js"></script>
		
		<!-- TIMEPICKER -->
		<link rel="stylesheet" href="resources/date_picker/jquery-ui-timepicker-addon.css" />
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<script src="resources/date_picker/jquery-ui-timepicker-addon.js"></script>

		<style>

		  body {
		    margin: 40px 10px;
		    padding: 0;
		    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		    font-size: 14px;
		    z-index:1;
		  }
		  body:after{
				 
				background-repeat: no-repeat;
				top:0;
			    left:0;
			    position:absolute;
			    background-size:100%;
			    opacity:0.7!important;
			    filter:alpha(opacity=50);
			    z-index:-1;
			    content:"";
			    width:100%;
			    height:150%;
		}
		</style>	
		
		<script type="text/javascript">
		
		$(document).ready(function(){
			
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
	        
	        $("#endTime").datetimepicker({
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
	            showButtonPanel:true,
	            changeYear: true,
	            closeText:'닫기',
	            
	         // timepicker 설정
	            timeFormat:'HH:mm:ss',
	            controlType:'select',
	            oneLine:true,
	            
	            onSelect: function(selected){
	            	$("#startTime").datetimepicker("option","MaxDate",selected)
	            }
	        });
	        
	        
	      
	    });
		
		function scheduleInsert(){
			/* addForm일정 ajax로 보내고 성공하면 알람창띄우고 부모화면 재시작하고 지금화면 종료 */
		var eId = document.getElementById('id');
		var eStartTime = document.getElementById('startTime');
		var eEndTime = document.getElementById('endTime');
		var eTitle = document.getElementById('title');
		
			if (eId.value=='') {
				alert('아이디가 만료되었습니다. 다시 로그인 해 주세요');
				return false;
			}
			if (eStartTime.value=='') {
				alert('시작 일자를 입력 해 주세요');
				return false;
			}
			if (eEndTime.value=='') {
				alert('종료 일자를 입력 해 주세요');
				return false;
			}
			if (eTitle.value=='') {
				alert('내용을 입력해 주세요');
				return false;
			}

			/* 같은날일때  */
			if ((eStartTime.value.substr(1,4)+0)==(eEndTime.value.substr(1,4)+0)
					&&(eStartTime.value.substr(6,2)+0)==(eEndTime.value.substr(6,2)+0)
					&&(eStartTime.value.substr(9,2)+0)==(eEndTime.value.substr(9,2)+0)) {
			
				if ((eStartTime.value.substr(11,2)+0)>(eEndTime.value.substr(11,2)+0)) {/* 시간 비교 */
					alert('시작시간보다 종료시간이 느립니다1.');
					return false;
				
				}else if((eStartTime.value.substr(11,2)+0)==(eEndTime.value.substr(11,2)+0)){/* 시간 같을 때 */
					if ((eStartTime.value.substr(14,2)+0)>(eEndTime.value.substr(14,2)+0)) {/* 분 비교 */
						alert('시작시간보다 종료시간이 느립니다2.');
						return false;
						
					}else if((eStartTime.value.substr(14,2)+0)==(eEndTime.value.substr(14,2)+0)){/* 분 같을 때 */
						if ((eStartTime.value.substr(17,2)+0)>(eEndTime.value.substr(17,2)+0)) {/* 초 비교 */
							alert('시작시간보다 종료시간이 느립니다3.');
							return false;
						}
					}	
				}
			}
		
			
		
		
			if (confirm("일정을 등록하시겠습니까?") == true){//확인
				$.ajax({
					url: 'insertSchedule'
					,type: 'post'
					,data:$('#addForm').serialize()
					,success:function(){
						alert('등록완료');
						opener.parent.location.reload();
						window.close();
					}
					,error:function(err){
						alert('등록실패');
					}
				});//ajax
			}//if
			
        }//function
        
        function scheduleCancel(){
        	var con_test = confirm("취소하시겠습니까?");
        	if(con_test == true){
        	  window.close();
        	}
        	else if(con_test == false){
        	}
        }
		</script>
	</head>
	
	<body>
		<h1>[ 일정 추가 ]</h1>
		<form id="addForm" name="addForm" method="post">
		<table>
			<tr>
				<td>Id</td>
				<td>
				<input type="text" id="id" name="id" value="${sessionScope.loginId}" > <!-- readonly -->
				</td>
			</tr>
			
			<tr>
				<td>시작시간</td>
				<td>
				<input type="text" id="startTime" name="startTime" readonly>
				</td>
			</tr>
			
			<tr>
				<td>종료시간</td>
				<td>
				<input type="text" id="endTime" name="endTime" readonly>
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
					<input type="button" value="일정 등록" onclick="scheduleInsert()">
				</td>
				<td>
					<input type="button" value="취소" onclick="scheduleCancel()">
				</td>
			</tr>
			
		</table>
		</form>
  		
	</body>
</html>