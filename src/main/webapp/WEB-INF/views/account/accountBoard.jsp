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
						<i class="fa fa-angle-right"></i>거래처 관리(Account Management)
								
					</h4>
					
					
					<!--테이블 검색어 입력 박스 -->
					<br><input class="form-control" id="myInput" type="text" placeholder="Search.." style="width: 701px; "></br> 
					
					<!--  
					<table id="myTable">
						<tr class="header">
							<th style="width: 60%;">Name</th>
							<th style="width: 40%;">Country</th>
						</tr>
						<tr>
							<td>Alfreds Futterkiste</td>
							<td>Germany</td>
						</tr>
						<tr>
							<td>Berglunds snabbkop</td>
							<td>Sweden</td>
						</tr>
						<tr>
							<td>Island Trading</td>
							<td>UK</td>
						</tr>
						<tr>
							<td>Koniglich Essen</td>
							<td>Germany</td>
						</tr>
					</table>
					-->
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
									<th></th>
									<th><input type="button" class="btn btn-info"
										onclick="writeBoard()" value="Column..."></th>
									<th></th>
									
									<th><th><a id="btnExport" href="#" download="">Export</a></th>
									<th><input type="button" class="btn btn-info"
										onclick="writeBoard()" value="글쓰기"></th>
								</tr>

								<tr>
									<c:if test="${sessionScope.Member.id == 'admin'}">
										<th></th>
									</c:if>
									<!--<th>고객분류(Customer division)</th>-->
									<th>
										<div class="dropdown">
											<button onclick="myFunction()" class="dropbtn">고객분류(Customer
												division)</button>
											<div id="myDropdown" class="dropdown-content">
												<!--이 부분은 DB에서 값을 가져와서 Drop list에서 선택값을 출력해준다. -->
											
													<a href="/Account/AccountBoard?div=1">판매처</a>
													<a href="/Account/AccountBoard?div=2">매입처</a>
													<a href="/Account/AccountBoard">전체리스트</a>
											
											</div>
										</div>
									</th>

									<th>거래처 번호(Customer number)</th>
									
									<th>>사업자 번호(Business number)</th>
									<!--<th>상호명(Company name)</th>-->
									<th>
										<div class="dropdown">
											<button onclick="myFunction1()" class="dropbtn">상호명(Company name)</button>
											<div id="myDropdown1" class="dropdown-content">
												<!--이 부분은 DB에서 값을 가져와서 Drop list에서 선택값을 출력해준다. -->
												<input type="text" placeholder="Search.." id="myInput1" onkeyup="filterFunction()"> 
													<c:forEach var="e" items="${c}">
														
														<a href="/Account/AccountBoard?name=${e.customerComName}">${e.customerComName}</a>
													
													</c:forEach>
											</div>
										</div>
									</th>


									<th>대표자명(Representative name)</th>
									<th>휴대폰 번호(Cellular number)</th>
									<th>사무실 번호(Office number)</th>
									<th>팩스 번호(Fax number)</th>
									<th>이메일(Email address)</th>
									
									
									<th>담당직원(Staff)</th>
									<th>회원등급(Membership)</th>
									<th>비고(Remark)</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="myTable">
							
								<c:forEach var="customer" items="${c}">
									<tr>
										<td>${customer.customerDiv}</td>
										<td>${customer.customerNo}</td>
										
										<td>${customer.customerBsn}</td>
										<td>${customer.customerComName}</td>
										<td>${customer.customerName}</td>
										<td>${customer.customerCellNo}</td>
										<td>${customer.customerOfficeNo}</td>
										<td>${customer.customerFaxNo}</td>
										<td>${customer.customerEmail}</td>
										
										
										<td>${customer.customerHandler}</td>
										<td>${customer.customerNote}</td>
										<td></td>
										
										<td><a class="btn btn-info" href="/Account/AccountModify?customerBsn="${customer.customerBsn}>상세보기</a>
										</td>
										
										<td><a class="btn btn-danger  btn-sm"  href="/Account/AccountDelete">삭제</a>
										</td>
									</tr>
								
								</c:forEach>
								<!--  
                              <c:forEach var="b" items="${b}">
                              	<tr>
                              		<c:if test="${sessionScope.Member.id == 'admin'}">
                              	 		<td><input type="checkbox" name="listCheck" value="${b.id}"></td>
                                  	</c:if>
                              		 
                                	 	 <td>${b.boardnum}</td>
                                	 	 <td>${b.field}</td>
                                	 	 <td>${b.id}</td>
                                	 	 <td><a href="/Board/read?boardnum=${b.boardnum}">${b.title}</a></td>
                                	 	 <td>${b.inputdate}</td>
                                	 	 <td>${b.hits}</td>
                                 </tr>
                              </c:forEach>
                              -->
							</tbody>
						</table>
						<!--  
                          <c:if test="${sessionScope.Member.id == 'admin'}">
                          	<div class="form-group" align="center">
                             	 <button type="submit" class="btn btn-danger">Delete</button>
                          	</div>
                          </c:if>
                          -->
						</div>
					</section>

				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>
		<!-- /row -->
<%@include file="../include/footer.jsp"%>