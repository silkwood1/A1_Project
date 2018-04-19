<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>[ 스케쥴 수정 ]</title>
		
		<script src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
			<style>

			  body {
			    margin: 40px 10px;
			    padding: 0;
			    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
			    font-size: 14px;
			    z-index:1;
			  }
			  body:after{
					background-image: url('../resources/image/main4.jpg');       
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
	        $("#startTime").datepicker({
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
	            onSelect: function(selected){
	            	$("#endTime").datepicker("option","minDate",selected)
	            }
	        });
	        
	        $("#endTime").datepicker({
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
	            onSelect: function(selected){
	            	$("#startTime").datepicker("option","MaxDate",selected)
	            }
	        });
	        
	        $('#scheduleUpdate').on('click',scheduleUpdate);
	        /* 
	        {
	          id: 999,
	          title: 'All Day Event',
	          start: '2018-01-25',
	        },
	        */
	        
	        
	        /* $("#datepicker2").datepicker({
	        	minDate:(+-)n,nY,nM,nD
	        }); */
	    });
		function scheduleUpdate(){/* addForm일정 ajax로 보내고 성공하면 알람창띄우고 부모화면 재시작하고 지금화면 종료 */
			/* document.addForm.submit(); */
			$.ajax({
				url: 'UpdateSchedule'
				,type: 'post'
				,data:$('#UpdateForm').serialize()
				,success:function(){
					alert('저장완료');
					window.opener.opener.location.reload();
					opener.parent.location.reload();
					window.close();
				}
				,error:function(err){
					alert('실패');
				}
			});//ajax
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
		<form id="UpdateForm" name="UpdateForm" method="post">
		<input type="hidden" name="scheduleNum" value="${schedule.scheduleNum}">
		<table>
			<tr>
				<td>Id</td>
				<td>
				<input type="text" id="id" name="id" value="${schedule.id}" readonly>
				</td>
			</tr>
			
			<tr>
				<td>시작시간</td>
				<td>
				<input type="text" id="startTime" name="startTime" value="${schedule.startTime}" readonly>
				</td>
			</tr>
			
			<tr>
				<td>종료시간</td>
				<td>
				<input type="text" id="endTime" name="endTime" value="${schedule.endTime}" readonly>
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
				<input type="text" id="title" name="title" value="${schedule.title}" placeholder="제목">
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="button" value="일정 변경" id="scheduleUpdate">
				</td>
				<td>
					<input type="button" value="취소" onclick="scheduleCancel()">
				</td>
			</tr>
			
		</table>
		</form>
  		
	</body>
</html>