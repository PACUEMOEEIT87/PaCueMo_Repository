﻿<div class="container-fluid"> 
 <nav class="navbar1 navbar-inverse easy-sidebar">
  <div class="container-fluid"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
    <ul class="nav1 ul1">
    <li><button type="button" class="navbar-toggle easy-sidebar-toggle" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button></li>
    </ul>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/spring/league/getLeagueInfos">本季聯賽 <span class="sr-only">(current)</span></a></li>
      <li><a href="#">Link</a></li>
<!--       <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a> -->
<!--         <ul class="dropdown-menu" role="menu"> -->
<!--           <li><a href="#">Action</a></li> -->
<!--           <li><a href="#">Another action</a></li> -->
<!--           <li><a href="#">Something else here</a></li> -->
<!--           <li class="divider"></li> -->
<!--           <li><a href="#">Separated link</a></li> -->
<!--           <li class="divider"></li> -->
<!--           <li><a href="#">One more separated link</a></li> -->
<!--         </ul> -->
<!--       </li> -->
    </ul>

    <!-- 搜尋 開始 -->
    <form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/spring/club/searchName" method="get">
      <div class="form-group">
        <input id="searchName" type="text" name="name" class="form-control" placeholder="Search"/>
      </div>
      <button id="searchBtn" type="submit" class="btn btn-default">查詢社團</button>
    </form>
    <!-- 搜尋 結束 -->
    
<!--     <ul class="nav navbar-nav navbar-left"> -->
<!--       <li><a href="#">Link</a></li> -->
<!--       <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a> -->
<!--         <ul class="dropdown-menu" role="menu"> -->
<!--           <li><a href="#">Action</a></li> -->
<!--           <li><a href="#">Another action</a></li> -->
<!--           <li><a href="#">Something else here</a></li> -->
<!--           <li class="divider"></li> -->
<!--           <li><a href="#">Separated link</a></li> -->
<!--         </ul> -->
<!--       </li> -->
<!--     </ul> -->
  </div>
  <!-- /.container-fluid --> 
</nav>
</div>
<script>
	$(function(){
		/* -----------【阻止 submit 按鈕跳轉】------------------- */
// 		$("#searchBtn").click(function(event){
// 			event.preventDefault();
// 		})
		
		$('#test,.navbar-toggle.easy-sidebar-toggle').click(function(e) {
		    e.preventDefault();
		    $('body').toggleClass('toggled');
		    $('.navbar1.easy-sidebar').removeClass('toggled');
		});
		$('html').on('swiperight', function(){
		    $('body').addClass('toggled');
		});
		
		$('html').on('swipeleft', function(){
		    $('body').removeClass('toggled');
		});
	})
</script>