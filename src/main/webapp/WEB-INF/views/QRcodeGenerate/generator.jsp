<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.io.File, java.util.UUID" %>
<%@ page import="java.awt.image.BufferedImage, javax.imageio.ImageIO" %>
<%@ page import="com.google.zxing.qrcode.QRCodeWriter"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>

<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-md-12">
				<div class="box1">
					<span class="li_heart"></span>
					<h3>QR CODE GENERATOR</h3>
				</div>
			</div>
		</div>

		<h3>
			<i class="fa fa-angle-right"></i> QR Code Generator</h3>

		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h4 class="mb">
						<i class="fa fa-angle-right"></i> Customer Information
					</h4>
					<form class="form-horizontal style-form" method="get">
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">거래처분류(Customer division)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">거래처 번호(Customer number)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"> 
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">사업자번호(BSN)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">상호명(Company name)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">대표자(Representative)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">회원등급(Partnership level)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control">
							</div>
						</div>
						
						
							
							<div>
								<button type="submit" class="btn btn-theme">Generate</button>
							</div>
					</form>
				</div>
			</div>
			<!-- col-lg-12-->
		</div>
		<!-- /row -->

		<!-- /row -->
	</section>
</section>

<%@include file="../include/footer.jsp"%>