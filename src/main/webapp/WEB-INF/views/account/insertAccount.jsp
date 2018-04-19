<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- jQuery 연결 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

//주소 입력
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("../addr_insert","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr, zipNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.zipNo.value = zipNo;
}

// 일반전화번호
var pnb = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))-(\d{3,4})-(\d{4})$/;

function autoHypenPhone(str) {
	  str = str.replace(/[^0-9]/g, '');
	  var tmp = '';
	  if(str.length < 4){
	    return str;
	  } else if (str.length < 7){
	    tmp += str.substr(0, 3);
	    tmp += '-';
	    tmp += str.substr(3);
	    return tmp;
	  } else if (str.length < 11) {
	    tmp += str.substr(0, 3);
	    tmp += '-';
	    tmp += str.substr(3, 3);
	    tmp += '-';
	    tmp += str.substr(6);
	    return tmp;
	  } else {        
	    tmp += str.substr(0, 3);
	    tmp += '-';
	    tmp += str.substr(3, 4);
	    tmp += '-';
	    tmp += str.substr(7);
	    return tmp;
	  }
	  return str;
	}

//숫자 받기, ',' 찍기
//[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
//[0-9] => \d , [^0-9] => \D
var rgx1 = /\D/g; // /[^0-9]/g 와 같은 표현
var rgx2 = /(\d+)(\d{3})/;

function getNumber(obj) {
	var num01;
	var num02;
	num01 = obj.value;
	num02 = num01.replace(rgx1, "");
	num01 = setComma(num02);
	obj.value = num01;
}

function setComma(inNum) {
	var outNum;
	outNum = inNum;
	while (rgx2.test(outNum)) {
		outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
	}
	return outNum;
}

$(document).ready(function() {
	
	// 등록하기 버튼
	$('#submit').click(function(){
		var userBn, customerDiv, customerBn, customerCname, customerName, customerCellNo, customerOfficeNo;
		var customerFaxNo, customerEmail, customerZipcode, customerAddress, rankDiv, inCharge, customerNote;
		
		userBn = $('#hid_userBn').val();
		
		customerDiv = $('#select_cDiv option:selected').val();	// select된 값
		if (customerDiv == '판매처') {
			customerDiv = 1;
		} else if (customerDiv == '구매처') {
			customerDiv = 2;
		} else if (customerDiv == '기타') {
			customerDiv = 3;
		}
		
		customerBn = $('#input_customerBn').val();
		customerCname = $('#input_customerCname').val();
		customerName = $('#input_customerName').val();
		customerCellNo = $('#input_customerCellNo').val();
		customerOfficeNo = $('#input_customerOfficeNo').val();
		customerFaxNo = $('#input_customerFaxNo').val();
		customerEmail = $('#input_customerEmail').val();
		customerZipcode = $('#zipNo').val();
		customerAddress = $('#roadFullAddr').val();
		
		rankDiv = $('#select_rDiv option:selected').val();	// select된 값
		if (rankDiv == '브론즈') {
			rankDiv = 1;
		} else if (rankDiv == '실버') {
			rankDiv = 2;
		} else if (rankDiv == '골드') {
			rankDiv = 3;
		} else if (rankDiv == '플래티넘') {
			rankDiv = 4;
		}
		
		inCharge = $('#input_inCharge').val();
		customerNote = $('#input_customerNote').val();
		
//		alert(customerDiv + ", " + rankDiv);
		alert(userBn + ", " + customerDiv + ", " + customerBn + ", " + customerCname + ", " + customerName + ", " + 
				customerCellNo + ", " + customerOfficeNo + ", " + customerFaxNo
				 + ", " + customerEmail + ", " + customerZipcode
				 + ", " + customerAddress + ", " + rankDiv + ", " + inCharge + ", " + customerNote);
	
		$.ajax({
			type: 'post',
			url: '/account/insertAccount',
			data: {
				userBn : userBn,
				customerDiv : customerDiv,
				customerBn : customerBn,
				customerCname : customerCname,
				customerName : customerName,
				customerCellNo : customerCellNo,
				customerOfficeNo : customerOfficeNo,
				customerFaxNo : customerFaxNo,
				customerEmail : customerEmail,
				customerZipcode : customerZipcode,
				customerAddress : customerAddress,
				rankDiv : rankDiv,
				inCharge : inCharge,
				customerNote : customerNote
			},
			datatype: 'text',
			success: function(data) {
				if (data == 1) {
					alert("등록되었습니다.");
					location.href="/account/accountBoard";
				} else {
					alert("실패");
				}
			},
			error: function(error) {
				alert(error);
			}
		});
	});
	
	
});



