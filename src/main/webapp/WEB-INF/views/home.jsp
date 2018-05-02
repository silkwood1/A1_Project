<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="include/header.jsp"%>
<!-- 네이버 지도 -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=NeOragwFwZrlC04RCdGu&submodules=geocoder"></script>
<style>
.mappp{
	width: 52%;
    height: 568px;
    float: right;
	
}
#colll{
	width: 170%;
}
.row mt{
	float: left;
    display: inline;
    margin-left: 60px;
}
.box1{
	float: left;
	display: inline;
	width: 585px;
	border-bottom: 0;
}


.row{
	display: inherit;
}
#barr {
   height: 100%;
    position: relative;
    width: 19px;
    margin: 1px 14px;
    float: left;
    text-align: center;
    z-index: 10;
}
#titleee{
    position: absolute;
    bottom: -43px;
    width: 100%;
    text-align: center;
    font-size: 13px;
}
</style>

<section id="main-content">
	<section class="wrapper">
	 <br>
   <input type="hidden" value="${size }" id="hid_size">
   <div style="display: none;">
      <c:forEach var="al" items="${addrList }" varStatus="status" >
         <table>
            <tr>
               <td id="addr${status.index }">${al.customerAddress }</td>
               <td id="cnam${status.index }">${al.customerCname }</td>
            </tr>
         </table>
      </c:forEach>
   </div>

   <div id="map" class="mappp">
      <script type="text/javascript">
         // 맵 옵션
         var mapOptions = {
            zoom : 10, // 50m, 11: 100m, 10: 200m
            mapTypeControl : true
         };

         // 맵 생성
         var map = new naver.maps.Map('map', mapOptions);

         // 주소값
         var myaddress = "<%= session.getAttribute("addr")%>";

         naver.maps.Service.geocode({
            address : myaddress
         }, function(status, response) {
            if (status !== naver.maps.Service.Status.OK) {
               return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
            }
            var result = response.result;

            var myaddr = new naver.maps.Point(result.items[0].point.x,
                  result.items[0].point.y);
            
            // 검색된 좌표로 지도 이동
            map.setCenter(myaddr);

         });
         
         // 2
         var size = $('#hid_size').val();
         var myaddress;
         var cnam;
         for (var i = 0; i < size; i++) {
            myaddress = document.getElementById('addr' + i).innerHTML;
            cnam = document.getElementById('cnam' + i).innerHTML;
            naver.maps.Service.geocode({
               address : myaddress
            }, function(status, response) {
               if (status !== naver.maps.Service.Status.OK) {
                  return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
               }
               var result = response.result;

               var myaddr = new naver.maps.Point(result.items[0].point.x,
                     result.items[0].point.y);
               
               // 마커 표시
               var marker = new naver.maps.Marker({
                  position : myaddr,
                  map : map
               });

 /*               // 마커 클릭 이벤트 처리
               naver.maps.Event.addListener(marker, "click", function(e) {
                  
                  if (infowindow.getMap()) {
                     infowindow.close();
                  } else {
                     infowindow.open(map, marker);
                  }
               });

               // 마크 클릭시 인포윈도우 오픈
               var infowindow = new naver.maps.InfoWindow({
                  // 인포윈도우에 주소 표시
                  content : myaddress
               });
               
               */
            }); 
         } 
         
      </script>
   </div>
		<div class="row">
			<div class="col-md-12" id="colll">
				<div class="box1" id="boxx">
			<div class="row mt">
				<!--CUSTOM CHART START -->
				<div class="border-head">
					<h3>${name }님의 2018년 월별 판매량</h3>
				</div>
				<div class="custom-bar-chart">
				<%int month = 0; %>
				<c:forEach var="u" items="${uriage } ">
					<%month++; %>
					<div class="bar" id="barr">
						<div class="title" id="titleee"><%= month %>월</div>
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