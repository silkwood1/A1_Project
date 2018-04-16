<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

	// ready 함수
	$(document).ready(function() {
		//alert('ready');

		// 안에 있던 값들 날리기
		var blowup;
		blowup = function() {
			$('#tradeDiv').html('&emsp;판매&emsp; <span class="caret"></span>');
			$('#customerNo').val('');
			$('#itemCode').val('');
			$('#tradeQuantity').val('');
			$('#tradePayable').val('');
			$('#tradeReceivable').val('');
			$('#tradeTotal').val('');
			$('#paymentDiv').html('&emsp;카드&emsp; <span class="caret"></span>');
			$('#tradeNote').val('');
		}
		
		// 새 거래 버튼 눌렀을 때 이벤트
		$('#newtrade').click(function() {
			if ($('.newtradeform').css('display') == 'none') {
				$('.newtradeform').css('display', '');
				$('#newtrade').text('닫기');
			} else {
				$('.newtradeform').css('display', 'none');

				// 안에 있던 값들 날리기
				blowup();

				// 버튼 초기화
				$('#newtrade').text('새 거래');
			}
		});

		// 거래구분 dropdown
		$('.tradeOpt').click(function() {
			var str;
			// (this)는 클래스만 적용되는 듯?
			str = $(this).attr('name');
			//alert(str);

			if (str == '1') {
				$('#tradeDiv').attr('name', '1');
				$('#tradeDiv').html('&emsp;판매&emsp; <span class="caret"></span>');
			} else if (str == '2') {
				$('#tradeDiv').attr('name', '2');
				$('#tradeDiv').html('&emsp;구매&emsp; <span class="caret"></span>');
			} else if (str == '3') {
				$('#tradeDiv').attr('name', '3');
				$('#tradeDiv').html('판매취소 <span class="caret"></span>');
			} else if (str == '4') {
				$('#tradeDiv').attr('name', '4');
				$('#tradeDiv').html('구매취소 <span class="caret"></span>');
			}

		});

		// 결제수단구분 dropdown
		$('.paymentOpt').click(function() {
			var str;
			str = $(this).attr('name');

			if (str == '1') {
				$('#paymentDiv').attr('name', '1');
				$('#paymentDiv').html('&emsp;카드&emsp; <span class="caret"></span>');
			} else if (str == '2') {
				$('#paymentDiv').attr('name', '2');
				$('#paymentDiv').html('&emsp;현금&emsp; <span class="caret"></span>');
			} else if (str == '3') {
				$('#paymentDiv').attr('name', '3');
				$('#paymentDiv').html('계좌이체 <span class="caret"></span>');
			} else if (str == '4') {
				$('#paymentDiv').attr('name', '4');
				$('#paymentDiv').html('&emsp;수표&emsp; <span class="caret"></span>');
			}

		});

		 // 새 거래 등록
		$('#insertTrade').click(function() {
			var tradeDiv, customerNo, itemCode, tradeQuantity;
			var tradePayable, tradeReceivable, tradeTotal, paymentDiv, tradeNote;
			
			//alert($('#tradeDiv').html());
			
			if ($('#tradeDiv').attr('name') == '1') {
				tradeDiv = 1;
			} else if ($('#tradeDiv').attr('name') == '2') {
				tradeDiv = 2;
			} else if ($('#tradeDiv').attr('name') == '3') {
				tradeDiv = 3;
			} else if ($('#tradeDiv').attr('name') == '4') {
				tradeDiv = 4;
			}
			
			if ($('#paymentDiv').attr('name') == '1') {
				paymentDiv = 1;
			} else if ($('#paymentDiv').attr('name') == '2') {
				paymentDiv = 2;
			} else if ($('#paymentDiv').attr('name') == '3') {
				paymentDiv = 3;
			} else if ($('#paymentDiv').attr('name') == '4') {
				paymentDiv = 4;
			}
			
			// 숫자만 추출 : .replace(/[^0-9]/g, "")
			customerNo = $('#customerNo').val();
			itemCode = $('#itemCode').val();
			tradeQuantity = $('#tradeQuantity').val().replace(/[^0-9]/g, "");
			tradePayable = $('#tradePayable').val().replace(/[^0-9]/g, "");
			tradeReceivable = $('#tradeReceivable').val().replace(/[^0-9]/g, "");
			tradeTotal = $('#tradeTotal').val().replace(/[^0-9]/g, "");
			tradeNote = $('#tradeNote').val();
			
			alert(tradeDiv + ", " + customerNo + ", " + itemCode + ", " + tradeQuantity
					+ ", " + tradePayable + ", " + tradeReceivable + ", " + tradeTotal + ", " + paymentDiv + ", " + tradeNote);
			
			$.ajax({
				type: 'post',
				url: '/trade/insertTrade',
				//contentType: 'application/json; charset=utf-8',
				data: {
					userBn : "11-111-111",
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
						alert("성공");
						blowup();
						//location.reload();
						//	$('.newtradeform').css('display', '');
					} else {
						alert("실패");
					}
				},
				error: function(error) {
							alert(error);
						}
				});
		});
		 
		 
		$('#tradeStatus').click(function() {
			alert("야호!");
		});

	});
	
	
