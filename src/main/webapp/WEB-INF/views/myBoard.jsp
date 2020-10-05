<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<title>TOGETHER</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
		<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
		html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}

		/* checklist */
		#GroupEdit {
			display:none;
		}
		#GroupEdit input {
			border: none;
			background: rgb(250, 250, 250);
		}
		#ManagePeople{
			display: none;
		}
		#EditCheckList {
			display: none;
		}

		.check {
			position: relative;
			background: rgb(250, 250, 250);
			margin: 15px 0px;
			padding: 12px;
			box-shadow: 3px 3px 5px rgba(0,0,0,0.3);
			font-size: 16px;
			line-height: 30px;
		}
		.check button {
			padding: 3px 8px;
			border-radius: 15px;
			border: none;
		}
		.check_detail {
			width: 100%;
			display: none;
			padding: 15px 10px;
		}
		.check_detail p {
			border-top: 1px solid #bdbdbd;
			padding-top: 15px;
			margin: 0;
		}
		.detailbtn {
			cursor:pointer; font-size: 20px;
			margin: 0 21px 0 10px;
		}
		.showfinish {
			cursor: pointer; font-size: 20px;
			color: #3a4b53 ;
		}
		.check_finish {
			/* transition: all ease 2s 0s; */
			display:none;
			position: absolute;
			top: 41px; right: 55px;
			width: 200px;
			padding: 10px;
			z-index: 1;
			background: rgb(250, 250, 250);
			border: 1px solid #3a4b53 ;
		}
		.check_finish p {
			margin: 0;
		}
		/* edit_checklist */
		.checkEditlist {
			position: relative;
			background: rgb(250, 250, 250);
			margin: 15px 0px;
			padding: 12px;
			box-shadow: 3px 3px 5px rgba(0,0,0,0.3);
			font-size: 16px;
			line-height: 30px;
		}
		.checkEditlist button {
			padding: 3px 8px;
			border-radius: 15px;
			border: none;
		}
		.btn {
			cursor: pointer;
			font-size: 13px;
	    padding: 3px 10px;
	    border-radius: 8px;
			color: white;
		}
		.check_detail_edit {
			width: 100%;
			margin-top: 15px;
			border-top: 1px solid #bdbdbd;
			display: block;
			padding-top: 15px;
		}
		.check_detail_edit p {
			margin: 0;
		}
		#EditCheckList input, textarea {
			border: none;
			/* background:  rgb(250, 250, 250); */
		}

		/* group_info */
		.title {
				font-size: 30px;
				font-weight: bold;
				color: #3a4b53;
			}
		.open {
			background: rgb(26, 188, 156);
			padding: 1px 10px;
			border-radius: 30px;
			font-size: 13px;
			color: white;
		}
		.bold {
				font-weight: bold;
				display: inline-block;
				margin-bottom: 4px;
		}
		.group_text {
			display: block;
			font-style: italic;
		    width: 80%;
		    text-align: center;
		    margin: 30px auto;
		}
		.edit {
			border: none;
			float: right;
		}
		.arrow {
			float:right;
			font-size:20px;
			cursor: pointer;
			position: absolute;
		    top: -8px;
		    right: 0;
		}
		#progressbar {
		  background-color: rgb(250, 250, 250);
		  border: 1px solid rgba(0,0,0,0.2);
		  border-radius: 11px;
		}
		#progressbar>div {
		  background-color: #3a4b53;
		  /* Adjust with JavaScript */
		  height: 17px;
		  border-radius: 10px;
		}
		.prog_text {
			margin: 0;
			line-height: 15px;
		    font-size: 12px;
		    text-align: center;
		    color: rgb(250,250,250);
		}
		#progressbar_tot {
		  margin-top: 5px;
		  background-color: rgb(250, 250, 250);
		  border: 1px solid rgba(0,0,0,0.2);
		  border-radius: 11px;
		  width:80%;
		}
		#progressbar_tot>div {
		  background-color: #3a4b53;
			  border-radius: 10px;
		}
		.prog_text_tot {
			margin: 0;
			line-height: 13px;
		    font-size: 10px;
		    text-align: center;
		    color: rgb(250,250,250);
		}

		/* All Group */
		.people {
			overflow: hidden;
			background: rgb(250, 250, 250);
			margin: 15px 0px;
			padding: 12px;
			box-shadow: 3px 3px 5px rgba(0,0,0,0.3);
		}
		.thumb {
			margin-top: 5px; color: #3a4b53; font-size: 35px; float: left; line-height:44px
		}
		.eachcontent {
			float:left;
			padding-left: 20px;
			width: 92%;
			height: 44px;
		}


		</style>
		<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>

	</head>
	<script type="text/JavaScript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- seunga script -->
	<script type="text/javascript">
		$(document).ready(function(){
			/*
			수정 버튼을 누르면
			1. 원래의 문제 이름과 문제 내용을 변수에 저장한다.
			2. 이전에 있던 내용들을 지우고 변수에 담긴 내용을 default값으로 한 input을 담은 내용으로 대체한다.
			*/

			// textarea enter
			// var str = $(".textarea").val();
			// str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
			// $(".textarea").html(str);
			$('#editbtn').click(function(){
				$('#EditCheckList').show();
				$('#CHECKLIST').hide();
			});
			// ajax 새로고침
			$('#editfin').click(function(){
				$('#EditCheckList').hide();
				$('#CHECKLIST').show();
			});


			$('#GroupInfobtn').click(function(){
				$('#GroupEdit').show();
				$('#GroupInfo').hide();
			});
			// ajax 새로고침
			$('#GroupInfoOk').click(function(){
				$('#GroupEdit').hide();
				$('#GroupInfo').show();
			});

			var num = $('.check_edit');
			console.log(num.length);

			$('.member_setting').click(function(){
				$('#AllGroup').hide();
				$('#ManagePeople').show();
			});
			// ajax 처리
			$('.managefin').click(function(){
				$('#ManagePeople').hide();
				$('#AllGroup').show();
			});


			var edit = $('.check_edit').click(function(){
				var idx = edit.index(this);
				var editlist = $('.checkEditlist').eq(idx);
				// console.log(editlist);
				var prob_name = editlist.children('.p_name').text();
				var prob_cont = editlist.children('.p_cont').text();

				// $('.checkform > #input').val(prob_name);
				// $('.checkform > #cont').text(prob_cont);
				//
				// $('.checkEditlist').eq(idx).after($('.checkform'));
				// $('.checkEditlist').eq(idx).hide();

				// $(this).hide();
			});
			// 미션 디테일 보기
			var $btn = $('.detailbtn').click(function(){
				var idx = $btn.index(this);
				$('.check_detail').eq(idx).slideToggle();
			});

			var $finishover = $('.showfinish').mouseover(function(){
				var fin_idx = $finishover.index(this);
				$('.check_finish').eq(fin_idx).show();
			});
			var $finishleave = $('.showfinish').mouseleave(function(){
				var fin_idx = $finishleave.index(this);
				$('.check_finish').eq(fin_idx).hide();
			});
		});
	</script>

