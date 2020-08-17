<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>dashboard</title>
<link rel="stylesheet" href="/css/dashboard.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
					<h3 style = "font-size: 20px; font-weight: 400; height: 400px">Personal Info</h3>
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
			  <div role="tabpanel" class="tab-pane active" id="home" hidden>
				  <div class = "boardContent">
				  		<h4 style = "font-weight: 700;">알고리즘 파이팅</h4>
					  	<img src="/images/back.jpg" width="110px" height = "120px">
					  	<div class = "contentInfo">
						  인원수: 25명<br>
						  진도율: 80%<br>
						  관리자 여부: 멤버<br>
						  <button class = "button">상세보기</button>
					 	 </div>
				  </div>
				  <div class = "boardContent">
				  		<h4 style = "font-weight: 700;">testtest</h4>
					  	<img src="/images/back.jpg" width="110px" height = "120px">
					  	<div class = "contentInfo">
						  인원수: 25명<br>
						  진도율: 80%<br>
						  관리자 여부: 관리자<br>
						  <button class = "button">상세보기</button>
					 	 </div>
				  </div>
				  <div class = "boardContent">
				  		<h4 style = "font-weight: 700;">rara</h4>
					  	<img src="/images/back.jpg" width="110px" height = "120px">
					  	<div class = "contentInfo">
						  인원수: 25명<br>
						  진도율: 80%<br>
						  관리자 여부: 멤버<br>
						  <button class = "button">상세보기</button>
					 	 </div>
				  </div>
			  </div>
			  <div role="tabpanel" class="tab-pane" id="messages">
			  	<div class = "boardContent">
				  		<h4 style = "font-weight: 700;">알고리즘 파이팅</h4>
					  	<img src="/images/back.jpg" width="110px" height = "120px">
					  	<div class = "contentInfo">
						 	하루에 알고리즘 5문제씩 같이 푸려고 만든 모임입니다!!<br>
							같이 성실하게 알고리즘 문제를 같이 풀면서 나눌 생각 있으신 분 누구나 환영해요~<br>
						  <button class = "button">ENTER</button>
					 	 </div>
				  </div>
				  <div class = "boardContent">
				  		<h4 style = "font-weight: 700;">여행 계획</h4>
					  	<img src="/images/back.jpg" width="110px" height = "120px">
					  	<div class = "contentInfo">
						  놀러가자!!! 놀러가자!!! 놀러가자!!<br>
						  <button class = "button">ENTER</button>
					 	 </div>
				  </div>
				  <div class = "boardContent">
				  		<h4 style = "font-weight: 700;">알고리즘 파이팅</h4>
					  	<img src="/images/back.jpg" width="110px" height = "120px">
					  	<div class = "contentInfo">
						  인원수: 25명<br>
						  진도율: 80%<br>
						  관리자 여부: 멤버<br>
						  <button class = "button">상세보기</button>
					 	 </div>
				  </div>
			  </div>
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