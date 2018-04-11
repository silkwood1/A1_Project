<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

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
					<h4 class="mb" align="center">
						<i class="fa fa-angle-right"></i>직원  정보 페이지 (Staff Information Page)
					</h4>
					<form action="/Staff/update" method="post"
						class="form-horizontal style-form" enctype="multipart/form-data">
						<!---->
						<input type="hidden" id="staffno" name="staffno"
							value="${staff.staffno}">

						<!-- line 1 -->
						<table>
							<tr>
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label">거래구분</label>
										<div class="col-sm-6" style="width: 309px;">
											<select class="form-control" id="field" name="field">
												<option selected="selected">판매</option>
												<option>구매</option>
												<option>판매취소</option>
												<option>구매취소</option>
											</select>
										</div>
									</div>
								</td>
								
								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label">거래처</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="CN" name="CN" />
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
										<label class="col-sm-2 col-sm-2 control-label">품목</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="RegDate"
												name="RegDate" value="###" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label">거래량</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="BsnNum"
												name="BsnNum" value="###" />
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
										<label class="col-sm-2 col-sm-2 control-label">미지급금</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="CName"
												name="CName" value="###" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label">미수금</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="RepreName"
												name="RepreName" value="###" />
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
										<label class="col-sm-2 col-sm-2 control-label">총액</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="BsnNum"
												name="BsnNum" value="###" readonly />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label">결제수단</label>
										<div class="col-sm-6" style="width: 309px;">
											<select class="form-control" id="field" name="field">
												<option selected="selected">카드</option>
												<option>현금</option>
												<option>계좌이체</option>
												<option>수표</option>
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
										<label class="col-sm-2 col-sm-2 control-label">담당직원(Staff)</label>
										<div class="col-sm-6" style="width: 309px;">
											<input type="text" class="form-control" id="Staff"
												name="Staff" value="###" />
										</div>
									</div>
								</td>

								<td>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label">회원등급(Membership)</label>
										<div class="col-sm-6" style="width: 309px;">
											<select class="form-control" id="field" name="field">
												<option selected="selected">해당없음</option>
												<option>브론즈</option>
												<option>실버</option>
												<option>골드</option>
												<option>플레티넘</option>
											</select>
										</div>
									</div>
								</td>
							</tr>
						</table>

						<!-- line 6 -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">비고(Remark)
							</label>
							<div class="col-sm-6" style="width: 309px;">
								<textarea class="form-control" id="Remark" name="Remark"
									style="width: 668px; height: 85px;">${Board.title}</textarea>
							</div>
							<br><br>
						</div>

						<!-- line 7 -->
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">파일첨부</label>
							<div class="col-sm-6" style="width: 309px;"></div>
							<input type="file" class="form-control" name="upload"
								style="width: 666px;">
						</div>

						<!-- line 8 -->
						<div class="form-group" align="center">
							<button type="submit" class="btn btn-theme">수정</button>
							<button type="button" class="btn btn-theme" onclick="location.href='TradeBoard'">목록으로</button>
						</div>
					</form>
				</div>
			</div>
			<!-- col-lg-12-->
		</div>
		
		<!-- /row -->
		<%@ include file="../include/footer.jsp"%>