<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<style type="text/css">
.center {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 300px;
	height: 200px;
	overflow: hidden;
	background-color: #FC0;
	margin-top: -150px;
	margin-left: -100px;
}
</style>
</head>
<body>
	<div class="center">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text"></td>
				<td rowspan="2"><a href="owner"><input type="button" value="로그인"></a></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td><input type="button" value="회사 소개"></td>
				<td><input type="button" value="회원 가입"></td>
			</tr>
		</table>
	</div>
</body>
</html>
