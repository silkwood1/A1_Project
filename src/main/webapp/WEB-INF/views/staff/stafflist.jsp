<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>

<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>StaffBoard
		</h3>

		<!-- BASIC FORM ELELEMNTS -->

		<div class="row mt">
			<div class="col-md-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i>직원 관리(Staff Management)
					</h4>
					<section id="unseen">
						<form action="###" method="post">
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
											onclick="location.href='InsertStaff'" value="글쓰기2"></th>
										<th><input type="button" class="btn btn-info"
											onclick="location.href='EditStaff'" value="글쓰기"></th>
									</tr>

									<tr>
										<%-- <c:if test="${sessionScope.Member.id == 'admin'}"> --%>
										<th></th>
										<%-- </c:if> --%>
										<th>사원번호(StaffNo)</th>
										<th>부서구분(Staff deptDiv)</th>
										<th>직급(Staff PostionDiv)</th>
										<th>이름(Staff Name)</th>
										<th>주민번호(Staff Idno)</th>
										<th>휴대전화번호(Staff CellNo)</th>
										<th>집전화번호(Staff TellNo)</th>
										<th>이메일주소(Staff Email)</th>
										<th>우편번호(Staff Zipcode)</th>
										<th>상세주소(Staff Address)</th>
										<th>급여(Staff Salary)</th>
										<th>은행구분(Staff BankDiv)</th>
										<th>계좌번호(Staff AccountNo)</th>
										<th>입사일(Staff Indate)</th>
										<th>비고(Staff Note)</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="staff" items="${s}">
										<tr>
											<%-- <c:if test="${sessionScope.Member.id == 'admin'}"> --%>
											<td><input type="checkbox" name="listCheck"
												value="${staff.staffNo}"></td>
											<%-- </c:if> --%>

											<%--  <td><a href="/staff/read?boardnum=${b.boardnum}">${b.title}</a></td> --%>
											<td>${staff.staffNo}</td>
											<td>${staff.deptDiv}</td>
											<td>${staff.positionDiv}</td>
											<td>${staff.staffName}</td>
											<td>${staff.staffIdno}</td>
											<td>${staff.staffCellNo }</td>
											<td>${staff.staffTellNo}</td>
											<td>${staff.staffEmail }</td>
											<td>${staff.staffZipcode}</td>
											<td>${staff.staffAddress}</td>
											<td>${staff.staffSalary }</td>
											<td>${staff.bankDiv }</td>
											<td>${staff.staffAcountNo}</td>
											<td>${staff.staffIndate }</td>
											<td>${staff.staffNote }</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
							<!--  
                          <c:if test="${sessionScope.Member.id == 'admin'}">
                          	<div class="form-group" align="center">
                             	 <button type="submit" class="btn btn-danger">Delete</button>
                          	</div>
                          </c:if>
                          -->
						</form>
					</section>

				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>
		<!-- /row -->






		<%@include file="../include/footer.jsp"%>