<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Logo</a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News"><i class="fa fa-globe"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-user"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-envelope"></i></a>
  <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-padding-large" title="Notifications"><i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">3</span></button>
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="#" class="w3-bar-item w3-button">One new friend request</a>
      <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
      <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
    </div>
  </div>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account">
    <!-- <img src="/w3images/avatar2.png" class="w3-circle" style="height:23px;width:23px" alt="Avatar"> -->
  </a>
 </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">My Profile</h4>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> Designer, UI</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> London, UK</p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> April 1, 1988</p>
        </div>
      </div>
      <br>

      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
          <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Groups</button>
          <div id="Demo1" class="w3-hide w3-container">
            <p>Some text..</p>
          </div>
          <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
          <div id="Demo3" class="w3-hide w3-container">
         <div class="w3-row-padding">
         <br>
           <div class="w3-half">
             <!-- <img src="/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom"> -->
           </div>
           <div class="w3-half">
             <!-- <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom"> -->
           </div>
           <div class="w3-half">
             <!-- <img src="/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom"> -->
           </div>
           <div class="w3-half">
             <!-- <img src="/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom"> -->
           </div>
           <div class="w3-half">
             <!-- <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom"> -->
           </div>
           <div class="w3-half">
             <!-- <img src="/w3images/snow.jpg" style="width:100%" class="w3-margin-bottom"> -->
           </div>
         </div>
          </div>
        </div>
      </div>
      <br>

      <!-- Interests -->
      <div class="w3-card w3-round w3-white w3-hide-small">
        <div class="w3-container">
          <p>Interests</p>
          <p>
            <span class="w3-tag w3-small w3-theme-d5">News</span>
            <span class="w3-tag w3-small w3-theme-d4">W3Schools</span>
            <span class="w3-tag w3-small w3-theme-d3">Labels</span>
            <span class="w3-tag w3-small w3-theme-d2">Games</span>
            <span class="w3-tag w3-small w3-theme-d1">Friends</span>
            <span class="w3-tag w3-small w3-theme">Games</span>
            <span class="w3-tag w3-small w3-theme-l1">Friends</span>
            <span class="w3-tag w3-small w3-theme-l2">Food</span>
            <span class="w3-tag w3-small w3-theme-l3">Design</span>
            <span class="w3-tag w3-small w3-theme-l4">Art</span>
            <span class="w3-tag w3-small w3-theme-l5">Photos</span>
          </p>
        </div>
      </div>
      <br>

      <!-- Alert Box -->
      <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          <i class="fa fa-remove"></i>
        </span>
        <p><strong>Hey!</strong></p>
        <p>People are looking at your profile. Find out who.</p>
      </div>

    <!-- End Left Column -->
    </div>

    <!-- Middle Column -->
    <div class="w3-col m7">
		<!-- Group Info -->
      <div id="GroupInfo" class="w3-row-padding">
	        <div class="w3-col m12">
	          <div class="w3-card w3-round w3-white">
	            <div class="w3-container w3-padding">
					<div style="margin: 15px 0;">
						<span class="title">알고리즘 화이팅</span>
					</div>
					<hr>
					<div style="position: relative; margin-bottom: 15px;">
						<span class="arrow"><i class="fa fa-angle-double-right"></i></span>
						<span class="bold">나의 진행률</span><br>
						<div id="progressbar">
						  <div style="width: 40%;"><p class="prog_text" >40%</p></div>
						</div>
					</div>
					<div style="position: relative; margin-bottom: 15px;">
						<span class="arrow"><i class="fa fa-angle-double-right"></i></span>
						<span class="bold">전체 진행률</span><br>
						<div id="progressbar">
						  <div style="width: 23%;"><p class="prog_text" >23%</p></div>
						</div>
					</div>
					<div style="position: relative;">
						<!-- <span id="total" class="arrow"><i class="fa fa-angle-double-right"></i> </span><span class="bold" style="margin-bottom: 20px;">대기 신청자 관리</span><br> -->
						<span class="bold" style="margin-bottom: 5px;">참가 인원&nbsp;&nbsp;</span><span>15명</span><br>
						<span class="bold" style="margin-bottom: 0px;">모임 활동 기간&nbsp;&nbsp;</span><span style="margin-bottom:20px; display: inline-block">2020.08.08 ~ 2020.12.31</span><br>
						<span class="bold">보상 및 조건</span><br>
						<span>- 보증금 환불</span><br>
						<span>- 30일간 90문제</span><br>
						<span class="group_text">"방학동안 알고리즘 공부를 함께하기 위해 만든 모임입니다. 열정 있으신 분이라면 모두 참여 가능합니다."</span>
					</div>
					<span id="GroupInfobtn" class="btn" style="background:rgba(54, 92, 244, 0.6); float:right; margin-bottom: 15px;">수정</span>
            </div>
          </div>
        </div>
      </div>

			<div id="GroupEdit" class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">

							<form class="" action="index.html" method="post">
								<div style="margin: 15px 0;">
									<input type="text" class="title" name="" value="알고리즘 화이팅">
									<!-- <span class="title">알고리즘 화이팅</span> -->
								</div>
								<hr>
								<span class="bold" style="margin-bottom: 0px;">모임 활동 기간&nbsp;&nbsp;</span>
								<input type="text" name="" value="2020.08.08 ~ 2020.12.3"><br>
								<!-- <span style="margin-bottom:20px; display: inline-block">2020.08.08 ~ 2020.12.31</span><br> -->
								<span class="bold" style="margin-top: 10px;">보상 및 조건</span><br>
								<textarea name="name" rows="3" cols="35" class="textarea">보증금 환불
