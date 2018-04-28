<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="include/header.jsp"%>

<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-md-12">
				<div class="box1">
			<div class="row mt">
				<!--CUSTOM CHART START -->
				<div class="border-head">
					<h3>${name }님의 월별 판매량</h3>
				</div>
				<div class="custom-bar-chart">
				<%int month = 0; %>
				<c:forEach var="u" items="${uriage } ">
					<%month++; %>
					<div class="bar">
						<div class="title"><%= month %>월</div>
						<div class="value tooltips" data-original-title="${u }건"
							data-toggle="tooltip" data-placement="top">${u }</div>
					</div>
				</c:forEach>
					</div></div>
				</div>
				<!--custom chart end-->
			</div>
			<!-- /row -->

		</div>
		<!-- /col-lg-9 END SECTION MIDDLE -->
	</section>
</section>







<%@include file="include/footer.jsp"%>