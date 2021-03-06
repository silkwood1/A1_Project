<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>

<style>
.centertd{
	text-align: center;
}
.button_right{
	text-align: right;
	margin-right: 10px; 
	float: left;

}
#myInput{
	float: left;
}
.div_right{
	text-align: right;
	margin-left: 10px;
	margin-right: 10px;

}
#thth{
	padding-bottom: 18px;
	text-align: center;
}
#thth2{
	
	text-align: center;
}
#tablee{
	text-align: center;
}
.pre-scrollable2 {
  max-height: 420px;
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
<script type="text/javascript">
	$(document).ready(
		function() {
			$("#btnExport").click(
				function(e) {
					window.open('data:application/vnd.ms-excel,'
						+ encodeURIComponent($('#exceldown').html()));
						e.preventDefault();
			});
	});
	
	function item_delete(num){
		var itemNum = num;
		if(confirm('정말 삭제하시겠습니까?') == true){
			$.ajax({
				type : 'POST',
				url : 'delete',
				data : {'num': itemNum},
				success : function(data){
					alert('정상적으로 삭제되었습니다.');
					location.reload();
				},
				error : function(err){
					alert("에러");
				}
			});
		}else{
			return;
		}
	}
	
	function goSearch(){
		var search_text = $("#myInput").val();
		if(search_text == null || search_text == ""){
			location.href="items_list"	
		}else{
			location.href="items_list?val=" + search_text;	
		}
	}
</script>

<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>품목 관리
		</h3>

		<!-- BASIC FORM ELELEMNTS -->

		<div class="row mt">
			<div class="col-md-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i>품목 리스트
					</h4>
					<!--테이블 검색어 입력 박스 -->
					<br>
					<div class="div_right">
						<input class="form-control" id="myInput" type="text"
							placeholder="검색어(코드, 품목명) 입력 후 엔터." style="width: 400px;" onkeypress="if(event.keyCode==13) {goSearch();}">
					
						<button class="btn btn-warning " id="btnExport" download="">Export</button>
						<button class="btn btn-success" onclick="location.href='items_insert'">품목추가</button>
					
					</div>
					<section id="unseen">
						
						<br>
						<div id="exceldown">
						<div id="style-6" class="pre-scrollable2">
							<table class="table table-bordered table-striped table-condensed" id="tablee">
								<thead>
								
									<tr>
										<th id="thth2">
											<div class="dropdown">
												<button onclick="myFunction()" class="dropbtn" >품목
													분류</button>
												<div id="myDropdown" class="dropdown-content">
													<!--이 부분은 DB에서 값을 가져와서 Drop list에서 선택값을 출력해준다. -->
													<a href="/item/items_list?div=2">구매</a> <a
														href="/item/items_list?div=1">판매</a> <a
														href="/item/items_list">전체</a>
												</div>
											</div>
										</th>
										<th id="thth">품목 코드</th>
										<th id="thth">품목명</th>
										<th id="thth">원가</th>
										<th id="thth">판매가</th>
										<th id="thth">보유 수량</th>
										<th id="thth">등록일</th>
										<th id="thth">수정</th>
										<th id="thth">삭제</th>
									</tr>
								</thead>
								<tbody id="item_table">

									<c:forEach var="item" items="${items}">
										<tr>
										<c:choose>
											<c:when test="${item.itemDiv == 1 }">
												<td>판매</td>
											</c:when>
											<c:otherwise>
												<td>구매</td>
											</c:otherwise>
										</c:choose>
											<td>${item.itemCode}</td>
											<td>${item.itemName}</td>
											<td>${item.itemPrice1}</td>
											<td>${item.itemPrice2}</td>
											<td>${item.itemQuantity}</td>
											<td>${item.itemIndate}</td>

											<td class="centertd"><a class="btn btn-primary btn-xs"
												href="/item/items_info?num=${item.itemNum }"><i class="fa fa-pencil"></i></a>
											</td>

											<td class="centertd"><a class="btn btn-danger  btn-xs"
												href="javascript:item_delete(${item.itemNum });"><i class="fa fa-trash-o "></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
						</div>
					</section>
				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>
		<!-- /row -->
		<%@include file="../include/footer.jsp"%>