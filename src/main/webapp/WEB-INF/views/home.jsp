<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="include/header.jsp"%>

<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-md-12">
				<div class="box1">
					<span class="li_heart"></span>
					<h3>이름: ${name } 아이디: ${id } 사업자번호: ${bn }</h3>
				</div>
			</div>
		</div>
	</section>
</section>


<section id="main-content">
	<section class="wrapper">
		<div class="row">


			<div class="row mt">
				<!-- SERVER STATUS PANELS -->
				<div class="col-md-4 col-sm-4 mb">
					<div class="white-panel pn donut-chart">
						<div class="white-header">
							<h5>이달의 목표 판매량</h5>	
							<h5>TARGET SALES VOLUME FOR THIS MONTH</h5>
						</div>
						<div class="row">
							<div class="col-sm-6 col-xs-6 goleft">
								<p>
									<i class="fa fa-database"></i> 70%
								</p>
							</div>
						</div>
						<canvas id="serverstatus01" height="120" width="120"></canvas>
						<script>
							var doughnutData = [ {
								value : 70,
								color : "#68dff0"
							}, {
								value : 30,
								color : "#fdfdfd"
							} ];
							var myDoughnut = new Chart(document.getElementById(
									"serverstatus01").getContext("2d"))
									.Doughnut(doughnutData);
						</script>
					</div>
					<! --/grey-panel -->
				</div>
				<!-- /col-md-4-->


				<div class="col-md-4 col-sm-4 mb">
					<div class="white-panel pn">
						<div class="white-header">
							<h5>판매량 1위 지점</h5>
							<h5>1st branch in sales</h5>
						</div>
						<div class="row">
							<div class="col-sm-6 col-xs-6 goleft">
								<p>
									<i class="fa fa-heart"></i> 122
								</p>
							</div>
							<div class="col-sm-6 col-xs-6"></div>
						</div>
						<div class="centered">
							<img src="resources/assets/img/product.png" width="120">
						</div>
					</div>
				</div>
				<!-- /col-md-4 -->

				<div class="col-md-4 mb">
					<!-- WHITE PANEL - TOP USER -->
					<div class="white-panel pn">
						<div class="white-header">
							<h5>이달의 우수 사원</h5>
							<h5>An excellent staff in the month</h5>
						</div>
						<p>
							<img src="resources/assets/img/ui-zac.jpg" class="img-circle" width="80">
						</p>
						<p>
							<b>Zac Snider</b>
						</p>
						<div class="row">
							<div class="col-md-6">
								<p class="small mt">MEMBER SINCE</p>
								<p>2012</p>
							</div>
							<div class="col-md-6">
								<p class="small mt">TOTAL SALES</p>
								<p>$ 47,60</p><!-- DB  -->
							</div>
						</div>
					</div>
				</div>
				<!-- /col-md-4 -->


			</div>
			<!-- /row -->


			
			<!-- /row -->

			<div class="row mt">
				<!--CUSTOM CHART START -->
				<div class="border-head">
					<h3>판매 변화추이</h3>
					<h3>SALES TREND</h3>
				</div>
				<div class="custom-bar-chart">
					<ul class="y-axis">
						<li><span>10.000</span></li>
						<li><span>8.000</span></li>
						<li><span>6.000</span></li>
						<li><span>4.000</span></li>
						<li><span>2.000</span></li>
						<li><span>0</span></li>
					</ul>
					<div class="bar">
						<div class="title">JAN</div>
						<div class="value tooltips" data-original-title="8.500"
							data-toggle="tooltip" data-placement="top">85%</div>
					</div>
					<div class="bar ">
						<div class="title">FEB</div>
						<div class="value tooltips" data-original-title="5.000"
							data-toggle="tooltip" data-placement="top">50%</div>
					</div>
					<div class="bar ">
						<div class="title">MAR</div>
						<div class="value tooltips" data-original-title="6.000"
							data-toggle="tooltip" data-placement="top">60%</div>
					</div>
					<div class="bar ">
						<div class="title">APR</div>
						<div class="value tooltips" data-original-title="4.500"
							data-toggle="tooltip" data-placement="top">45%</div>
					</div>
					<div class="bar">
						<div class="title">MAY</div>
						<div class="value tooltips" data-original-title="3.200"
							data-toggle="tooltip" data-placement="top">32%</div>
					</div>
					<div class="bar ">
						<div class="title">JUN</div>
						<div class="value tooltips" data-original-title="6.200"
							data-toggle="tooltip" data-placement="top">62%</div>
					</div>
					<div class="bar">
						<div class="title">JUL</div>
						<div class="value tooltips" data-original-title="7.500"
							data-toggle="tooltip" data-placement="top">75%</div>
					</div>
					
					
				</div>
				<!--custom chart end-->
			</div>
			<!-- /row -->

		</div>
		<!-- /col-lg-9 END SECTION MIDDLE -->
	</section>
</section>







<%@include file="include/footer.jsp"%>