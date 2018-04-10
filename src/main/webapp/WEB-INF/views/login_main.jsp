<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 UI</title>
<meta http-equiv="page-enter" content="blendTrans(duration=0.3)">
<meta http-equiv="page-exit" content="blendTrans(duration=0.3)">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css" rel="stylesheet">	
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$("#dialog").dialog({
			autoOpen : false, //자동으로 열리지않게
			position : "center", //x,y  값을 지정
			//"center", "left", "right", "top", "bottom"
			modal : true, //모달대화상자
			width : "450px",
			resizable : false, //크기 조절 못하게

			buttons : {
				"회원가입" : function() {
					$("#join_dialog").dialog("open");
				},
				"아이디 찾기" : function() {
					$("#id_dialog").dialog("open");
				},
				"비밀번호 찾기" : function(){
					$("#pw_dialog").dialog("open");
				}
			}
		});
		
		//회원가입 다이얼로그
		$("#join_dialog").dialog({
			autoOpen : false, //자동으로 열리지않게
			position : "center", //x,y  값을 지정
			//"center", "left", "right", "top", "bottom"
			modal : true, //모달대화상자
			width : "80%",

			buttons : {
				"회원가입" : function() {
					var id = $('#userId').val();
					var chk_num = $('#chk_num').val();
					if(chk_num != '1'){
						alert('아이디를 제대로 입력해주세요.');
						return;
					}
					var pw = $('#userPw').val();
					var pw2 = $('#userPw2').val();
					if(pw == "" || pw == null){
						alert('비밀번호를 입력해주세요.');
						return;
					}
					if(pw != pw2){
						alert('동일한 비밀번호를 입력해주세요.');
						return;
					}
					var Bn = $('#userBsn').val();
					if(Bn == null || Bn == ""){
						alert('사업자번호를 입력해주세요.');
						return;
					}
					var Cn = $('#userComName').val();
					if(Cn == null || Cn == ""){
						alert('회사명을 입력해주세요.');
						return;
					}
					var Un = $('#userName').val();
					if(Un == null || Un == ""){
						alert('대표자명을 입력해주세요.');
						return;
					}
					var Pn = $('#userPhone1').val() + $('#userPhone2').val();
					var Pn2 = $('#userPhone2').val();
					if(Pn2 == null || Pn2 == ""){
						alert('번호를 입력해주세요.');
						return;
					}
					if(Pn2.indexOf("-") != -1){
						alert('번호만 입력해주세요.');
						return;
					}
					var On = $('#userOfficeNum1').val() + $('#userOfficeNum2').val();
					var On2 = $('#userOfficeNum2').val();
					if(On2 == null || On2 == ""){
						On = "";
					}
					var Fn = $('#userFaxNum1').val() + $('#userFaxNum2').val();
					var Fn2 = $('#userFaxNum2').val();
					if(Fn2 == null || Fn2 == ""){
						Fn = "";
					}
					var Em = $('#email1').val() + "@" + $('#email2').val();
					var Em2 = $('#email2').val();
					var Em1 = $('#email1').val();
					if(Em2 == "0" || Em1 == null || Em1 == ""){
						alert('이메일을 제대로 입력해주세요.');
						return;
					}
					var Zn = $('#zipNo').val();
					var Ad = $('#roadFullAddr').val();
					if(Zn == null || Zn == "" || Ad == null || Ad == ""){
						alert('주소를 입력해주세요.');
						return;
					}
					
					var data = {'userId':id, 'userPassword':pw, 'userBn':Bn, 'userCname':Cn, 'userName':Un, 'userCellNo':Pn, 'userOfficeNo':On,
							'userFaxNo':Fn, 'userEmail':Em, 'userZipcode':Zn, 'userAddress':Ad};

					$.ajax({
						url : 'join',
						type : 'post',
						contentType: 'application/json; charset=utf-8',
						data : JSON.stringify(data),
						success : function(data){
							if(data == '1'){
								alert('정상 가입되었습니다.');
							}else{
								alert('회원가입에 실패하였습니다.');
							}
						},
						error : function(err){
							console.log(err);
							alert('회원가입에 실패하였습니다. 다시 시도해주세요.');
						}
					});
					$(this).dialog("close");
				}
			}
		});
		
		//아이디 찾기 다이얼로그
		$("#id_dialog").dialog({
			autoOpen : false, //자동으로 열리지않게
			position : "center", //x,y  값을 지정
			//"center", "left", "right", "top", "bottom"
			modal : true, //모달대화상자
			width : "400px",
			resizable : false, //크기 조절 못하게

			buttons : {
				"아이디 찾기" : function() {
					var id_name = $('#id_name').val();
					var id_email = $('#id_email').val();

					var data = {'userName':id_name, 'userEmail':id_email};
					
					$.ajax({
						type : 'POST',
						url : 'search_id',
						contentType: 'application/json; charset=utf-8',
						data : JSON.stringify(data),
						success : function(data){
							if(data == "0"){
								alert('정확한 정보를 입력해주세요.');
							}else{
								alert("회원님의 아이디는 "+ data + "입니다.");
							}
						},
						error : function(err){
							console.log(err);
							alert("에러");
						}
					});
					$(this).dialog("close");
				}
			},
			close : function(){
				$("#id_name").val("");
				$("#id_email").val("");
			}
		});
		//비밀번호 찾기 다이얼로그
		$("#pw_dialog").dialog({
			autoOpen : false, //자동으로 열리지않게
			position : "center", //x,y  값을 지정
			//"center", "left", "right", "top", "bottom"
			modal : true, //모달대화상자
			width : "400px",
			resizable : false, //크기 조절 못하게

			buttons : {
				"비밀번호 찾기" : function() {
					var p_name = $('#pw_name').val();
					var p_id = $('#pw_id').val();
					var p_email = $('#pw_email').val();

					var data = {'userId':p_id,'userName':p_name, 'userEmail':p_email};
					
					$.ajax({
						type : 'POST',
						url : 'pw_search',
						contentType: 'application/json; charset=utf-8',
						data : JSON.stringify(data),
						success : function(data){
							if(data == "1"){
								alert('메일을 발송하였습니다. 메일을 확인해주세요.');
							}else{
								alert('메일 발송에 실패하였습니다. 정확한 정보를 입력해주세요.');
							}
						},
						error : function(err){
							alert("에러");
						}
					});
					$(this).dialog("close");
				}
			},
			close : function(){
				$("#pw_email").val("");
				$("#pw_id").val("");
				$("#pw_name").val("");
			}
		});
		
		//창 열기 버튼을 클릭했을경우
		$("#btn").on("click", function() {
			$("#dialog").dialog("open"); //다이얼로그창 오픈
		});
	});
	
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("addr_insert","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}


	function jusoCallBack(roadFullAddr, zipNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadFullAddr.value = roadFullAddr;
			document.form.zipNo.value = zipNo;
	}
	
	//아이디 중복검사
	function keyup(){
		var id_text = $('#userId').val();
		var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		
		if(id_text.search(/\s/) != -1){
			$('#id_chk').text('아이디에 공백을 입력할 수 없습니다.');
			$('#chk_num').val('0');
		}else if(special_pattern.test(id_text) == true){
			$('#id_chk').text('아이디에 특수문자를 입력할 수 없습니다.');
			$('#chk_num').val('0');
		}else if(check.test(id_text)){
			$('#id_chk').text('아이디에 한글은 입력할 수 없습니다.');
			$('#chk_num').val('0');
		}else if(id_text == "" || id_text == null){
			$('#id_chk').text('아이디에 공백만 입력할 수 없습니다.');
			$('#chk_num').val('0');			
		}else{
			$.ajax({
				type : 'POST',
				url : 'id_chk',
				data : {'text':id_text},
				dataType : 'text',
				success : function(data){
					if(data == '1'){
						$('#id_chk').text("가입 가능한 아이디입니다.");
						$('#chk_num').val('1');
					}else{
						$('#id_chk').text("가입 불가능한 아이디입니다.");
						$('#chk_num').val('0');
					}
				},
				error : function(error){
					console.log(error);
				}
			});
		}
	}
	
	function login_chk(){
		var id = $('#login_id').val();
		var pw = $('#login_pw').val();
		
		var data = {'userId': id, 'userPassword': pw};
		
		$.ajax({
			type : 'POST',
			url : 'login_chk',
			contentType: 'application/json; charset=utf-8',
			data : JSON.stringify(data),
			success : function(data){
				if(data == "1"){
					$('#login_form').submit();
				}else{
					alert('로그인에 실패하였습니다. 아이디와 비밀번호를 확인해주세요.');
				}
			},
			error : function(err){
				alert("에러");
			}
		});
	}
</script>
<style type="text/css">
body {
	background-color: olive;
}

.cycle-slideshow, .cycle-slideshow * {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.cycle-slideshow {
	width: 500px;
	min-width: 200px;
	max-width: 500px;
	margin: 10px auto;
	padding: 0;
	position: relative;
	margin: 10px auto;
}

.cycle-slideshow div.slide {
	width: 100%;
	height: 100%;
}

.cycle-slideshow img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	padding: 0;
	display: block;
}

.cycle-slideshow img:first-child {
	position: static;
}

.cycle-pager {
	text-align: center;
	width: 100%;
	position: relative;
	overflow: hidden;
}

.cycle-pager span {
	font-family: arial;
	font-size: 50px;
	width: 16px;
	height: 16px;
	display: inline-block;
	color: #ddd;
	cursor: pointer;
}

.cycle-pager span.cycle-pager-active {
	color: #D69746;
}

.cycle-pager>* {
	cursor: pointer;
}

.join_table th, td {
	padding: 5px;
}
</style>
</head>
<body>
	<h2>로그인 UI 예시</h2>
	<div class="cycle-slideshow" data-cycle-fx=scrollHorz
		data-cycle-timeout=3000>
		<div class="cycle-pager"></div>
		<img src="resources/images/1.jpg"> <img
			src="resources/images/2.jpg"> <img src="resources/images/3.jpg">
	</div>

	<input type="button" id="btn" value="창 열기" />

	<div id="dialog" title="로그인">
		<form action="login" method="post" id="login_form">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" placeholder="아이디 입력" name="login_id" id="login_id"></td>
					<td rowspan="2"><input type="button" value="로그인" onclick="login_chk()"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="login_pw" placeholder="비밀번호 입력"></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="join_dialog" title="회원가입">
		<form name="form" id="join_form" method="post">
			<table class="join_table">
				<tr>
					<th>아이디*</th>
					<td><input type="text" id="userId" onkeyup="keyup()"></td>
					<td><span id="id_chk"></span><input type="hidden" id="chk_num" value="0"></td>
				</tr>
				<tr>
					<th>비밀번호*</th>
					<td><input type="password" id="userPw"></td>
				</tr>
				<tr>
					<th>비밀번호 확인*</th>
					<td><input type="password" id="userPw2"></td>
				</tr>
			</table>
			<hr>
			<table class="join_table">
				<tr>
					<th>사업자 등록번호*</th>
					<td><input type="text" id="userBsn"></td>
				</tr>
				<tr>
					<th>회사명*</th>
					<td><input type="text" id="userComName"></td>
				</tr>
				<tr>
					<th>대표자명*</th>
					<td><input type="text" id="userName"></td>
				</tr>
				<tr>
					<th>핸드폰 번호*</th>
					<td><select id="userPhone1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="019">019</option>
					</select> - <input type="text" id="userPhone2"></td>
				</tr>
				<tr>
					<th>사무실 번호</th>
					<td><select id="userOfficeNum1">
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
					</select> - <input type="text" id="userOfficeNum2"></td>
				</tr>
				<tr>
					<th>팩스 번호</th>
					<td><select id="userFaxNum1">
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
					</select> - <input type="text" id="userFaxNum2"></td>
				</tr>
				<tr>
					<th>이메일*</th>
					<td><input type="text" id="email1">@<select id="email2">
							<option value="0">--선택해주세요--</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
					</select></td>
				</tr>
				<tr>
					<th>우편번호*</th>
					<td><input type="text" id="zipNo" readonly="readonly" style="width: 3cm;"></td>
				</tr>
				<tr>
					<th>주소*</th>
					<td><input type="text" id="roadFullAddr" readonly="readonly" style="width: 15cm;"> <input type="button" value="주소 검색" onclick="goPopup()"></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="id_dialog" title="아이디 찾기">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" id="id_name"></td>
			</tr>
			<tr>
				<th>이메일 주소</th>
				<td><input type="email" id="id_email"></td>
			</tr>
		</table>
	</div>

	<div id="pw_dialog" title="비밀번호 찾기">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" id="pw_name"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="pw_id"></td>
			</tr>
			<tr>
				<th>이메일 주소</th>
				<td><input type="email" id="pw_email"></td>
			</tr>
		</table>
	</div>
</body>
</html>