30일간 90문제</textarea><br>
								<span class="bold" style="margin-top: 10px;">모임 소개</span><br>
								<textarea name="name" rows="5" style="width:100%;">"방학동안 알고리즘 공부를 함께하기 위해 만든 모임입니다. 열정 있으신 분이라면 모두 참여 가능합니다."</textarea>
							</form>
							<span id="GroupInfoOk" class="btn" style="background:rgba(76, 175, 80, 0.6); float:right; margin: 15px 0;">완료</span>
            </div>
          </div>
        </div>
      </div>

	  <!-- CHECKLIST -->
      <div id="CHECKLIST" class="w3-container w3-card w3-white w3-round w3-margin"><br>
				<div style="text-align: right; margin-bottom: 30px;">
					<h2 style="float:left; line-height:25px; font-weight:bold; color: #3a4b53;">CHECKLIST</h2>
					<button type="button" name="button" style="font-size: 13px; padding: 4px 20px; border:none; margin: 6px 10px 0 0;">과제 추가</button>
					<span id="editbtn"><i class="fa fa-cog" aria-hidden="true" style="font-size:20px; color: #6c757d; cursor: pointer"></i></span>
				</div>
				<hr>
				<div class="check">
					<input type="checkbox" name="" value="">
					<span style="padding-left: 10px;">백준 170, 180번</span>
					<div style="float:right;">
						<span class="showfinish"><i class="fa fa-list-alt"></i></span>
						<span class="detailbtn"><i class="fa fa-angle-down"></i></span>
					</div>
					<div class="check_finish">
						<p>신희주 완료</p>
						<p>박상범 완료</p>
					</div>
					<div class="check_detail">
						<p>다이나믹 프로그래밍을 이용한 탑 다운 프로그램을 작성하는 문제입니다. 어렵더라도 포기하지 말고 열심히 합시다!</p>
					</div>
				</div>
				<div class="check">
					<input type="checkbox" name="" value="">
					<span style="padding-left: 10px;">백준 170, 180번</span>
					<div style="float:right;">
						<span class="showfinish"><i class="fa fa-list-alt"></i></span>
						<span class="detailbtn"><i class="fa fa-angle-down"></i></span>
					</div>
					<div class="check_finish">
						<p>신희주 완료</p>
						<p>박상범 완료</p>
						<p>정예은 완료</p>
					</div>
					<div class="check_detail">
						<p>다이나믹 프로그래밍을 이용한 탑 다운 프로그램을 작성하는 문제입니다. 어렵더라도 포기하지 말고 열심히 합시다!</p>
					</div>
				</div>
				<div class="check">
					<input type="checkbox" name="" value="">
					<span style="padding-left: 10px;">백준 170, 180번</span>
					<div style="float:right;">
						<span class="showfinish"><i class="fa fa-list-alt"></i></span>
						<span class="detailbtn"><i class="fa fa-angle-down"></i></span>
					</div>
					<div class="check_finish">
						<p>최승아 완료</p>
					</div>
					<div class="check_detail">
						<p>다이나믹 프로그래밍을 이용한 탑 다운 프로그램을 작성하는 문제입니다. 어렵더라도 포기하지 말고 열심히 합시다!</p>
					</div>
				</div>
				<div class="check">
					<input type="checkbox" name="" value="">
					<span style="padding-left: 10px;">백준 170, 180번</span>
					<div style="float:right;">
						<span class="showfinish"><i class="fa fa-list-alt"></i></span>
						<span class="detailbtn"><i class="fa fa-angle-down"></i></span>
					</div>
					<div class="check_finish">
						<p>완료자 없음</p>
					</div>
					<div class="check_detail">
						<p>다이나믹 프로그래밍을 이용한 탑 다운 프로그램을 작성하는 문제입니다. 어렵더라도 포기하지 말고 열심히 합시다!</p>
					</div>
				</div>
				<div class="check">
					<input type="checkbox" name="" value="">
					<span style="padding-left: 10px;">백준 170, 180번</span>
					<div style="float:right;">
						<span class="showfinish"><i class="fa fa-list-alt"></i></span>
						<span class="detailbtn"><i class="fa fa-angle-down"></i></span>
					</div>
					<div class="check_finish">
						<p>신희주 완료</p>
						<p>박상범 완료</p>
						<p>정예은 완료</p>
						<p>최승아 완료</p>
					</div>
					<div class="check_detail">
						<p>다이나믹 프로그래밍을 이용한 탑 다운 프로그램을 작성하는 문제입니다. 어렵더라도 포기하지 말고 열심히 합시다!</p>
					</div>
				</div>
      </div>

	  <!-- edit checklist -->
	  <div id="EditCheckList" class="w3-container w3-card w3-white w3-round w3-margin"><br>
		  <div>
					<form class="" action="index.html" method="post">
						<div style="text-align: right; margin-bottom: 35px;">
							<h2 style="float:left; line-height:30px; font-weight: bold; color: #3a4b53">CHECKLIST EDIT</h2>
							<input id="editfin" type="submit" class="check_edit btn" style="background:rgba(76, 175, 80, 0.6); border: none; margin-top: 13px;" name="" value="수정">
						</div>
						<hr>
						<div class="checkEditlist">
							<input type="text" name="" value="백준 171, 181번">
							<div style="float:right;">
								<span class="btn" style="background:rgba(244, 67, 54, 0.6)">삭제</span>
							</div>
							<div class="p_cont check_detail_edit">
								<textarea name="name" style="width:100%;">다이나믹 프로그래밍을 이용한 탑 다운 프로그램을 작성하는 문제입니다. 어렵더라도 포기하지 말고 열심히 합시다!</textarea>
							</div>
						</div>
						<div class="checkEditlist">
							<input type="text" name="" value="백준 171, 181번">
							<div style="float:right;">
								<span class="btn" style="background:rgba(244, 67, 54, 0.6)">삭제</span>
							</div>
							<div class="p_cont check_detail_edit">
								<textarea name="name" style="width:100%;">다이나믹 프로그래밍을 이용한 탑 다운 프로그램을 작성하는 문제입니다. 어렵더라도 포기하지 말고 열심히 합시다!</textarea>
							</div>
						</div>
						<div class="checkEditlist">
							<input type="text" name="" value="백준 171, 181번">
							<div style="float:right;">
								<span class="btn" style="background:rgba(244, 67, 54, 0.6)">삭제</span>
							</div>
							<div class="p_cont check_detail_edit">
								<textarea name="name" style="width:100%;">다이나믹 프로그래밍을 이용한 탑 다운 프로그램을 작성하는 문제입니다. 어렵더라도 포기하지 말고 열심히 합시다!</textarea>
							</div>
						</div>
						<div class="checkEditlist">
							<input type="text" name="" value="백준 171, 181번">
							<div style="float:right;">
								<span class="btn" style="background:rgba(244, 67, 54, 0.6)">삭제</span>
							</div>
							<div class="p_cont check_detail_edit">
								<textarea name="name" style="width:100%;">다이나믹 프로그래밍을 이용한 탑 다운 프로그램을 작성하는 문제입니다. 어렵더라도 포기하지 말고 열심히 합시다!</textarea>
							</div>
						</div>
						<div class="checkEditlist">
							<input type="text" name="" value="백준 171, 181번">
							<div style="float:right;">
								<span class="btn" style="background:rgba(244, 67, 54, 0.6)">삭제</span>
							</div>
							<div class="p_cont check_detail_edit">
								<textarea name="name" style="width:100%;">다이나믹 프로그래밍을 이용한 탑 다운 프로그램을 작성하는 문제입니다. 어렵더라도 포기하지 말고 열심히 합시다!</textarea>
							</div>
						</div>
					</form>
				</div>
      </div>

      <div id="AllGroup" class="w3-container w3-card w3-white w3-round w3-margin"><br>
		  <!-- All Group -->
		  <div style="text-align: right; margin: 20px 0;">
				<span style="float:left; font-size: 30px; font-weight: bold; color: #3a4b53;">전체 진행률</span>
				<select name="category" style="padding:5px">
				    <option value="이름순">이름순</option>
				    <option value="진도율 낮은 순">진도율 낮은 순</option>
				    <option value="진도율 높은 순">진도율 높은 순</option>
				</select>
				<span style="cursor: pointer;" class="member_setting"><i class="fa fa-cog" aria-hidden="true" style="font-size:22px; color: #6c757d;"></i></span>
			</div>
			<div class="people">
				<i class="fa fa-user-circle thumb"></i>
				<div class="eachcontent">
					<span style="float:right">45/100</span>
					<span>강다니엘</span><br>
					<div id="progressbar_tot">
					  <div style="width: 45%;"><p class="prog_text_tot" >45%</p></div>
					</div>
				</div>
			</div>
			<div class="people">
				<i class="fa fa-user-circle thumb"></i>
				<div class="eachcontent">
					<span style="float:right">72/90</span>
					<span>박지훈</span><br>
					<div id="progressbar_tot">
					  <div style="width: 80%;"><p class="prog_text_tot" >80%</p></div>
					</div>
				</div>
			</div>
			<div class="people">
				<i class="fa fa-user-circle thumb"></i>
				<div class="eachcontent" >
					<span style="float:right">72/90</span>
					<span>이대휘</span><br>
					<div id="progressbar_tot">
					  <div style="width: 80%;"><p class="prog_text_tot" >80%</p></div>
					</div>
				</div>
			</div>
			<div class="people">
				<i class="fa fa-user-circle thumb"></i>
				<div class="eachcontent">
					<span style="float:right">50/90</span>
					<span>배진영</span><br>
					<div id="progressbar_tot">
					  <div style="width: 80%;"><p class="prog_text_tot" >80%</p></div>
					</div>
				</div>
			</div>
			<div class="people">
				<i class="fa fa-user-circle thumb"></i>
				<div class="eachcontent">
					<span style="float:right">67/90</span>
					<span>황민현</span><br>
					<div id="progressbar_tot">
					  <div style="width: 67%;"><p class="prog_text_tot" >67%</p></div>
					</div>
				</div>
			</div>
			<div class="people">
				<i class="fa fa-user-circle thumb"></i>
				<div class="eachcontent">
					<span style="float:right">67/90</span>
					<span>옹성우</span><br>
					<div id="progressbar_tot">
					  <div style="width: 40%;"><p class="prog_text_tot" >40%</p></div>
					</div>
				</div>
			</div>
      </div>
			<!-- 참가자 관리 -->
			<div id="ManagePeople" class="w3-container w3-card w3-white w3-round w3-margin"><br>
		  <div style="text-align: right; margin: 20px 0;">
				<span style="float:left; font-size: 30px; font-weight: bold; color: #3a4b53;">참가자 관리</span>
				<select name="category" style="padding:5px">
				    <option value="이름순">이름순</option>
				    <option value="진도율 낮은 순">진도율 낮은 순</option>
				    <option value="진도율 높은 순">진도율 높은 순</option>
				</select>
				<span class="btn managefin" style="background: #DFE5E8; margin-left: 10px; padding: 5px; color: black;">수정 완료</span>
			</div>
			<div class="people">
				<i class="fa fa-user-circle thumb"></i>
				<div class="eachcontent">
					<span class="btn" style="background:rgba(244, 67, 54, 0.6); float: right; margin-top: 10px;">강퇴</span>
					<span>강다니엘</span><br>
					<div id="progressbar_tot">
					  <div style="width: 45%;"><p class="prog_text_tot" >45%</p></div>
					</div>
				</div>
			</div>
			<div class="people">
				<i class="fa fa-user-circle thumb"></i>
				<div class="eachcontent">
					<span class="btn" style="background:rgba(244, 67, 54, 0.6); float: right; margin-top: 10px;">강퇴</span>
					<span>박지훈</span><br>
					<div id="progressbar_tot">
					  <div style="width: 80%;"><p class="prog_text_tot" >80%</p></div>
					</div>
				</div>
			</div>
			<div class="people">
				<i class="fa fa-user-circle thumb"></i>
				<div class="eachcontent" >
					<span class="btn" style="background:rgba(244, 67, 54, 0.6); float: right; margin-top: 10px;">강퇴</span>
					<span>이대휘</span><br>
					<div id="progressbar_tot">
					  <div style="width: 80%;"><p class="prog_text_tot" >80%</p></div>
					</div>
				</div>
			</div>
			<div class="people">
				<i class="fa fa-user-circle thumb"></i>
				<div class="eachcontent">
					<span class="btn" style="background:rgba(244, 67, 54, 0.6); float: right; margin-top: 10px;">강퇴</span>
					<span>배진영</span><br>
					<div id="progressbar_tot">
					  <div style="width: 80%;"><p class="prog_text_tot" >80%</p></div>
					</div>
				</div>
			</div>
			<div class="people">
				<i class="fa fa-user-circle thumb"></i>
				<div class="eachcontent">
					<span class="btn" style="background:rgba(244, 67, 54, 0.6); float: right; margin-top: 10px;">강퇴</span>
					<span>황민현</span><br>
					<div id="progressbar_tot">
					  <div style="width: 67%;"><p class="prog_text_tot" >67%</p></div>
					</div>
				</div>
			</div>
			<div class="people">
				<i class="fa fa-user-circle thumb"></i>
				<div class="eachcontent">
					<span class="btn" style="background:rgba(244, 67, 54, 0.6); float: right; margin-top: 10px;">강퇴</span>
					<span>옹성우</span><br>
					<div id="progressbar_tot">
					  <div style="width: 40%;"><p class="prog_text_tot" >40%</p></div>
					</div>
				</div>
			</div>
    <!-- End Middle Column -->
    </div>


  <!-- End Grid -->
  </div>
	<!-- Right Column -->
	<div class="w3-col m2">
		<div class="w3-card w3-round w3-white w3-center">
			<div class="w3-container">
				<p>Upcoming Events:</p>
				<!-- <img src="/w3images/forest.jpg" alt="Forest" style="width:100%;"> -->
				<p><strong>Holiday</strong></p>
				<p>Friday 15:00</p>
				<p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
			</div>
		</div>
		<br>

		<div class="w3-card w3-round w3-white w3-center">
			<div class="w3-container">
				<p>Friend Request</p>
				<!-- <img src="/w3images/avatar6.png" alt="Avatar" style="width:50%"><br> -->
				<span>Jane Doe</span>
				<div class="w3-row w3-opacity">
					<div class="w3-half">
						<button class="w3-button w3-block w3-green w3-section" title="Accept"><i class="fa fa-check"></i></button>
					</div>
					<div class="w3-half">
						<button class="w3-button w3-block w3-red w3-section" title="Decline"><i class="fa fa-remove"></i></button>
					</div>
				</div>
			</div>
		</div>
		<br>

		<div class="w3-card w3-round w3-white w3-padding-16 w3-center">
			<p>ADS</p>
		</div>
		<br>

		<div class="w3-card w3-round w3-white w3-padding-32 w3-center">
			<p><i class="fa fa-bug w3-xxlarge"></i></p>
		</div>

	<!-- End Right Column -->
	</div>


<!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-padding-16">
  <h5>Footer</h5>
</footer>

<footer class="w3-container w3-theme-d5">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>




<script>
// Accordion
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme-d1";
  } else {
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className =
    x.previousElementSibling.className.replace(" w3-theme-d1", "");
  }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>

</body>
</html>
