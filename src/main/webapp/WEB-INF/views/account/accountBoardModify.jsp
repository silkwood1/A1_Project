<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i>거래처 정보 페이지</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb" align="center"><i class="fa fa-angle-right"></i> 거래처 정보 페이지 (Account Information Page)</h4>
                      <form action="/Board/update" method="post" class="form-horizontal style-form" enctype="multipart/form-data"><!---->
                          <input type="hidden" id="boardnum" name="boardnum" value="${Board.boardnum}">
                          
                          
                          <table>
                          	<tr>
                          		<td>
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">고객분류(Customer division)</label>
                              <div class="col-sm-6" style="width: 309px;">
                                 <select class="form-control" id="field" name="field">
                                  	
                                  	  	<option selected="selected">판매처</option>
                                  		<option>매입처</option>
                                  	  
                                  </select>
                              </div>
                          </div>		
                          		
                          		</td>
                          		<td>
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">거래처 번호(Customer number)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="CN" name="CN" value="${Board.title}"/>
                              </div>
                          </div>
                          		
                          		
                          		</td>
                          	</tr>
                          
                          </table>
                   
                          <table>
                          	<tr>
                          		<td>
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">등록날짜(Registration Number)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="RegDate" name="RegDate" value="###"/>
                              </div>
                          </div>
                          		</td>
                          		
                          		<td>
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">사업자 번호(Business number)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="BsnNum" name="BsnNum" value="###" readonly/>
                              </div>
                          </div>
                          		</td>
                          	</tr>
                          
                          </table>
                
                          
                          
                          <table>
                          	<tr>
                          		<td>
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">상호명(Company name)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="CName" name="CName" value="###"/>
                              </div>
                          </div>
                          		
                          		</td>
                          		
                          		<td>
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">대표자명(Representative name)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="RepreName" name="RepreName" value="###"/>
                              </div>
                          </div>
                          		
                          		</td>
                          	</tr>
                          
                          </table>
                          
                          
                          <table>
                          	<tr>
                          		<td>
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">휴대폰 번호(Cellular number)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="CellNum" name="CellNum" value="###"/>
                              </div>
                          </div>
                          		
                          		</td>
                          		
                          		<td>
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">사무실 번호(Office number)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="OfficeNum" name="OfficeNum" value="###"/>
                              </div>
                          </div>
                          		
                          		</td>
                          	</tr>
                          
                          </table>
                          
                          
                          <table>
                          	<tr>
                          		<td>
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">팩스 번호(Fax number)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="FaxNum" name="FaxNum" value="###"/>
                              </div>
                          </div>
                          		
                          		</td>
                          		
                          		<td>
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">이메일(Email address)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="EmailAddr" name="EmailAddr" value="###"/>
                              </div>
                          </div>
                          		
                          		</td>
                          	</tr>
                          
                          </table>
                          
                          <table>
                          	<tr>
                          		<td>
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">우편번호(Postal code)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="PostCode" name="PostCode" value="###"/>
                              </div>
                          </div>
                          		
                          		</td>
                          		
                          		<td>
                          			 <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">주소(Address)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="Addr" name="Addr" value="###"/>
                              </div>
                          </div>
                          		
                          		</td>
                          	</tr>
                          
                          </table>
                          
                          
                          </table>
                          
                          <table>
                          	<tr>
                          		<td>
                          			 <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">담당직원(Staff)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="Staff" name="Staff" value="###"/>
                              </div>
                          </div>
                          		
                          		</td>
                          		
                          		<td>
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">회원등급(Membership)</label>
                               <div class="col-sm-6" style="width: 309px; ">
                                   <input type="text" class="form-control" id="Membership" name="Membership" value="###"/>
                              </div>
                          </div>
                          		
                          		</td>
                          	</tr>
                          
                          </table>
                          
                          
                          
                          			<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">비고(Remark)	</label>
                              <div class="col-sm-6" style="width: 309px;">
                              	 <textarea class="form-control" id="Remark" name="Remark" style="width: 668px; height: 85px; ">${Board.title}</textarea>
                              </div>
                          </div>
                          		
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">파일첨부</label>
                              <div class="col-sm-6" style="width: 309px; ">
                                  
                              </div>    <input type="file" class="form-control" name="upload" style="width: 666px; ">
                          </div>
                          
                          		
                          		
                          
                          		
                          		
                          	
                          
                       
                          			<div class="form-group" align="center">
                              <button type="submit" class="btn btn-theme">거래처 정보수정</button>
                              <button type="button" class="btn btn-theme" onclick="retlist()">거래처 목록으로</button>
                          </div>
                          		
                          		
                         
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
<%@ include file="../include/footer.jsp" %>