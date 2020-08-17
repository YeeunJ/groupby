<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>dashboard</title>
<link rel="stylesheet" href="/css/dashboard.css">
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div id = "main">
		<div id = "appInfo">
			<div id = "title">�� �� ��</div>
			<div id = "userInfo">
				<div id = "profile">
				������!!
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
			  <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">�� ����</a></li>
			  <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">��ü ����</a></li>
			</ul>
			
			<div class="tab-content">
			  <div role="tabpanel" class="tab-pane active" id="home" hidden>
				  <div class = "boardContent">
				  		<h4 style = "font-weight: 700;">�˰��� ������</h4>
					  	<img src="/images/back.jpg" width="110px" height = "120px">
					  	<div class = "contentInfo">
						  �ο���: 25��<br>
						  ������: 80%<br>
						  ������ ����: ���<br>
						  <button class = "button">�󼼺���</button>
					 	 </div>
				  </div>
				  <div class = "boardContent">
				  		<h4 style = "font-weight: 700;">testtest</h4>
					  	<img src="/images/back.jpg" width="110px" height = "120px">
					  	<div class = "contentInfo">
						  �ο���: 25��<br>
						  ������: 80%<br>
						  ������ ����: ������<br>
						  <button class = "button">�󼼺���</button>
					 	 </div>
				  </div>
				  <div class = "boardContent">
				  		<h4 style = "font-weight: 700;">rara</h4>
					  	<img src="/images/back.jpg" width="110px" height = "120px">
					  	<div class = "contentInfo">
						  �ο���: 25��<br>
						  ������: 80%<br>
						  ������ ����: ���<br>
						  <button class = "button">�󼼺���</button>
					 	 </div>
				  </div>
			  </div>
			  <div role="tabpanel" class="tab-pane" id="messages">
			  	<div class = "boardContent">
				  		<h4 style = "font-weight: 700;">�˰��� ������</h4>
					  	<img src="/images/back.jpg" width="110px" height = "120px">
					  	<div class = "contentInfo">
						 	�Ϸ翡 �˰��� 5������ ���� Ǫ���� ���� �����Դϴ�!!<br>
							���� �����ϰ� �˰��� ������ ���� Ǯ�鼭 ���� ���� ������ �� ������ ȯ���ؿ�~<br>
						  <button class = "button">ENTER</button>
					 	 </div>
				  </div>
				  <div class = "boardContent">
				  		<h4 style = "font-weight: 700;">���� ��ȹ</h4>
					  	<img src="/images/back.jpg" width="110px" height = "120px">
					  	<div class = "contentInfo">
						  �����!!! �����!!! �����!!<br>
						  <button class = "button">ENTER</button>
					 	 </div>
				  </div>
				  <div class = "boardContent">
				  		<h4 style = "font-weight: 700;">�˰��� ������</h4>
					  	<img src="/images/back.jpg" width="110px" height = "120px">
					  	<div class = "contentInfo">
						  �ο���: 25��<br>
						  ������: 80%<br>
						  ������ ����: ���<br>
						  <button class = "button">�󼼺���</button>
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