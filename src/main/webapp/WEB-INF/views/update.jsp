<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="include/header.jsp"%>
<script type="text/javascript">
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("addr_insert", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr, zipNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.zipNo.value = zipNo;
	}
	
	function update_chk(){
			var pw = $('#userPw').val();
			var pw2 = $('#userPw2').val();
			if(pw == "" || pw == null){
				alert('비밀번호를 입력해주세요.');
				return false;
			}
			if(pw != pw2){
				alert('동일한 비밀번호를 입력해주세요.');
				return false;
			}
			var Cn = $('#userCname').val();
			if(Cn == null || Cn == ""){
				alert('회사명을 입력해주세요.');
				return false;
			}
			var Un = $('#userName').val();
			if(Un == null || Un == ""){
				alert('대표자명을 입력해주세요.');
				return false;
			}
			var Pn = $('#userPhone').val();
			if(Pn == null || Pn == ""){
				alert('번호를 입력해주세요.');
				return false;
			}
			if(Pn.indexOf("-") != -1){
				alert('번호만 입력해주세요.');
				return false;
			}
			var On = $('#userOfficeNum').val();
			if(On == null || On == ""){
				On = "";
			}
			var Fn = $('#userFaxNum').val();
			if(Fn == null || Fn == ""){
				Fn = "";
			}
			var Em = $('#email').val();
			if(Em == null || Em == ""){
				alert('이메일을 제대로 입력해주세요.');
				return false;
			}
			var Zn = $('#zipNo').val();
			var Ad = $('#roadFullAddr').val();
			if(Zn == null || Zn == "" || Ad == null || Ad == ""){
				alert('주소를 입력해주세요.');
				return false;
			}
			return true;
	}
	
	var chk_num;
	
	function goodbye(){
		var id = $('#userId').val();
		var pw = $('#userPw').val();
		var pw2 = $('#userPw2').val();
		var email = $('#email').val();
		var name = $('#userName').val();
		if(pw == "" || pw == null){
			alert('비밀번호를 입력해주세요.');
			return;
		}
		if(pw != pw2){
			alert('동일한 비밀번호를 입력해주세요.');
			return;
		}
		
		var data = {'userId':id, 'userPassword':pw, 'userEmail':email, 'userName':name};
		
		$.ajax({
			type : 'POST',
			url : 'goodbye_user',
			contentType: 'application/json; charset=utf-8',
			data : JSON.stringify(data),
			success : function(data){
				if(data == 0){
					alert('이메일 전송에 실패하였습니다.');
				}else{
					alert('이메일로 회원탈퇴 확인 메일을 전송하였습니다. 메일을 확인해주세요.');
					chk_num = data;
					
					$('#col-md-12').html('<div>회원탈퇴 확인 문자열:<input type="text" id="chk_text"><input type="button" id="chk_btn" value="탈퇴"></div>');
					$('#chk_btn').on('click',function(){
						var text = $('#chk_text').val();
						if(chk_num == text){
							alert('회원탈퇴가 정상적으로 처리되었습니다.');
							location.href="goodbye";
						}else{
							alert('확인 문자를 잘못 입력하였습니다. 다시 입력해주세요.');
						}
					});
				}
			},
			error : function(err){
				console.log(err);
				alert("에러");
			}
		});
	}
</script>
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-md-12" id="col-md-12">
				<form name="form" action="update_user" id="update_form" method="post" onsubmit="return update_chk()">
					<table class="update_table">
						<tr>
							<th>아이디*</th>
							<td><input type="text" name="userId" id="userId" value="${user.userId }"
								readonly="readonly" ></td>
						</tr>
						<tr>
							<th>비밀번호*</th>
							<td><input type="password" name="userPassword" id="userPw"></td>
						</tr>
						<tr>
							<th>비밀번호 확인*</th>
							<td><input type="password" id="userPw2"></td>
						</tr>
					</table>
					<hr>
					<table class="join_table">
						<tr>
							<th>사업자 등록번호</th>
							<td><input type="text" name="userBn" id="userBsn" value="${user.userBn }"
								readonly="readonly" ></td>
						</tr>
						<tr>
							<th>회사명*</th>
							<td><input type="text" name="userCname" id="userCname"
								value="${user.userCname }"></td>
						</tr>
						<tr>
							<th>대표자명*</th>
							<td><input type="text" name="userName" id="userName"
								value="${user.userName }"></td>
						</tr>
						<tr>
							<th>핸드폰 번호*</th>
							<td><input type="text" id="userPhone" name="userCellNo"
								value="${user.userCellNo }"></td>
						</tr>
						<tr>
							<th>사무실 번호</th>
							<td><input type="text" id="userOfficeNum" name="userOfficeNo"
								value="${user.userOfficeNo }"></td>
						</tr>
						<tr>
							<th>팩스 번호</th>
							<td><input type="text" id="userFaxNum" name="userFaxNo"
								value="${user.userFaxNo }"></td>
						</tr>
						<tr>
							<th>이메일*</th>
							<td><input type="email" id="email" name="userEmail"
								value="${user.userEmail }" style="width: 8cm;"></td>
						</tr>
						<tr>
							<th>우편번호*</th>
							<td><input type="text" id="zipNo" readonly="readonly" name="userZipcode"
								style="width: 3cm;" value="${user.userZipcode }"></td>
						</tr>
						<tr>
							<th>주소*</th>
							<td><input type="text" id="roadFullAddr" readonly="readonly" name="userAddress"
								style="width: 15cm;" value="${user.userAddress }"> <input
								type="button" value="주소 검색" onclick="goPopup()"></td>
						</tr>
					</table>
					<input type="submit" value="수정">
					<input type="button" value="계정 탈퇴" onclick="goodbye()">
				</form>
			</div>
		</div>
	</section>
</section>

<%@include file="include/footer.jsp"%>