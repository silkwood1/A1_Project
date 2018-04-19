<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>

<!-- <script type="text/javascript" src="js/jquery.battatech.excelexport.js"></script> -->

<script type="text/javascript">
$(document).ready(function(){
	  $("#btnExport").click(function (e) {
	     window.open('data:application/vnd.ms-excel,' +encodeURIComponent($('#exceldown').html()));
	    e.preventDefault();
	  });
	  });
</script>

<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> Account Management Board
		</h3>

		<!-- BASIC FORM ELELEMNTS -->

		<div class="row mt">
			<div class="col-md-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i>거래처 관리
		
					</h4>
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
									<th></th>
									<th></th>
									<th></th>
									<th><th><a id="btnExport" href="#" download="">Export</a></th>
									<th><input type="button" class="btn btn-info"
										onclick="location.href='/account/goInsertAccount'" value="새 거래처"></th>
								</tr>

								<tr>
									<c:if test="${sessionScope.Member.id == 'admin'}">
										<th></th>
									</c:if>
									<!--<th>고객분류(Customer division)</th>-->
									
									<!-- <th>
										<div class="dropdown">
											<button onclick="myFunction()" class="dropbtn">고객분류</button>
											<div id="myDropdown" class="dropdown-content">
												이 부분은 DB에서 값을 가져와서 Drop list에서 선택값을 출력해준다.
											
													<a href="/Account/AccountBoard?div=1">판매처</a>
													<a href="/Account/AccountBoard?div=2">매입처</a>
													<a href="/Account/AccountBoard">전체리스트</a>
											
											</div>
										</div>
									</th> -->
									<th>고객분류</th>
									<th>번호</th>
									<th>등록날짜</th>
									<th>사업자 번호</th>
									<th>상호명</th>
									<%-- <th>
										<div class="dropdown">
											<button onclick="myFunction1()" class="dropbtn">상호명</button>
											<div id="myDropdown1" class="dropdown-content">
												<!--이 부분은 DB에서 값을 가져와서 Drop list에서 선택값을 출력해준다. -->
												<input type="text" placeholder="Search.." id="myInput1" onkeyup="filterFunction()"> 
													<c:forEach var="c" items="${c}">
														
														<a href="/Account/AccountBoard?name=${e.customerComName}">${e.customerComName}</a>
													
													</c:forEach>
											</div>
										</div>
									</th> --%>
									<th>대표자명</th>
									<th>휴대폰 번호</th>
									<th>사무실 번호</th>
									<th>주소</th>
									<th>담당직원</th>
									<th>회원등급</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach var="c" items="${c}">
									<tr>
										<td>${c.customerDiv}</td>
										<td>${c.customerNo}</td>
										<td>${c.customerIndate}</td>
										<td>${c.customerBn}</td>
										<td>${c.customerCname}</td>
										<td>${c.customerName}</td>
										<td>${c.customerCellNo}</td>
										<td>${c.customerFaxNo}</td>
										<td>${c.customerAddress}</td>
										<td>${c.inCharge}</td>
										<td>${c.rankDiv }</td>
										<td><a class="btn btn-info btn-sm" href="/account/accountModify?customerNo=${c.customerNo}">수정</a>
										</td>
										
										<td><a class="btn btn-danger btn-sm"  href="/account/accountDelete?customerNo=${c.customerNo}">삭제</a>
										</td>
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