</script>

<%@include file="../include/header.jsp"%>

<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> Trade Management
		</h3>

		<!-- BASIC FORM ELELEMNTS -->

		<div class="row mt">
			<div class="col-md-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i>거래 관리
					</h4>

					<!-- newtradeform 시작 -->
					<div class="newtradeform" style="display: none;">
						<table class="table table-bordered table-striped table-condensed">
							<!-- thead -->
							<thead>
								<tr>
									<th class="numeric">거래구분</th>
									<th class="numeric">거래처</th>
									<th class="numeric">품목</th>
									<th class="numeric">수량</th>
									<th class="numeric">미지급금</th>
									<th class="numeric">미수금</th>
									<th class="numeric">총액</th>
									<th class="numeric">결제수단</th>
								</tr>
							</thead>

							<!-- tbody -->
							<tbody>
								<tr>
									<td class="numeric">
										<div class="btn-group">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown" id="tradeDiv" style="width: 100px;" name="1">
												&emsp;판매&emsp; <span class="caret"></span>
											</button>
											<ul class="dropdown-menu">
												<li><a href="#" class="tradeOpt" name="1">판매</a></li>
												<li><a href="#" class="tradeOpt" name="2">구매</a></li>
												<li><a href="#" class="tradeOpt" name="3">판매취소</a></li>
												<li><a href="#" class="tradeOpt" name="4">구매취소</a></li>
											</ul>
										</div>
									</td>
									<td class="numeric">
										<div class="col-sm-10">
											<input type="text" class="form-control" style="width: 200px;"
												id="customerNo">
										</div>
									</td>
									<td class="numeric">
										<div class="col-sm-10">
											<input type="text" class="form-control" style="width: 120px;"
												id="itemCode">
										</div>
									</td>
									<td class="numeric">
										<div class="col-sm-10">
											<input type="text" class="form-control" style="width: 100px; text-align: right;"
												onchange="getNumber(this);" onkeyup="getNumber(this);" id="tradeQuantity">
										</div>
									</td>
									<td class="numeric">
										<div class="col-sm-10">
											<input type="text" class="form-control" style="width: 120px; text-align: right;"
												onchange="getNumber(this);" onkeyup="getNumber(this);" id="tradePayable">
										</div>
									</td>
									<td class="numeric">
										<div class="col-sm-10">
											<input type="text" class="form-control" style="width: 120px; text-align: right;"
												onchange="getNumber(this);" onkeyup="getNumber(this);" id="tradeReceivable">
										</div>
									</td>
									<td class="numeric">
										<div class="col-sm-10">
											<input type="text" class="form-control"
												style="width: 120px; text-align: right;"
												onchange="getNumber(this);" onkeyup="getNumber(this);" id="tradeTotal">
										</div>
									</td>
									<td class="numeric">
										<div class="btn-group">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown" id="paymentDiv" style="width: 100px;" name="1">
												&emsp;카드&emsp; <span class="caret"></span>
											</button>
											<ul class="dropdown-menu">
												<li><a href="#" class="paymentOpt" name="1">카드</a></li>
												<li><a href="#" class="paymentOpt" name="2">현금</a></li>
												<li><a href="#" class="paymentOpt" name="3">계좌이체</a></li>
												<li><a href="#" class="paymentOpt" name="4">수표</a></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<td class="numeric" colspan="8">
										<div class="col-sm-10">
											<input type="text" class="form-control round-form"
												placeholder="비고" style="width: 1200px;" id="tradeNote">
										</div>
										<div align="right">
											<button type="button" class="btn btn-info" id="insertTrade">등록</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- newtradeform 끝 -->

					<div align="center">
						<button type="button" class="btn btn-success" id="newtrade">새 거래</button>
						<button type="button" onclick="location.href='/trade/table'">연습</button>
					</div>
					<br>

					
					<!-- trade list -->
					<section id="unseen">
							<table class="table table-bordered table-striped table-condensed">
								<thead>
									<tr>
										<th align="center" class="resizable">번호</th>
										<th align="center" class="resizable">거래구분</th>
										<th align="center" class="resizable">거래처</th>
										<th align="center" class="resizable">품목</th>
										<th align="center" class="resizable">수량</th>
										<th align="center" class="resizable">미지급금</th>
										<th align="center" class="resizable">미수금</th>
										<th align="center" class="resizable">총액</th>
										<th align="center" class="resizable">결제수단</th>
										<!-- <th class="resizable" style="width: 200px;">비고</th> -->
										<th align="center" class="resizable">거래일자</th>
										<th align="center" class="resizable">상태</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach var="b" items="${b}">
										<tr>
											<td align="center" style="cursor: pointer; text-overflow:ellipsis; overflow:hidden" onclick="location.href='/trade/editTrade?tradeNo=${b.tradeNo}'">${b.tradeNo}</td>
											<td align="center" style="cursor: pointer; text-overflow:ellipsis; overflow:hidden" onclick="location.href='/trade/editTrade?tradeNo=${b.tradeNo}'">${b.tradeDiv}</td>
											<td align="center" style="cursor: pointer; text-overflow:ellipsis; overflow:hidden" onclick="location.href='/trade/editTrade?tradeNo=${b.tradeNo}'">${b.customerNo}</td>
											<td align="center" style="cursor: pointer; text-overflow:ellipsis; overflow:hidden" onclick="location.href='/trade/editTrade?tradeNo=${b.tradeNo}'">${b.itemCode}</td>
											<td align="right" style="cursor: pointer; text-overflow:ellipsis; overflow:hidden" onclick="location.href='/trade/editTrade?tradeNo=${b.tradeNo}'"><fmt:formatNumber value="${b.tradeQuantity}" pattern="###,###,###,###" /></td>
											<td align="right" style="cursor: pointer; text-overflow:ellipsis; overflow:hidden" onclick="location.href='/trade/editTrade?tradeNo=${b.tradeNo}'"><fmt:formatNumber value="${b.tradePayable}" pattern="###,###,###,###" /></td>
											<td align="right" style="cursor: pointer; text-overflow:ellipsis; overflow:hidden" onclick="location.href='/trade/editTrade?tradeNo=${b.tradeNo}'"><fmt:formatNumber value="${b.tradeReceivable}" pattern="###,###,###,###" /></td>
											<td align="right" style="cursor: pointer; text-overflow:ellipsis; overflow:hidden" onclick="location.href='/trade/editTrade?tradeNo=${b.tradeNo}'"><fmt:formatNumber value="${b.tradeTotal}" pattern="###,###,###,###" /></td>
											<td align="center" style="cursor: pointer; text-overflow:ellipsis; overflow:hidden" onclick="location.href='/trade/editTrade?tradeNo=${b.tradeNo}'">${b.paymentDiv}</td>
											<!-- <td style="cursor: pointer; text-overflow:ellipsis; overflow:hidden" onclick="location.href='/trade/editTrade?tradeNo=${b.tradeNo}'">${b.tradeNote}</td> -->
											<td align="center" style="cursor: pointer; text-overflow:ellipsis; overflow:hidden" onclick="location.href='/trade/editTrade?tradeNo=${b.tradeNo}'">${b.tradeIndate}</td>
											<td align="center"><input type="button" class="btn btn-warning" value="대기"
											style="height: 5%;" id="tradeStatus"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
					</section>
					<!-- /trade list -->

				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>
		<!-- /row -->






		<%@include file="../include/footer.jsp"%>