<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>帳戶 - Pacuemo</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_03_member/css/member.css">
</head>
<body>
<jsp:include page="/fragment/top.jsp" />
<jsp:include page="/_03_member/fragment/sidebar.jsp" />
<div class="container container-content">
	<div class="row">
		<div class="col-sm-12">
			<div class="content">
				<div class="page-header">
    				<h1>帳戶概覽</h1>
  				</div>
				<div class="row">
   					<div class="col-sm-12 col-md-4">
	   					<div class="well card profile" id="">
		   					<h3 class="text-primary1">個人檔案</h3>
		   					<form role="form">
		   						<div class="form-group">
		   					 		<label class="control-label">Email</label>
		   					 		<p class="form-control-static">${LoginOK.memberMail}</p>
		   					 	</div>
		   					 	<div class="form-group">
		   					 		<label class="control-label">出生日期</label>
		   							<p class="form-control-static">${LoginOK.memberBirthday}</p>
		   					 	</div>
		   						<div class="form-group">
		   					 		<label class="control-label">行動電話</label>
		   					 		<p class="form-control-static">${LoginOK.memberPhone}</p>
		   					 	</div>
		   					 </form>
							 <a href="" class="btn btn-secondary btn-sm btn-block center-block" id="btn-edit-profile">編輯個人檔案</a>
	   				    </div>			
					 </div>
					 <div class="col-sm-12 col-md-4">
					 	<div class="well card profile" id="">
							<h3 class="text-primary1">帳戶餘額</h3>
							<div class="form-group">
		   					 	<label class="control-label">點數餘額</label>
		   					 	<p class="form-control-static">${LoginOK.memberPoint}點</p>
		   					</div>
							<a href="" class="btn btn-secondary btn-sm btn-block center-block" id="btn-store">儲值</a>
						</div>
						<div class="well card profile" id="">
							<h3 class="text-primary1">臉書帳號連結狀態</h3>
							<c:choose>
								<c:when test="${not empty LoginOK.memberFBId }">
								<h5 style="color:#1ed760">連結中</h5>
								</c:when>
								<c:otherwise>
								<h5 style="color:#eb1e32">尚未連結</h5>
								<button class="btn btn-secondary btn-sm btn-block center-block" id="btn-fb-connect">連結臉書帳號</button>
								</c:otherwise>
							</c:choose>
							</div>
					 </div>
					 <div class="col-sm-12 col-md-4">
					 	<div class="well card friendlist" id="">
							<h3 class="text-primary1">好友</h3>
							<c:choose>
							<c:when test="${fn:length(friends.ids) > 0}">
							<c:forEach var="i" begin="0" end="5">
								<c:choose>
							        <c:when test="${not empty friends.fbIds[i]}">
							        <div class="form-group">
							        <button class="form-control-static1 test"><img class="user-img img-circle navbar-user-img2" src="https://graph.facebook.com/${friends.fbIds[i]}/picture?width=64&amp;height=64" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:when test="${not empty friends.imgs[i]}">
							        <div class="form-group">
							        <button class="form-control-static1 test"><img class="user-img img-circle navbar-user-img2" src="${pageContext.request.contextPath}/image/member/${friends.imgs[i]}" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:when test="${i >= fn:length(friends.ids)}">
							        </c:when>
							        <c:otherwise>
							        <div class="form-group">
							        <button class="form-control-static1 test"><div class="user-icon-container img-circle navbar-user-img2"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use></svg></div><font>${friends.names[i]}</font></button>
							        </div>
							        </c:otherwise>							    
      							</c:choose>
							</c:forEach>
								<c:if test="${fn:length(friends.ids) > 5 }">
								<div class="form-group">
								<button class="btn btn-secondary btn-sm btn-block center-block" id="btn-friendslist">進入好友列表</button>
								</div>
								</c:if>
							</c:when>
							<c:otherwise>
								<div class="form-group">
								<div class="form-control-static test"><h5>您還尚未擁有好友喔!!!</h5></div>
								</div>
							</c:otherwise>
							</c:choose>
						</div>	
					 </div>
   				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
		</div>
	</div>
</div>
</body>	
<c:choose>
	<c:when test="${empty LoginOK.memberFBId }">
	<script>
	  $(function(){
		  window.fbAsyncInit = function() {
			  FB.init({
			    appId      : '268809393472621',
			    cookie     : true,  // enable cookies to allow the server to access 
			                        // the session
			    xfbml      : true,  // parse social plugins on this page
			    version    : 'v2.2' // use version 2.2
			  });
			  
			  };
			  

			  // Load the SDK asynchronously
			  (function(d, s, id) {
			    var js, fjs = d.getElementsByTagName(s)[0];
			    if (d.getElementById(id)) return;
			    js = d.createElement(s); js.id = id;
			    js.src = "//connect.facebook.net/en_US/sdk.js";
			    fjs.parentNode.insertBefore(js, fjs);
			  }(document, 'script', 'facebook-jssdk'));

			  // Here we run a very simple test of the Graph API after login is
			  // successful.  See statusChangeCallback() for when this call is made.
			  function testAPI() {
				  FB.api(
						  '/me',
						  'GET',
						  {"fields":"id,first_name,last_name,email"},
						  function(response) {
							  $.ajax({
									"type":"post",
									"url": "connect.do",
									"dataType": "json",
									"data":{"facebookId":response.id,"mode":"fb_connect"},
									"success":function(data){
										if(data.status == "true"){
											location.reload();
										}else{
											alert("error");
										}	
									}
								});
						  }
						);
			    };
			    
			    function fbLogin() {  
			        FB.login(function(response) {
			        	if (response.status === 'connected') {
			        	      // Logged into your app and Facebook.
			        	      testAPI();
			        	    } else if (response.status === 'not_authorized') {
			        	      // The person is logged into Facebook, but not your app.
			        	      document.getElementById('status').innerHTML = 'Please log ' +
			        	        'into this app.';
			        	    } else {
			        	      // The person is not logged into Facebook, so we're not sure if
			        	      // they are logged into this app or not.
			        	      document.getElementById('status').innerHTML = 'Please log ' +
			        	        'into Facebook.';
			        	    }
			       }, {scope: 'public_profile,email'}); //設定需要授權的項目
			    }
			    
				$("#btn-fb-connect").bind("click",function(){
					fbLogin();
				})
		  
	  });
	</script>
	</c:when>
</c:choose>
</html>