<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>

<style>
.card{
	width: 33.3%;
	float: left;
	overflow: hidden;

}
.card img{
	margin: 7%;
	width: 33.3%;
	float: left;
	
}
.card-body{
	text-align: left;
	margin: 7%;
	width: 33.3%;
	float: left;
	margin-top: 10%;
}
</style>


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
						<div align="right">
							<input type="button" class="btn btn-info"
								onclick="location.href='EditStaff'" value="Staff등록">
						</div>

						<c:forEach var="s" items="${slist }">
						<div class="card">
						<!--이미지가 없을 경우 기본이미지  -->
							<c:if test="${s.originalfile != null }">
							<img class="cardimg" class="card-img-top" src="./memberimg?strurl=${s.savedfile }" alt="Card image"
								>
							</c:if>
							<c:if test="${s.originalfile == null }">
							<img class="cardimg" class="card-img-top" src="../resources/images/m_img.jpg" alt="기본이미지">
							</c:if>
							<div class="card-body">
								<h4 class="card-title">${s.staffName }</h4>
								<h4 class="card-title">
								<c:if test="${s.positionDiv == 1}">사원</c:if>
								<c:if test="${s.positionDiv == 2}">매니저</c:if>
								<c:if test="${s.positionDiv == 3}">사장</c:if>
								</h4>
								<p class="card-text">No:${s.staffNo }<br> 
								Tel:${s.staffCellNo }
								</p>
								<a href="updateStaff?staffNo=${s.staffNo }" class="btn btn-info">See Profile</a>
							</div>
						</div>
						
						
						</c:forEach>
						
					</section>

				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>
		<!-- /row -->






		<%@include file="../include/footer.jsp"%>