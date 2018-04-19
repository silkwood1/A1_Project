<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>[ ReviceForm ]</title>
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
	<script src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
	<script type="text/javascript">
	function deleteSchedule(num){
		if (confirm("정말 삭제하시겠습니까??") == true){//확인
			var loc = location;
			$.ajax({
				url:'../deleteSchedule'
				,type: 'post'
				,data:{
					'scheduleNum':num
				}
				,success:function(){
					alert('저장완료');
					loc.reload();
					opener.parent.location.reload();
				}
				,error:function(err){
					console.log(err);
				}
			});//ajax
		}//if
	}//function
	function exit(){
		window.close();
	}
	function updateSchedule(scheduleNum){
		if (confirm("정말 수정하시겠습니까??") == true){    //확인
			window.open('./updateForm?scheduleNum='+scheduleNum,'Updater','width=500,height=500');
		}//if
	}//function
	</script>
	</head>
	<body>
		<h1>[ ReviceForm ]</h1>
		<table>
		<tr>
			<th>계정</th>
			<th>시작시간</th>
			<th>종료시간</th>
			<th>일정</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.id}</td>
			<td>${list.startTime}</td>
			<td>${list.endTime}</td>
			<td>${list.title}</td>
			<td>
				<a href="javascript:updateSchedule(${list.scheduleNum})">수정</a>
			</td>
			<td>
				<a href="javascript:deleteSchedule(${list.scheduleNum})">삭제</a>
			</td>
		</tr>
		</c:forEach>
		</table>
		<input type="button" value="닫기" onclick="exit()">
	</body>
</html>