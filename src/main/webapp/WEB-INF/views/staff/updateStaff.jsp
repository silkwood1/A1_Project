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
		
		var staffId = document.getElementById('staffId');
		var staffPassword = document.getElementById('staffPassword');
		
		if(staffId == ""){
			alert("아이디를 적어주세요");
			return false;
		}
		if(staffPassword == ""){
			alert("비번을 적어주세요");
			return false;
		}
		return true;
}
</script>

<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>직원 정보 페이지
		</h3>

		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<!--사원정보 글쓰기  -->
					<br>
					
					<form action="update_staff" method="post" onsubmit="return formCheck();"
						class="form-horizontal style-form" enctype="multipart/form-data">
						<!---->
						<input type="hidden" name="staffNo" value="${staff.staffNo }">

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 125px;">이름*</label>
							<div class="col-sm-6" style="width: 200px;">
								<input type="text" class="form-control" id="staffName"
									name="staffName" value="${staff.staffName }"/>
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">주민번호*</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="text" class="form-control" id="staffIdno"
									name="staffIdno" value="${staff.staffIdno}" />
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
								<input type="text" class="form-control" id="staffIndate"
									name="staffIndate" value="${staff.staffIndate}" disabled="disabled" />
							</div>

						</div>

						<!--line 3  -->

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 125px;">휴대전화*</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="text" class="form-control" id="staffCellNo"
									name="staffCellNo" value="${staff.staffCellNo }"/>
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">집 전화번호</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="text" class="form-control" id="staffTellNo"
									name="staffTellNo" value="${staff.staffTellNo }"/>
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 70px;">이메일</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="text" class="form-control" id="staffEmail"
									name="staffEmail" placeholder="@을 포함해서 적어주세요" value="${staff.staffEmail }"/>
							</div>
						</div>

						<!--line 4  -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 125px;">주소*</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="roadFullAddr"
									name="staffAddress" onclick="goPopup()" value="${staff.staffAddress }" readonly="readonly"/>
							
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">우편번호*</label>
							<div class="col-sm-6" style="width: 220px;">
								<input type="text" class="form-control" id="zipNo"
									 name="staffZipcode" value="${staff.staffZipcode }" readonly="readonly"/>
							</div>
						</div>
						<!--line 5  -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 125px;">급여*</label>
							<div class="col-sm-6" style="width: 250px;">
								<input type="text" class="form-control" id="staffSalary"
									name="staffSalary" placeholder="원" style="text-align: right;" 
									value="${staff.staffSalary }"/>
							</div>

							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">은행</label>
							<div class="col-sm-6" style="width: 185px;">
								<select class="form-control" id="bankDiv" name="bankDiv">
									<option selected="selected" value="1">신한은행</option>
									<option value="2">우리은행</option>
									<option value="3">국민은행</option>
								</select>
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">계좌번호*</label>
							<div class="col-sm-6" style="width: 220px;">
								<input type="text" class="form-control" id="staffAccountNo"
									name="staffAccountNo" value="${staff.staffAccountNo }"/>
							</div>
						</div>
						
						<!--line 6 -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 125px;">아이디*</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="staffId"
									name="staffId" value="${staff.staffId }" readonly="readonly"/>
							</div>
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">비밀번호*</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="staffPassword"
									name="staffPassword" value="${staff.staffPassword }" readonly="readonly"/>
							</div>
						</div>

						<!-- line 7 -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label" style="width: 125px;">비고 </label>
							<div class="col-sm-6">
								<textarea class="form-control" id="staffNote" name="staffNote">${staff.staffNote}</textarea>
							</div>
						</div>

						<!-- line 8 -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label" style="width: 125px;">사진첨부</label>

							<div class="col-sm-5">
								<input type="file" class="form-control" id="upload" name="upload" size="50"> ${staff.originalfile}
							</div>
							
							
						</div>

						<!-- line 9 -->
						<div class="form-group" align="center">
							<input type="submit" class="btn btn-theme" id="updatebtn" name="updatebtn" value="수정">
							<button type="button" class="btn btn-theme"
								onclick="location.href='stafflist'">목록으로</button>
							<a href="deleteStaff?staffNo=${staff.staffNo }" class="btn btn-theme"
								>삭제</a>
						</div>

					</form>
				</div>
			</div>
			<!-- col-lg-12-->
		</div>
</section>
</section>
		<!-- /row -->
		<%@ include file="../include/footer.jsp"%>>