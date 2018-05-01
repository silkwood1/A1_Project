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
.insertstaff{
	text-align: right;
	margin-right: 10px;

}
.pre-scrollable2 {
  max-height: 460px;
  overflow-y: scroll;
}

#style-6::-webkit-scrollbar-track
{
   -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
   background-color: #F5F5F5;
}

#style-6::-webkit-scrollbar
{
   width: 10px;
   background-color: #F5F5F5;
}

#style-6::-webkit-scrollbar-thumb
{
   background-color: #ffd777;   
   background-image: -webkit-linear-gradient(45deg,
                                             rgba(255, 255, 255, .2) 25%,
                                   transparent 25%,
                                   transparent 50%,
                                   rgba(255, 255, 255, .2) 50%,
                                   rgba(255, 255, 255, .2) 75%,
                                   transparent 75%,
                                   transparent)
}
</style>


<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>직원 관리
		</h3>

		<!-- BASIC FORM ELELEMNTS -->

		<div class="row mt">
			<div class="col-md-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i>직원 리스트
					</h4>
					<section id="unseen">
						<div class="insertstaff">
							<input type="button" class="btn btn-success"
								onclick="location.href='EditStaff'" value="직원 등록">
						</div>
						<div id="style-6" class="pre-scrollable2">
						<c:forEach var="s" items="${slist }">
						<div class="card">
						<!--이미지가 없을 경우 기본이미지  -->
							<c:if test="${s.originalfile != null }">
							<img  class="img-circle" src="./memberimg?strurl=${s.savedfile }" alt="Card image"
								>
							
							</c:if>
							<c:if test="${s.originalfile == null }">
							<img class="img-circle"  src="../resources/images/m_img.jpg" alt="기본이미지">
							</c:if>
							<div class="card-body">
								<h4 class="card-title">${s.staffName }</h4>
								<h5 class="card-title">
									<c:if test="${s.positionDiv == 1}">사원</c:if>
									<c:if test="${s.positionDiv == 2}">매니저</c:if>
									<c:if test="${s.positionDiv == 3}">사장</c:if>
								</h5>
								<p class="card-text">${s.staffCellNo }</p>
								<a href="updateStaff?staffNo=${s.staffNo }" class="btn btn-info">상세보기</a>
							</div>
						</div>
						
						
						</c:forEach>
						</div>
					</section>

				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>
		<!-- /row -->






		<%@include file="../include/footer.jsp"%>