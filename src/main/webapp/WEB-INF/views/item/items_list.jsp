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
	function item_delete(num){
		var itemNum = num;
		if(confirm('정말 삭제하시겠습니까?') == true){
			$.ajax({
				type : 'POST',
				url : 'delete',
				data : {'num': itemNum},
				success : function(data){
					alert('정상적으로 삭제되었습니다.');
					location.reload();
				},
				error : function(err){
					alert("에러");
				}
			});
		}else{
			return;
		}
	}
	
	function goSearch(){
		var search_text = $("#myInput").val();
		if(search_text == null || search_text == ""){
			location.href="items_list"	
		}else{
			location.href="items_list?val=" + search_text;	
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
							placeholder="검색어(코드, 품목명) 입력 후 엔터." style="width: 701px;" onkeypress="if(event.keyCode==13) {goSearch();}">
					<section id="unseen">
						<div id="exceldown">
							<table class="table table-bordered table-striped table-condensed">
								<thead>
									<tr>
										<th>
											<div class="dropdown">
												<button onclick="myFunction()" class="dropbtn">품목
													분류</button>
												<div id="myDropdown" class="dropdown-content">
													<!--이 부분은 DB에서 값을 가져와서 Drop list에서 선택값을 출력해준다. -->
													<a href="/item/items_list?div=2">구매</a> <a
														href="/item/items_list?div=1">판매</a> <a
														href="/item/items_list">전체</a>
												</div>
											</div>
										</th>
										<th><div class="dropbtn">품목 코드</div></th>
										<th><div class="dropbtn">품목명</div></th>
										<th><div class="dropbtn">원가</div></th>
										<th><div class="dropbtn">판매가</div></th>
										<th><div class="dropbtn">보유 수량</div></th>
										<th><div class="dropbtn">등록일</div></th>
										<th><a id="btnExport" href="#" download="">Export</a></th>
										<th><input type="button" class="btn btn-info"
											onclick="location.href='items_insert'" value="품목 추가"></th>
									</tr>
								</thead>
								<tbody id="item_table">

									<c:forEach var="item" items="${items}">
										<tr>
										<c:choose>
											<c:when test="${item.itemDiv == 1 }">
												<td>판매</td>
											</c:when>
											<c:otherwise>
												<td>구매</td>
											</c:otherwise>
										</c:choose>
											<td>${item.itemCode}</td>
											<td>${item.itemName}</td>
											<td>${item.itemPrice1}</td>
											<td>${item.itemPrice2}</td>
											<td>${item.itemQuantity}</td>
											<td>${item.itemIndate}</td>

											<td><a class="btn btn-info"
												href="/item/items_info?num=${item.itemNum }">상세보기</a>
											</td>

											<td><a class="btn btn-danger  btn-sm"
												href="javascript:item_delete(${item.itemNum });">삭제</a></td>
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