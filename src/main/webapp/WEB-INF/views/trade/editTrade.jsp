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

//글자 수 제한
function chkword(obj, maxlength) {     
	var str = obj.value; // 이벤트가 일어난 컨트롤의 value 값     
	var str_length = str.length; // 전체길이       
	
	// 변수초기화     
	var max_length = maxlength; // 제한할 글자수 크기     
	var i = 0; // for문에 사용     
	var ko_byte = 0; // 한글일경우는 2 그밗에는 1을 더함     
	var li_len = 0; // substring하기 위해서 사용     
	var one_char = ""; // 한글자씩 검사한다     
	var str2 = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.       
	
	for (i = 0; i < str_length; i++) {         // 한글자추출        
		one_char = str.charAt(i);             
		ko_byte++;         
	}           // 전체 크기가 max_length를 넘지않으면        
		
	if (ko_byte <= max_length) {             
		li_len = i + 1;         
	}            // 전체길이를 초과하면     

	if (ko_byte > max_length) {         
		//alert(max_length + " 자릿수 이상 입력할 수 없습니다. \n초과된 내용은 자동으로 삭제 됩니다.");
		alert("더 이상 입력할 수 없습니다. \n초과된 내용은 자동으로 삭제됩니다.");
		str2 = str.substr(0, max_length);         
		obj.value = str2;     
	}     
	obj.focus();   
}

