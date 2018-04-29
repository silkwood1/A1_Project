<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File, java.util.UUID"%>
<%@ page import="java.awt.image.BufferedImage, javax.imageio.ImageIO"%>
<%@ page import="com.google.zxing.qrcode.QRCodeWriter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>

<script type="text/javascript"
	src="../resources/assets/js/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#execute").click(
						function() {
							url = "/createQRcode";
							var userBsn = $("#userBsn").val();
							var customerNum = $("#customerNum").val();
							var customerDiv = $("#customerDiv").val();
							var customerBsn = $("#customerBsn").val();
							var customerCName = $("#customerCName").val();
							var customerName = $("#customerName").val();
							var customerCellNum = $("#customerCellNum").val();
							var customerOfficeNum = $("#customerOfficeNum")
									.val();
							var customerFaxNum = $("#customerFaxNum").val();
							var customerEmail = $("#customerEmail").val();
							var customerZipCode = $("#customerZipCode").val();
							var customerAddress = $("#customerAddress").val();
							var customerIndate = $("#customerIndate").val();
							var customerRankDiv = $("#customerRankDiv").val();
							var incharge = $("#incharge").val();
							var customerNote = $("#customerNote").val();

							var content = userBsn + "," + customerNum + ","
									+ customerDiv + "," + customerBsn + ","
									+ customerCName + "," + customerName + ","
									+ customerCellNum + "," + customerOfficeNum
									+ "," + customerFaxNum + ","
									+ customerEmail + "," + customerZipCode
									+ "," + customerAddress + ","
									+ customerIndate + "," + customerRankDiv
									+ "," + incharge + "," + customerNote;

							$("#img").attr("src", url + "?content=" + content);

							$("#company").attr("value", customerCName);
						});
			});
	function changeValue() {
		var option = document.getElementById('filter').value;

		if (option == "0") {
			alert('정확한 거래처를 선택해주세요.');
			return false;
		}

		$("#filter").click(function() {

			$.ajax({
				type : "post",
				url : 'qrPage',
				data : {
					'bsnNum' : option
				},
				success : function(data) {
					alert("성공");
					alert(data.userBn);
					$("#subtitle").val(data.customerCname);
					$("#userBsn").val(data.userBn);
					$("#customerNum").val(data.customerNo);
					$("#customerDiv").val(data.customerDiv);
					$("#customerBsn").val(data.customerBn);
					$("#customerCName").val(data.customerCname);
					$("#customerName").val(data.customerName);
					$("#customerCellNum").val(data.customerCellNo);
					$("#customerOfficeNum").val(data.customerOfficeNo);
					$("#customerFaxNum").val(data.customerFaxNo);
					$("#customerEmail").val(data.customerEmail);
					$("#customerZipCode").val(data.customerZipcode);
					$("#customerAddress").val(data.customerAddress);
					$("#customerIndate").val(data.customerIndate);
					$("#customerRankDiv").val(data.rankDiv);
					$("#incharge").val(data.incharge);
					$("#customerNote").val(data.customerNote);
				},
				error : function(err) {
					console.log(err);
				}
			});
		});
	}
</script>

<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> QR CODE 생성
		</h3>
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h4 class="mb">
						<i class="fa fa-angle-right"></i>QR CODE 생성
					</h4>
					<form action="createQRcode" class="form-horizontal style-form"
						method="get">
						<div id="printArea" align="center">
							<div class="form-group">


								<label class="col-sm-2 col-sm-2 control-label">QR 코드</label>
								<div class="col-sm-3">
									<img id="img" style="display: none"
										onload="this.style.display='block'" /> 고객사명 <input
										type="text" id="company" class="form-control"
										readonly="readonly" disabled="disabled">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">고객사</label>
							<div class="col-sm-3">
								<select name="filter" id="filter" class="form-control"
									onchange="changeValue();">
									<option value="0">--거래처를 선택하십시오--</option>
									<c:forEach var="a" items="${A}">
										<option value="${a.customerBn}">${a.customerCname}</option>
										<!-- <option value="A">A</option>
										<option value="B">B</option> -->
									</c:forEach>
								</select>

							</div>

						</div>




						<div class="form-group">

							<label class="col-sm-2 col-sm-2 control-label">사업자 등록번호</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="userBsn">
							</div>


							<label class="col-sm-2 col-sm-2 control-label">고객 번호</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerNum">
							</div>

						</div>
						<div class="form-group">

							<label class="col-sm-2 col-sm-2 control-label">고객 분류</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerDiv">
							</div>

							<label class="col-sm-2 col-sm-2 control-label">고객 사업자
								등록번호</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerBsn">
							</div>

						</div>
						<div class="form-group">

							<label class="col-sm-2 col-sm-2 control-label">고객사</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerCName">
							</div>



							<label class="col-sm-2 col-sm-2 control-label">대표명</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerName">
							</div>

						</div>
						<div class="form-group">

							<label class="col-sm-2 col-sm-2 control-label">휴대전화</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerCellNum">
							</div>


							<label class="col-sm-2 col-sm-2 control-label">사무실 번호</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerOfficeNum">
							</div>

						</div>
						<div class="form-group">

							<label class="col-sm-2 col-sm-2 control-label">팩스 번호</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerFaxNum">
							</div>


							<label class="col-sm-2 col-sm-2 control-label">이메일</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerEmail">
							</div>

						</div>
						<div class="form-group">

							<label class="col-sm-2 col-sm-2 control-label">우편번호</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerZipCode">
							</div>


							<label class="col-sm-2 col-sm-2 control-label">주소</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerAddress">
							</div>

						</div>
						<div class="form-group">

							<label class="col-sm-2 col-sm-2 control-label">가입날짜</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerIndate">
							</div>

							<label class="col-sm-2 col-sm-2 control-label">고객사 등급</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerRankDiv">
							</div>

						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">담당직원</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="incharge">
							</div>
							<label class="col-sm-2 col-sm-2 control-label">비고</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerNote">
							</div>
						</div>
						<div>
							<div>
								<input type="button" class="btn btn-success" id="execute"
									value="QR코드생성" /> <input type="button"
									class="btn btn-warning btn-sm" value="프린트"
									onclick="javascript:content_print();">
							</div>
						</div>
					</form>
				</div>
			</div>
	</section>
</section>

<%@include file="../include/footer.jsp"%>