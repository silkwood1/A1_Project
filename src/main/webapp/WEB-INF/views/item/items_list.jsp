<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>

<!-- <script type="text/javascript" src="js/jquery.battatech.excelexport.js"></script> -->

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#btnExport")
								.click(
										function(e) {
											window
													.open('data:application/vnd.ms-excel,'
															+ encodeURIComponent($(
																	'#exceldown')
																	.html()));
											e.preventDefault();
										});
					});

	function add_item() {
		alert('아이템 추가 버튼');
	}
</script>

<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>품목 관리
		</h3>

		<!-- BASIC FORM ELELEMNTS -->

		<div class="row mt">
			<div class="col-md-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i>품목 리스트

					</h4>


					<!--테이블 검색어 입력 박스 -->
					<br>
					<input class="form-control" id="myInput" type="text"
						placeholder="Search.." style="width: 701px;"></br>

					<section id="unseen">
						<div id="exceldown">

							<table class="table table-bordered table-striped table-condensed">
								<thead>
									<tr>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th>
										<th><a id="btnExport" href="#" download="">Export</a></th>
										<th><input type="button" class="btn btn-info"
											onclick="add_item()" value="품목 추가"></th>
									</tr>
									<tr>
										<c:if test="${sessionScope.Member.id == 'admin'}">
											<th></th>
										</c:if>
										<th>
											<div class="dropdown">
												<button onclick="myFunction()" class="dropbtn">품목
													분류</button>
												<div id="myDropdown" class="dropdown-content">
													<!--이 부분은 DB에서 값을 가져와서 Drop list에서 선택값을 출력해준다. -->
													<a href="/item/item_list?div=1">구매</a> <a
														href="/item/item_list?div=2">판매</a> <a
														href="/item/item_list">전체</a>
												</div>
											</div>
										</th>
										<th>품목 코드</th>
										<th>품목명</th>
										<th>원가</th>
										<th>판매가</th>
										<th>보유 수량</th>
										<th>등록일</th>
										<th></th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody id="item_table">

									<c:forEach var="item" items="${items}">
										<tr>
											<td>${item.itemDiv}</td>
											<td>${item.itemCode}</td>
											<td>${item.itemName}</td>
											<td>${item.itemPrice1}</td>
											<td>${item.itemPrice2}</td>
											<td>${item.itemQuantity}</td>
											<td>${item.itemIndate}</td>
											<td></td>

											<td><a class="btn btn-info"
												href="/item/item_info?customerBsn=" ${customer.customerBsn}>상세보기</a>
											</td>

											<td><a class="btn btn-danger  btn-sm"
												href="/item/item_delete">삭제</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</section>
				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>
		<!-- /row -->
		<%@include file="../include/footer.jsp"%>