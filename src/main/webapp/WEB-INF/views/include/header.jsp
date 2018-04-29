<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>마네지네코</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="/resources/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="/resources/assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="/resources/assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="/resources/assets/css/style.css" rel="stylesheet">
    <link href="/resources/assets/css/style-responsive.css" rel="stylesheet">
	<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="/resources/assets/js/chart-master/Chart.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
	
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  
  
  <script>

	/*
	버튼에 Drop-List Filter 적용.
	
	*/
	//첫번째 필터적용 
	//drop list 필터 추가부분 
	/* When the user clicks on the button,
	toggle between hiding and showing the dropdown content */
	function myFunction() {
		document.getElementById("myDropdown").classList.toggle("show");
	}

	function filterFunction() {
		var input, filter, ul, li, a, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		div = document.getElementById("myDropdown");
		
		a = div.getElementsByTagName("a");
		for (i = 0; i < a.length; i++) {
			if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
				a[i].style.display = "";
			} else {
				a[i].style.display = "none";
			}
		}
		
	}
	
	//두번째 필터적용 
	//drop list 필터 추가부분 
	/* When the user clicks on the button,
	toggle between hiding and showing the dropdown content */
	function myFunction1() {
		document.getElementById("myDropdown1").classList.toggle("show");
	}

	function filterFunction() {
		var input, filter, ul, li, a, i;
		input = document.getElementById("myInput1");
		filter = input.value.toUpperCase();
		div = document.getElementById("myDropdown1");
		a = div.getElementsByTagName("a1");
		for (i = 0; i < a.length; i++) {
			if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
				a[i].style.display = "";
			} else {
				a[i].style.display = "none";
			}
		}
	}

	
	//검색어 입력 필터
	$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	
	
</script>

<style type="text/css">
/*Dropdown list 버튼 스타일*/
/* Dropdown Button */
.dropbtn {
	background-color: white;
	padding: 16px;
	border: none;
	cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
	background-color: lightblue;
}

/* The search field */
#myInput {
	border-box: box-sizing;
	background-position: 14px 12px;
	background-repeat: no-repeat;
	font-size: 16px;
	padding: 14px 20px 12px 45px;
	border: none;
	border-bottom: 1px solid #ddd;
}

/* The search field when it gets focus/clicked on */
#myInput:focus {
	outline: 3px solid #ddd;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f6f6f6;
	min-width: 100px;
	border: 1px solid #ddd;
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: #f1f1f1
}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {
	display: block;
}

#logout_btn{
	position: absolute;
	left: 95%;
}

</style>
  
  </head>
  <body>  
     
     <section id="container" >
     <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="/home" class="logo"><b>${cname }</b></a>
            <!--logo end-->
            <a href="/logout" class="logo" id="logout_btn"><img src="../resources/images/logout.png" style="height: 30px;"></a>
        </header>
      <!--header end-->

	   <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="/home"><img src="/resources/images/마네지네코.png" class="img-circle" width="100"></a></p>
              	  <h5 class="centered">${cname }</h5>
              	  
              	  <!-- 거래처 관리 -->
               <li class="sub-menu"><a href="/account/accountBoard"> <i
                     class="fa fa-desktop"></i> <span>거래처 관리</span>
               </a></li>
               <!-- /거래처 관리 -->

                  <li class="sub-menu">
                      <a href="/item/items_list" >
                          <i class="fa fa-desktop"></i>
                          <span>품목 관리</span>
                      </a>
                  </li>

                <!-- 거래 관리 -->
               <li class="sub-menu"><a href="/trade/tradeBoardPage"> <i
                     class="fa fa-cogs"></i> <span>거래 관리</span>
               </a></li>
               <!-- /거래 관리 -->
               
                  <li class="sub-menu">
                      <a href="/staff/stafflist" >
                          <i class="fa fa-book"></i>
                          <span>직원 관리</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="/calendar" >
                          <i class="fa fa-tasks"></i>
                          <span>현장 관리</span>
                      </a>
                  </li>
                  
                  <li class="sub-menu">
                  	<a href="">
                  		<i class="fa fa-book"></i>
                  		<span>사업자 관리</span>
                  	</a>
                  	<ul class="sub">
	            		<li><a href="/update">개인정보수정</a></li>
	                    <li><a href="/logout">로그아웃</a></li>
                  	</ul>
                  </li>
                  
                  <li class="sub-menu">
                      <a href="/qrcode" >
                          <i class="fa fa-tasks"></i>
                          <span>QR code 생성기</span>
                      </a>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->