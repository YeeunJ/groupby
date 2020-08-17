<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>dashboard</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	body{
	    background-color: antiquewhite;
	}
	#main{
		padding: 60px 40px;
	}
	#appInfo{
	    display: inline-block;
	    width: 25%;
	}
	#title{
	    font-weight: bold;
	    font-size: 30px;
	}
	#userInfo{
	    padding: 10px;
	    background-color: rgba(255,255,255,0.3);
	}
	#profile{
		background-color: white;
	}
	#personalInfo{
		background-color: white;
	}
	#boardInfo{
		display: inline-block;
	    width: 60%;
	    float: right;
	}
	.tab-pane{
		display: grid !important;
	    grid-template-columns: repeat(2, 1fr);
	    grid-gap: 10px;
	    padding: 30px;
	}
	.tab-content{
	    background-color: white;
	    border-bottom: 0.5px solid lightgray;
	    border-left: 0.5px solid lightgray;
	    border-right: 0.5px solid lightgray;
    }
    .boardContent {
        box-shadow: 2px 2px 5px 0.5px rgba(0, 0,0,0.4);
    	display: inline-block;
    }
	
</style>
</head>
<body>
	<div id = "main">
		<div id = "appInfo">
			<div id = "title">투 게 더</div>
			<div id = "userInfo">
			<div id = "profile">
			프로필!!
			</div>
			<div id = "personalInfo">
			<h3 style = "font-size: 20px; font-weight: 400;">Personal Info</h3>
			<div id = "content">
				text
			</div>
			</div>
			</div>
		</div>
		<div id = "boardInfo">
			<ul class="nav nav-tabs" role="tablist" id="myTab">
			  <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">내 모임</a></li>
			  <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">전체 모임</a></li>
			</ul>
			
			<div class="tab-content">
			  <div role="tabpanel" class="tab-pane active" id="home">
				  <div class = "boardContent">
					  <img src="/images/back.jpg" width="110px" height = "100px">
					  <div class = "contentInfo">
					  </div>
				  </div>
				  <div class = "boardContent">
					  <img src="/images/back.jpg" width="110px" height = "100px">
					  <div class = "contentInfo">
					  </div>
				  </div>
			  </div>
			  <div role="tabpanel" class="tab-pane" id="messages">messages</div>
			</div>
		</div>
	</div>
	<script>
	$(function () {
	    $('#myTab a:last').tab('show')
	  })
	</script>
</body>
</html>