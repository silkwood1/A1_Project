<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>

<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<!--main content start-->
<script type="text/javascript">
$(document).ready(function() {
	$('#insert_btn').click(function(){
		var div = $('#itemDiv').val();
		var code = $('#itemCode').val();
		var name = $('#itemName').val();
		var price1 = $('#itemPrice1').val();
		var price2 = $('#itemPrice2').val();
		var quantity = $('#itemQuantity').val();
		
		if(code == "" || code == null){
			alert('품목코드를 입력해주세요.');
			return;
		}else if(name == "" || name == null){
			alert('품목명을 입력해주세요.');
			return;
		}else if(price1 == "" || price1 == null){
			price1 = "";
		}else if(price2 == "" || price2 == null){
			price2 = "";
		}else if(quantity == "" || quantity == null){
			quantity = "";
		}
		
		var data = {'itemCode' : code};
		
		$.ajax({
			type : 'POST',
			url : 'item_insert_chk',
			contentType: 'application/json; charset=utf-8',
			data : JSON.stringify(data),
			success : function(data){
				if(data == "1"){
					$('#item_insert_form').submit();
				}else{
					alert('중복된 품목코드가 존재합니다.');
				}
			},
			error : function(err){
				alert("에러");
			}
		});
	});
});
</script>
<style>
table{
	margin-left: 20px;
}


</style>

<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>품목 관리
		</h3>

		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h4 class="mb" align="left">
						<i class="fa fa-angle-right"></i>품목 등록
					</h4>
					<br>
					<form action="/item/insert" method="post"
						class="form-horizontal style-form" id="item_insert_form">
						<!---->
						<input type="hidden" id="userBn" name="userBn"
							value="${bn}">

						<!-- line 1 -->
						<table>
							<tr>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label" style="width: 90px;">품목구분*</label>
										<div class="col-sm-6" style="width: 115px;">
											<select class="form-control" id="itemDiv" name="itemDiv">
												<option selected="selected" value="1">판매</option>
												<option value="2">구매</option>
											</select>
										</div>
									</div>
								</td>
								
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label" style="margin-left: 125px; width: 95px;">품목코드*</label>
										<div class="col-sm-6" style="width: 250px;">
											<input type="text" class="form-control" id="itemCode" name="itemCode" />
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
										<label class="col-sm-2 col-sm-2 control-label" style="width: 90px;">품목명*</label>
										<div class="col-sm-6" style="width: 220px;">
											<input type="text" class="form-control" id="itemName"
												name="itemName" placeholder="품목명을 입력하시오" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label" style="margin-left: 21px; width: 95px;">수량/재고</label>
										<div class="col-sm-6" style="width: 250px;">
											<input type="text" class="form-control" id="itemQuantity"
												name="itemQuantity" value="" />
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
										<label class="col-sm-2 col-sm-2 control-label" style="width: 90px;">원가<br>(구매가)</label>
										<div class="col-sm-6" style="width: 220px;">
											<input type="text" class="form-control" id="itemPrice1"
												name="itemPrice1" value="" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label" style="width: 95px; margin-left: 22px;">판매가</label>
										<div class="col-sm-6" style="width: 250px;">
											<input type="text" class="form-control" id="itemPrice2"
												name="itemPrice2" value="" />
										</div>
									</div>
								</td>
							</tr>
						</table>

						<div class="form-group" align="center">
							<button type="button" class="btn btn-success" id="insert_btn">등록</button>
							<button type="button" class="btn btn-theme" onclick="location.href='items_list'">목록으로</button>
						</div>
					</form>
				</div>
			</div>
			<!-- col-lg-12-->
		</div>
		
		<!-- /row -->
		<%@ include file="../include/footer.jsp"%>