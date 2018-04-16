<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- jQuery 연결 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
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
	//alert('ready');
	var td = $('#hid_tradeDiv').val();
	var pd = $('#hid_paymentDiv').val();
	
	//alert(td + ", " + pd);
	
	// 거래구분 select
	if (td == '판매') {
		$('#td1').attr('selected', 'selected');
	} else if (td == '구매') {
		$('#td2').attr('selected', 'selected');
	} else if (td == '판매취소') {
		$('#td3').attr('selected', 'selected');
	} else if (td == '구매취소') {
		$('#td4').attr('selected', 'selected');
	}
	
	// 결제수단 select
	if (pd == '카드') {
		$('#pd1').attr('selected', 'selected');
	} else if (pd == '현금') {
		$('#pd2').attr('selected', 'selected');
	} else if (pd == '계좌이체') {
		$('#pd3').attr('selected', 'selected');
	} else if (pd == '수표') {
		$('#pd4').attr('selected', 'selected');
	}
	
	// 수정하기 버튼 눌렀을 때
	var openEdit;
	openEdit = function() {
		$('#tDiv').prop('diabled', false);
		$('#cne').prop('readonly', false);
		$('#ice').prop('readonly', false);
		$('#tqy').prop('readonly', false);
		$('#tpl').prop('readonly', false);
		$('#trl').prop('readonly', false);
		$('#ttl').prop('readonly', false);
		$('#pDiv').prop('disabled', false);
		$('#incharge').prop('readonly', false);
		$('#crk').prop('readonly', false);
		$('#tnote').prop('readonly', false);
	}
	
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
			<i class="fa fa-angle-right"></i>거래 정보 페이지
		</h3>
		<input type="hidden" id="hid_tradeDiv" value="${t.tradeDiv }">
		<input type="hidden" id="hid_paymentDiv" value="${t.paymentDiv }">
		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h4 class="mb" align="left">
						<i class="fa fa-angle-right"></i> 거래 정보
					</h4>
					<form class="form-horizontal style-form"
						enctype="multipart/form-data">

						<table>
							<tr>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 100px;">거래일자</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="tDate"
											value="${t.tradeIndate }" readonly="readonly" />
										</div>
									</div>
								</td>
								
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 110px;">&emsp;거래번호</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="tNo"
											value="${t.tradeNo }" readonly="readonly" />
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
											style="width: 100px;">거래구분</label>
										<div class="col-sm-6" style="width: 309px;">
											<select class="form-control" id="tDiv" disabled="disabled">
												<option id="td1">판매</option>
												<option id="td2">구매</option>
												<option id="td3">판매취소</option>
												<option id="td4">구매취소</option>
											</select>
										</div>
									</div>
								</td>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 110px;">&emsp;거래처</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="cne" name="CN"
											value="${t.customerNo }" readonly="readonly"/>
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
											style="width: 100px;">품목</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="ice"
												name="RegDate" value="${t.itemCode }" readonly="readonly" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 110px;">&emsp;수량</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="tqy"
											onchange="getNumber(this);" onkeyup="getNumber(this);"
												name="BsnNum" value="${t.tradeQuantity }" readonly="readonly"
												style="text-align: right;" />
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
											style="width: 100px;">미지급금</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="tpl"
											onchange="getNumber(this);" onkeyup="getNumber(this);"
												name="CName" value="${t.tradePayable }" readonly="readonly"
												style="text-align: right;" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 110px;">&emsp;미수금</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="trl"
											onchange="getNumber(this);" onkeyup="getNumber(this);"
												name="RepreName" value="${t.tradeReceivable }" readonly="readonly"
												style="text-align: right;" />
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
											style="width: 100px;">총액</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="ttl"
											onchange="getNumber(this);" onkeyup="getNumber(this);"
												name="BsnNum" value="${t.tradeTotal }" readonly="readonly"
												style="text-align: right;" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 110px;">&emsp;결제수단</label>
										<div class="col-sm-6" style="width: 309px;">
											<select class="form-control" id="pDiv" name="field" disabled="disabled">
												<option id="pd1">카드</option>
												<option id="pd2">현금</option>
												<option id="pd3">계좌이체</option>
												<option id="pd4">수표</option>
											</select>
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
											style="width: 100px;">담당직원</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="incharge"
												name="Staff" value="###" readonly="readonly"/>
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 110px;">&emsp;회원등급</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="crk"
												name="Staff" value="###" readonly="readonly"/>
										</div>
									</div>
								</td>
							</tr>
						</table>

						<!-- line 6 -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">비고 </label>
							<div class="col-sm-6" style="width: 309px;">
								<textarea class="form-control" id="tnote" name="Remark"
									style="width: 666px; height: 85px;" readonly="readonly">${t.tradeNote }</textarea>
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
							<button id="goEdit" class="btn btn-default" onclick="openEdit()">수정하기</button>&nbsp&nbsp
							<button type="button" class="btn btn-default"
								onclick="location.href='/trade/tradeBoard'">목록으로</button>&nbsp&nbsp
							<button type="button" class="btn btn-danger" onclick="location.href='/trade/deleteTrade?tradeNo=${t.tradeNo }'">삭제하기</button>
						</div>
					</form>
				</div>
			</div>
			<!-- col-lg-12-->
		</div>

		<!-- /row -->
		<%@ include file="../include/footer.jsp"%>