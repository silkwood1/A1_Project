<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<script type="text/javascript">

	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("../addr_insert", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr, zipNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.zipNo.value = zipNo;
	}


function formCheck() {
		//유효성검사
		var staffId = document.getElementById('staffId').value;		//ID
		var staffPassword = document.getElementById('staffPassword').value; //PW
		var staffName = document.getElementById('staffName').value;	//name
		var staffIdno = document.getElementById('staffIdno').value;	//idno
		var positionDiv = document.getElementById('positionDiv').value;	//position
		var staffIndate = document.getElementById('staffIndate').value;	//inputdate
		var staffCellNo = document.getElementById('staffCellNo').value;	//tel
		var roadFullAddr = document.getElementById('roadFullAddr').value;	//address
		var zipNo = document.getElementById('zipNo').value;	//zip
		var staffSalary = document.getElementById('staffSalary').value;	//sal
		var bankDiv = document.getElementById('bankDiv').value;	//bank
		var staffAccountNo = document.getElementById('staffAccountNo').value;	//account
		var chk_num = $('#chk_num').val();
		
		if(chk_num != '1'){
			alert('아이디를 제대로 입력해주세요.');
			return false;
		}

		if(staffName == ""){
			alert("이름를 입력해주세요.");
			return false;
		}
		if(staffIdno == ""){
			alert("주민번호를 입력해주세요.");
			return false;
		}
		//문자 유효성체크하기
		if(staffIdno.length > 13){
			alert("주민번호를 확인해주세요.");
			return false;
		}
		
		if(positionDiv == ""){
			alert("직급을 정해주세요.");
			return false;
		} 

		if(staffIndate == ""){
			alert("입사일을 선택해주세요.");
			return false;
		}
		//문자 유효성체크하기 
		if(staffCellNo == ""){
			alert("휴대전화번호를 입력해주세요.");
			return false;
		}
		
		if(roadFullAddr == "" || zipNo == ""){
			alert("주소를 입력해주세요.");
			return false;
		}
		if(staffSalary == ""){
			alert("급여을 입력해주세요.");
			return false;
		} 
		if(bankDiv == ""){
			alert("은행을 정해주세요.");
			return false;
		}
		if(staffAccountNo == ""){
			alert("계좌번호를 입력해주세요.");
			return false;
		} 
		if(staffId == ""){
			alert("아이디를입력해주세요.");
			return false;
		}
		if(staffPassword == ""){
			alert("비밀번호을 입력해주세요.");
			return false;
		}
		return true;
}

	function keyup() {
		var id_text = $('#staffId').val();
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
				url : 'staff_id_chk',
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
</script>

<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>직원 등록
		</h3>

		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<!--사원정보 글쓰기  -->
					<br>
					
					<form name="form" action="join_staff" method="post" onsubmit="return formCheck();"
						class="form-horizontal style-form" enctype="multipart/form-data">
						<!---->
					

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 125px;">이름*</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="text" class="form-control" id="staffName"
									name="staffName"/>
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">주민번호*</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="text" class="form-control" id="staffIdno" style="width: 10cm;"
									name="staffIdno" placeholder="-를 뺀 숫자 13자리를 입력해주세요."/>
							</div>
						</div>
						<!-- line 2 -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 125px;">사업자등록번호</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="text" class="form-control" id="userBn"
									name="userBn" value="${bn}" readonly="readonly"/>
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">직급구분*</label>
							<div class="col-sm-6" style="width: 150px;">
								<select class="form-control" id="positionDiv" name="positionDiv">
									<option selected="selected" value="1">사원</option>
									<option value="2">매니저</option>
									<option value="3">사장</option>
								</select>
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 70px;">입사일</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="date" class="form-control" min="2017-09-01" max="2030-09-01" id="staffIndate"
									name="staffIndate" />
							</div>

						</div>

						<!--line 3  -->

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 125px;">휴대전화*</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="text" class="form-control" id="staffCellNo"
									name="staffCellNo" placeholder="-를 빼고 입력해주세요."/>
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">집 전화번호</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="text" class="form-control" id="staffTellNo"
									name="staffTellNo" />
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 70px;">이메일</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="text" class="form-control" id="staffEmail"
									name="staffEmail" placeholder="@을 포함해서 적어주세요"/>
							</div>
						</div>

						<!--line 4  -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 125px;">주소*</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="roadFullAddr"
									name="staffAddress" onclick="goPopup()" readonly="readonly"/>
							
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">우편번호*</label>
							<div class="col-sm-6" style="width: 220px;">
								<input type="text" class="form-control" id="zipNo"
									 name="staffZipcode" readonly="readonly" />
							</div>
						</div>
						<!--line 5  -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 125px;">급여*</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="text" class="form-control" id="staffSalary"
									name="staffSalary" placeholder="원" style="text-align: right;" 
									/>
							</div>

							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">은행</label>
							<div class="col-sm-6" style="width: 185px;">
								<select class="form-control" id="bankDiv" name="bankDiv">
									<option selected="selected" value="1">신한은행</option>
									<option value="2">국민은행</option>
									<option value="3">우리은행</option>
								</select>
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">계좌번호*</label>
							<div class="col-sm-6" style="width: 220px;">
								<input type="text" class="form-control" id="staffAccountNo"
									name="staffAccountNo"/>
							</div>
						</div>
						<!--line 6 -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 125px;">아이디*</label>
							<div class="col-sm-3" style="width: 250px;">
								<input type="text" class="form-control" id="staffId"
									name="staffId" onkeyup="keyup()"/>
									<span id="id_chk"></span>
									<input type="hidden" id="chk_num" value="0">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 125px;">비밀번호*</label>
							<div class="col-sm-3" style="width: 250px;">
								<input type="text" class="form-control" id="staffPassword"
									name="staffPassword"/>
							</div>
						</div>
						
						<!-- line 7 -->


						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label" style="width: 125px;">비고 </label>
							<div class="col-sm-6">
								<textarea class="form-control" id="staffNote" name="staffNote"></textarea>
							</div>
						</div>

						<!-- line 8 -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label" style="width: 125px;">사진첨부</label>

							<div class="col-sm-5">
								<input type="file" class="form-control" id="upload" name="upload" size="50">
							</div>
							
							
						</div>

						<!-- line 9 -->
						<div class="form-group" align="center">
							<input type="submit" class="btn btn-theme" id="savebtn" name="savebtn" value="저장">
							<button type="button" class="btn btn-theme"
								onclick="location.href='stafflist'">목록으로</button>
						</div>

					</form>
				</div>
			</div>
			<!-- col-lg-12-->
		</div>
</section>
</section>
		<!-- /row -->
		<%@ include file="../include/footer.jsp"%>