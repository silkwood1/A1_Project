<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삭제 실패</title>
<script type="text/javascript">
function fail(){
	alert('거래 기록이 있는 거래처입니다. 삭제할 수 없습니다.');
	location.href="/account/accountBoard";
}
</script>
</head>
<body onload="fail()">

</body>
</html>