</script>
<%@ include file="../include/header.jsp"%>

<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>새 거래처
		</h3>
		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h4 class="mb" align="left">
						<i class="fa fa-angle-right"></i> 거래처 정보
					</h4>
					<form class="form-horizontal style-form"
						enctype="multipart/form-data" name="form">
						<input type="hidden" id="hid_userBn" value="${bn }">
						<table>
							<tr>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 100px;">고객구분</label>
										<div class="col-sm-6" style="width: 309px;">
											<select class="form-control" id="select_cDiv">
												<option selected="selected">판매처</option>
												<option>구매처</option>
												<option>기타</option>
											</select>
										</div>
									</div>
								</td>
								
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 150px;">&emsp;사업자번호</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="input_customerBn" />
										</div>
									</div>
								</td>
							</tr>
						</table>
						
						<!-- line 1 -->
						<table>
							<tr>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 100px;">상호명</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="input_customerCname" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 150px;">&emsp;대표자명</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="input_customerName"/>
										</div>
									</div>
								</td>
							</tr>
						</table>

						<!-- line 2 -->
						<table>
							<tr>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 100px;">휴대전화</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="input_customerCellNo"
											onkeyup="autoHypenPhone(this)" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 150px;">&emsp;사무실</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="input_customerOfficeNo"/>
										</div>
									</div>
								</td>
							</tr>
						</table>

						<!-- line 3 -->
						<table>
							<tr>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 100px;">팩스번호</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="input_customerFaxNo" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 150px;">&emsp;이메일</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="input_customerEmail" name="CN"/>
										</div>
									</div>
								</td>
							</tr>
						</table>

						<!-- line 4 -->
						<table>
							<tr>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 100px;">우편번호</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" onclick="goPopup()" class="form-control" id="zipNo" placeholder="클릭하여 주소 입력" readonly="readonly"/>
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 150px;">&emsp;상세주소</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="roadFullAddr" name="CN" readonly="readonly"/>
										</div>
									</div>
								</td>
							</tr>
						</table>

						<!-- line 5 -->
						<table>
							<tr>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 100px;">회원등급</label>
										<div class="col-sm-6" style="width: 309px;">
											<select class="form-control" id="select_rDiv">
												<option selected="selected">브론즈</option>
												<option>실버</option>
												<option>골드</option>
												<option>플래티넘</option>
											</select>
										</div>
									</div>
								</td>
								
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 150px;">&emsp;담당직원</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="input_inCharge"
												name="Staff" readonly="readonly"/>
										</div>
									</div>
								</td>
							</tr>
						</table>

						<!-- line 6 -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">비고</label>
							<div class="col-sm-6" style="width: 320px;">
								<textarea class="form-control" id="input_customerNote"
									style="width: 705px; height: 85px;" ></textarea>
							</div>
							<br> <br>
						</div>

						<!-- line 7 -->
						<!-- <div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">파일첨부</label>
							<div class="col-sm-6" style="width: 309px;">
								<input type="file" class="form-control" name="upload"
									style="width: 666px;">
							</div>
						</div> -->
						

						<!-- line 8 -->
						<div class="form-group" align="center">
							<button id="goEdit" class="btn btn-default" onclick="redirect:/account/goInsertAccount">수정하기</button>&nbsp&nbsp
							<button type="button" class="btn btn-success" id="submit">등록하기</button>&nbsp&nbsp
							<button type="button" class="btn btn-default"
								onclick="location.href='/account/accountBoard'">목록으로</button>
						</div>
					</form>
				</div>
			</div>
			<!-- col-lg-12-->
		</div>

		<!-- /row -->
		<%@ include file="../include/footer.jsp"%>