$(document).ready(function() {
	$('#editTrade').click(function() {
		
		var tradeNo, tradeDiv, customerNo, itemCode, paymentDiv, tradeNote;
		var userBn, tradeQuantity, tradePayable, tradeReceivable, tradeTotal;

		userBn = $('#hid_userBn').val();
		tradeNo = $('#tNo').val();
		tradeDiv = $('#tDiv').find("option:selected").val();
		customerNo = $('#input_customer').val();
		itemCode = $('#input_item').val();
		tradeQuantity = $('#input_quantity').val().replace(/[^0-9]/g, "");
		tradePayable = $('#input_payable').val().replace(/[^0-9]/g, "");
		tradeReceivable = $('#input_receivable').val().replace(/[^0-9]/g, "");
		tradeTotal = $('#input_total').val().replace(/[^0-9]/g, "");
		paymentDiv = $('#pDiv').find("option:selected").val();
		tradeNote = $('#input_note').val();
		
//		alert(tradeDiv + ", " + customerNo + ", " + itemCode + ", " + tradeQuantity + ", " 
//				+ tradePayable + ", " + tradeReceivable + ", " + tradeTotal + ", " + paymentDiv + ", " + tradeNote);

		$.ajax({
			type: 'post',
			url: '/trade/updateTrade',
			data: {
				userBn : userBn,
				tradeNo : tradeNo,
				tradeDiv : tradeDiv,
				customerNo : customerNo,
				itemCode : itemCode,
				tradeQuantity : tradeQuantity,
				tradePayable : tradePayable,
				tradeReceivable : tradeReceivable,
				tradeTotal : tradeTotal,
				paymentDiv : paymentDiv,
				tradeNote : tradeNote
			},
			datatype: 'text',
			success: function(data) {
				if (data == 1) {
					alert("수정되었습니다.");
					location.href="/trade/tradeBoardPage";
				} else {
					alert("수정 실패");
				}
			},
			error: function(error) {
				alert(error);
			}
		});
		
	});
	
	$('#input_quantity').keyup(function(){
		var tradeQuantity = $('#input_quantity').val().replace(/[^0-9]/g, "");
		var itemCode = $('#input_item').val();
		
		$.ajax({
			type: 'post',
			url: '/trade/setPrice',
			data: {
				itemCode : itemCode
			}, success: function(data) {
				$('#input_total').val(data * tradeQuantity);
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
			<i class="fa fa-angle-right"></i>거래 정보 페이지
		</h3>
		<input type="hidden" id="hid_userBn" value="${bn }">
		<input type="hidden" id="hid_tradeNo" value="${t.tradeNo }">
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

						<!-- line 1 -->
						<table>
							<tr>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 100px;">등록일자</label>
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
						
						<!-- line 2 -->
						<table>
							<tr>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 100px;">담당직원</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="incharge"
												value="###" readonly="readonly"/>
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 110px;">&emsp;회원등급</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="crk"
												value="###" readonly="readonly"/>
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
											style="width: 100px;">거래구분</label>
										<div class="col-sm-6" style="width: 309px;">
											<select class="form-control" id="tDiv">
												<option id="td1"
												<c:if test="${t.tradeDiv == '판매'}"> selected="selected"</c:if>
												>판매</option>
												<option id="td2"
												<c:if test="${t.tradeDiv == '구매'}"> selected="selected"</c:if>
												>구매</option>
												<option id="td3"
												<c:if test="${t.tradeDiv == '판매취소'}"> selected="selected"</c:if>
												>판매취소</option>
												<option id="td4"
												<c:if test="${t.tradeDiv == '구매취소'}"> selected="selected"</c:if>
												>구매취소</option>
											</select>
										</div>
									</div>
								</td>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 110px;">&emsp;거래처</label>
										<div class="col-sm-6" style="width: 309px;">
											<select class="form-control" id="input_customer">
												<c:forEach var="acc" items="${account}">
													<option value="${acc.customerName }" 
														<c:if test="${t.customerNo == acc.customerName}"> selected="selected"</c:if>
													>${acc.customerCname }</option>
												</c:forEach>
											</select>
											<%-- <input type="text" class="form-control" id="input_customer"
											value="${t.customerNo }" /> --%>
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
											style="width: 100px;">품목</label>
										<div class="col-sm-6" style="width: 309px;">
											<select class="form-control" id="input_item">
												<c:forEach var="item" items="${items}">
													<option value="${item.itemName }" 
														<c:if test="${t.itemCode == item.itemName}" >selected="selected"</c:if>
														> ${item.itemName }</option>
												</c:forEach>
											</select>
											<%-- <input type="text" class="form-control" id="input_item" 
												value="${t.itemCode }" /> --%>
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 110px;">&emsp;수량</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="input_quantity"
											onchange="getNumber(this);" onkeyup="getNumber(this); chkword(this,13);"
												value="${t.tradeQuantity }" style="text-align: right;" />
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
											style="width: 100px;">미지급금</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="input_payable"
											onchange="getNumber(this);" onkeyup="getNumber(this); chkword(this,13);"
												value="${t.tradePayable }" style="text-align: right;" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 110px;">&emsp;미수금</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="input_receivable"
											onchange="getNumber(this);" onkeyup="getNumber(this); chkword(this,13);"
												value="${t.tradeReceivable }" style="text-align: right;" />
										</div>
									</div>
								</td>
							</tr>
						</table>

						<!-- line 6 -->
						<table>
							<tr>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 100px;">총액</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="input_total"
											onchange="getNumber(this);" onkeyup="getNumber(this); chkword(this,13);"
												value="${t.tradeTotal }" style="text-align: right;" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label"
											style="width: 110px;">&emsp;결제수단</label>
										<div class="col-sm-6" style="width: 309px;">
											<select class="form-control" id="pDiv">
												<option id="pd1"
												<c:if test="${t.paymentDiv == '카드'}"> selected="selected"</c:if>
												>카드</option>
												<option id="pd2"
												<c:if test="${t.paymentDiv == '현금'}"> selected="selected"</c:if>
												>현금</option>
												<option id="pd3"
												<c:if test="${t.paymentDiv == '계좌이체'}"> selected="selected"</c:if>
												>계좌이체</option>
												<option id="pd4"
												<c:if test="${t.paymentDiv == '수표'}"> selected="selected"</c:if>
												>수표</option>
											</select>
										</div>
									</div>
								</td>
							</tr>
						</table>

						<!-- line 7 -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label"
								style="width: 100px;">비고 </label>
							<div class="col-sm-6" style="width: 309px;">
								<textarea class="form-control" id="input_note"
									style="width: 666px; height: 85px;">${t.tradeNote }</textarea>
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
						
					</form>
					<!-- line 8 -->
						<div class="form-group" align="center">
							<button id="editTrade" class="btn btn-default">수정하기</button>&nbsp&nbsp
							<button type="button" class="btn btn-default"
								onclick="location.href='/trade/tradeBoard'">목록으로</button>&nbsp&nbsp
							<button type="button" class="btn btn-danger" onclick="location.href='/trade/deleteTrade?tradeNo=${t.tradeNo }'">삭제하기</button>
						</div>
				</div>
			</div>
			<!-- col-lg-12-->
		</div>

		<!-- /row -->
		<%@ include file="../include/footer.jsp"%>