<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>

<style>
.centerbtn{
	text-align: center;
}
.rightmove{
	text-align: right;
	margin-right: 10px;
}
#centere{
	text-align: center;
}

</style>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>

<!-- <script type="text/javascript" src="js/jquery.battatech.excelexport.js"></script> -->

<script type="text/javascript">
$(document).ready(function(){
	  $("#btnExport").click(function (e) {
	     window.open('data:application/vnd.ms-excel,' +encodeURIComponent($('#exceldown').html()));
	    e.preventDefault();
	  });

	  
//	  $('#sort_rankDiv').click(function() {
//		  
//		  $.ajax({
//			  
//		  });
//	  });
	  
});
</script>


<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>거래처 관리
		</h3>

		<!-- BASIC FORM ELELEMNTS -->

		<div class="row mt">
			<div class="col-md-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i>거래처 목록		
					</h4>
					
					<br>
					<div class="rightmove">
					<button class="btn btn-warning" id="btnExport" download="">Export</button>
					<input type="button" class="btn btn-success "
							onclick="location.href='/account/goInsertAccount'" value="새 거래처">
					</div>
					
					<br>
					<section id="unseen">
						<div id="exceldown">
						<table class="table table-bordered table-striped table-condensed" id="centere">
							<thead>
		
								<tr>
									<c:if test="${sessionScope.Member.id == 'admin'}">
										<th></th>
									</c:if>
									<th id="centere">번호</th>
									<th id="centere">고객분류</th>
									<th id="centere">등록날짜</th>
									<th id="centere">사업자 번호</th>
									<th id="centere">상호명</th>
									<th id="centere">대표자명</th>
									<th id="centere">휴대폰 번호</th>
									<th id="centere">사무실 번호</th>
									<th id="centere">주소</th>
									<th id="centere">담당직원</th>
									<th id="sort_rankDiv" style="text-align: center;">회원등급</th>
									<th id="centere">수정</th>
									<th id="centere">삭제</th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach var="c" items="${c}" varStatus="status">
									<tr>
										<td>${c.customerNo}</td>
										<td>${c.customerDiv}</td>
										<td>${c.customerIndate}</td>
										<td>${c.customerBn}</td>
										<td>${c.customerCname}</td>
										<td>${c.customerName}</td>
										<td>${c.customerCellNo}</td>
										<td>${c.customerFaxNo}</td>
										<td>${c.customerAddress}</td>
										<td>${c.inCharge}</td>
										<td>${c.rankDiv }</td>
										<td class="centerbtn"><a class="btn btn-primary btn-xs" id="updatebtn" href="/account/accountModify?customerNo=${c.customerNo}"><i class="fa fa-pencil"></i></a>
										</td>
										
										<td class="centerbtn"><a class="btn btn-danger  btn-xs" id="deletebtn" href="/account/accountDelete?customerNo=${c.customerNo}"><i class="fa fa-trash-o "></i></a>
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