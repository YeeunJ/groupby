<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
		<style>
			* {
				padding:0;
				margin:0;
				box-sizing: border-box;
			}
			body {
				background: #f5dfc3;
			}
			#GroupDetail {
				overflow: hidden;
				width: 1000px;
				margin: 0 auto;
			}
			.title {
				font-size: 25px;
			}
			.open {
				background: rgb(26, 188, 156);
				padding: 1px 10px;
				border-radius: 30px;
				font-size: 13px;

			}
			#information {
				background: rgba(255, 255, 255, 0.36);
				padding: 15px;
				float:left;
				margin-right: 20px;
				width: 330px;
			}
			.MyInfo {
				background: white;
				font-size: 30px;
				/* width: 330px; */
				padding: 20px;
				margin-bottom: 20px;
			}
			.GroupInfo {
				background: white;
				padding: 20px;
				/* width: 350px;  */
				height: 510px;
				overflow: hidden;
			}
			.group_image {
				float:left;
			}
			.group_text {
				 font-style: italic;
				 display: block;
				 width: 76%;
				 margin: 15px auto 0 auto;
				 text-align: center;
			}
			.edit {
				padding: 3px 8px;
				border-radius: 15px; border: none;
				float: right;
				margin: 5px 0;
			}

			#GroupPeople, #Member_Exit, #Waiting_Member {
				background: rgba(255, 255, 255, 0.36);
				width: 650px;
				height: 732px;
    			padding: 20px;
				float:left;
				display: none;
			}

			.GroupStatus {
				overflow-y: auto;
				background: white;
				height: 100%;
				padding: 5px;
			}
			.prog {
				width: 100%;
    			height: 30px;
			}
			progress {
				color: black;
			}
			.people {
				overflow: hidden;
				background: rgb(250, 250, 250);
				margin: 15px 20px;
				padding: 12px;
				box-shadow: 3px 3px 5px rgba(0,0,0,0.3);
			}
			.eachcontent {
				float:left;
				padding-left: 20px;
				width: 92%;
				height: 44px;
			}
			.exit {
				margin-top: 10px;
    			padding: 3px 8px;
				float:right;
				border: none;
				color: white;
				background: rgb(231, 76, 60);
				border-radius: 15px;
			}

			#CheckList {
				background: rgba(255, 255, 255, 0.36);
				width: 650px;
				float:left;
				height: 732px;
    			padding: 20px;
			}
			.CheckStatus {
				overflow-y: auto;
				background: white;
				height: 100%;
				padding: 5px;
			}
			.check {
				background: rgb(250, 250, 250);
				margin: 15px 20px;
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
			.active {
				color:rgb(243, 156, 18);
			}
			#CheckList_Edit {
				background: rgba(255, 255, 255, 0.36);
				width: 650px;
				height: 732px;
    			padding: 20px;
				float:left;
				display: none;
			}
			.btn_style{
				padding: 5px 10px;
			    border: none;
			    border-radius: 15px;
			    border: 2px solid rgb(26, 188, 156);
			    background: white;
			    color: rgb(25, 188, 156);
			}
			.arrow {
				float:right;
				font-size:25px;
				cursor: pointer;
				position: absolute;
			    top: -8px;
			    right: 0;
			}
			.bold {
				font-weight: bold;
				display: inline-block;

			}
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		<script type="text/javascript">
		var div_list = ['#CheckList', '#GroupPeople', '#CheckList_Edit', '#Member_Exit','#Waiting_Member'];
		var active_list = ['#total', '#mylist', '.waiting_list'];
		var length = div_list.length;

		$(function(){
			$('#total').click(function(){
				// $('#Wrapper').html(total);
				$('#CheckList').hide();
				for(var i=0 ; i<length ; i++) {
					$(div_list[i]).hide();
				}
				$('#GroupPeople').show();
				for(var i=0 ; i<active_list.length ; i++) {
					$(active_list[i]).removeClass('active');
				}
				$(this).addClass('active');
			});
			$('#mylist').click(function(){
				for(var i=0 ; i<length ; i++) {
					$(div_list[i]).hide();
				}
				$('#CheckList').show();
				for(var i=0 ; i<active_list.length ; i++) {
					$(active_list[i]).removeClass('active');
				}
				$(this).addClass('active');
			});
			$('.waiting_list').click(function(){
				for(var i=0 ; i<length ; i++) {
					$(div_list[i]).hide();
				}
				$('#Waiting_Member').show();
				for(var i=0 ; i<active_list.length ; i++) {
					$(active_list[i]).removeClass('active');
				}
				$(this).addClass('active');
			});
			$('.check_setting').click(function() {
				for(var i=0 ; i<length ; i++) {
					$(div_list[i]).hide();
				}
				$('#CheckList_Edit').show();
			});
			$('.edit_fin').click(function(){
				for(var i=0 ; i<length ; i++) {
					$(div_list[i]).hide();
				}
				$('#CheckList').show();
			});
			$('.member_setting').click(function(){
				for(var i=0 ; i<length ; i++) {
					$(div_list[i]).hide();
				}
				$('#Member_Exit').show();
			});
			$('.member_fin').click(function(){
				for(var i=0 ; i<length ; i++) {
					$(div_list[i]).hide();
				}
				$('#GroupPeople').show();
				for(var i=0 ; i<active_list.length ; i++) {
					$(active_list[i]).removeClass('active');
				}
				$('#total').addClass('active');
			});

		});

		</script>
	</head>
	<body>
		<div id="GroupDetail">
				<h1 style="margin:20px 0;">TOGETHER</h1>
				<!-- information Start -->
				<div id="information">
					<!-- MyInfo Start -->
					<div class="MyInfo">
						<img style="border-radius:50px;" src="./image/notebook.jpg" alt="profile" width="85px" height="85px">
						<p><span>Nickname</span> <i class="fa fa-user"></i></p>
					</div>
					<!-- GroupInfo Start -->
					<div class="GroupInfo">
						<div style="margin-bottom: 15px;">
							<span class="title">알고리즘 화이팅</span>
							<span class="open">공개</span><br>
						</div>
						<div style="position: relative;">
							<span id="mylist" class="active arrow"><i class="fa fa-angle-double-right"></i></span>
							<span style="float:right"> 3/7&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<span style="font-weight: bold; display: inline-block">나의 진행률(상위 30%)</span><br>
							<progress class="prog" value="45" max="100">
								<strong>Progress: 10%</strong>
							</progress>
						</div>
						<div style="position: relative;">
							<span id="total" class="arrow"><i class="fa fa-angle-double-right"></i></span>
							<span style="font-weight: bold; display: inline-block">전체 진행률</span><br>
							<progress class="prog" value="20" max="100">
								<strong>Progress: 10%</strong>
							</progress>
						</div>
						<div style="position: relative;">
							<span class="bold" style="margin-bottom: 15px;">대기 신청자 관리</span><span class="waiting_list arrow" style="float:right; font-size:25px; cursor: pointer"><i class="fa fa-angle-double-right"></i></span><br>

							<span class="bold" style="margin-bottom: 5px;">참가 인원  </span><span>15명</span><br>
							<span class="bold" style="margin-bottom: 0px;">모임 활동 기간  </span><br><span style="margin-bottom:15px; display: inline-block">2020.08.08 ~ 2020.12.31</span><br>
							<span class="bold">보상 및 조건</span><br>
							<span>- 보증금 환불</span><br>
							<span>- 30일간 90문제</span><br>
							<span class="group_text">"방학동안 알고리즘 공부를 함께하기 위해 만든 모임입니다. 열정 있으신 분이라면 모두 참여 가능합니다."</span>
						</div>
						<button type="button" name="button" class="edit">Edit</button>
					</div>
				</div>
				<div class="Wrapper">
					<!-- CheckList -->
					<div id="CheckList">
						<div class="CheckStatus">
							<div style="text-align: right; margin: 20px 20px 20px 0; padding-left: 20px;">
								<span style="float:left; line-height: 40px; font-size: 30px;">CHECKLIST</span>
								<button type="button" name="button" style="padding: 8px 30px; border:none; margin-right: 10px;">과제 추가</button>
								<span class="check_setting"><i class="fa fa-cog" aria-hidden="true" style="font-size:30px; color: black; cursor: pointer"></i></span>
							</div>
							<div class="check">
								<input type="checkbox" name="" value="">
								<span>백준 170, 180번</span>
								<div style="float:right;">
									<span style="font-size: 20px; color:rgb(243, 156, 18);"><i class="fa fa-list-alt"></i></span>
									<span style="font-size: 20px;"><i class="fa fa-angle-down"></i></span>
								</div>
							</div>
							<div class="check">
								<input type="checkbox" name="" value="">
								<span>백준 170, 180번</span>
								<div style="float:right;">
									<span style="font-size: 20px; color:rgb(243, 156, 18);"><i class="fa fa-list-alt"></i></span>
									<span style="font-size: 20px;"><i class="fa fa-angle-down"></i></span>
								</div>
							</div>
							<div class="check">
								<input type="checkbox" name="" value="">
								<span>백준 170, 180번</span>
								<div style="float:right;">
									<span style="font-size: 20px; color:rgb(243, 156, 18);"><i class="fa fa-list-alt"></i></span>
									<span style="font-size: 20px;"><i class="fa fa-angle-down"></i></span>
								</div>
							</div>
							<div class="check">
								<input type="checkbox" name="" value="">
								<span>백준 170, 180번</span>
								<div style="float:right;">
									<span style="font-size: 20px; color:rgb(243, 156, 18);"><i class="fa fa-list-alt"></i></span>
									<span style="font-size: 20px;"><i class="fa fa-angle-down"></i></span>
								</div>
							</div>
							<div class="check">
								<input type="checkbox" name="" value="">
								<span>백준 170, 180번</span>
								<div style="float:right;">
									<span style="font-size: 20px; color:rgb(243, 156, 18);"><i class="fa fa-list-alt"></i></span>
									<span style="font-size: 20px;"><i class="fa fa-angle-down"></i></span>
								</div>
							</div>
						</div>
					</div>

					<!-- CheckList Edit -->
					<div id="CheckList_Edit">
						<div class="CheckStatus">
							<div style="text-align: right; margin: 20px 20px 20px 0; padding-left: 20px; line-height: 40px;">
								<span style="float:left; line-height: 40px; font-size: 30px;">CHECKLIST EDIT</span>
								<button type="button" name="button" class="edit_fin btn_style">수정 완료</button>
							</div>
							<div class="check">
								<span>백준 170, 180번</span>
								<div style="float:right;">
									<button type="button" name="button">삭제</button>
									<button type="button" name="button">수정</button>
								</div>
							</div>
							<div class="check">
								<span>백준 170, 180번</span>
								<div style="float:right;">
									<button type="button" name="button">삭제</button>
									<button type="button" name="button">수정</button>
								</div>
							</div>
							<div class="check">
								<span>백준 170, 180번</span>
								<div style="float:right;">
									<button type="button" name="button">삭제</button>
									<button type="button" name="button">수정</button>
								</div>
							</div>
							<div class="check">
								<span>백준 170, 180번</span>
								<div style="float:right;">
									<button type="button" name="button">삭제</button>
									<button type="button" name="button">수정</button>
								</div>
							</div>
							<div class="check">
								<span>백준 170, 180번</span>
								<div style="float:right;">
									<button type="button" name="button">삭제</button>
									<button type="button" name="button">수정</button>
								</div>
							</div>
						</div>
					</div>


					<!-- GroupPeople Start -->
					<div id="GroupPeople">
						<div class="GroupStatus">
							<div class="" style="text-align: right; margin: 20px 20px 20px 0; padding-left: 20px;">
								<span style="float:left; line-height: 40px; font-size: 30px;">전체 진행률</span>
								<select name="category" style="padding:10px">
								    <option value="이름순">이름순</option>
								    <option value="진도율 낮은 순">진도율 낮은 순</option>
								    <option value="진도율 높은 순">진도율 높은 순</option>
								</select>
								<span style="cursor: pointer;" class="member_setting"><i class="fa fa-cog" aria-hidden="true" style="font-size:30px; color: black;"></i></span>
							</div>
							<div class="people">
								<i class="fa fa-user-circle" style="font-size: 35px; float: left; line-height:44px"></i>
								<div class="eachcontent">
									<span style="float:right">72/90</span>
									<span>강다니엘</span><br>
									<progress class="people_prog" value="45" max="100">
										<strong>Progress:80%</strong>
									</progress>
								</div>
							</div>
							<div class="people">
								<i class="fa fa-user-circle" style="font-size: 35px; float: left; line-height:44px"></i>
								<div class="eachcontent">
									<span style="float:right">72/90</span>
									<span>박지훈</span><br>
									<progress class="people_prog" value="45" max="100">
										<strong>Progress:80%</strong>
									</progress>
								</div>
							</div>
							<div class="people">
								<i class="fa fa-user-circle" style="font-size: 35px; float: left; line-height:44px"></i>
								<div class="eachcontent" >
									<span style="float:right">72/90</span>
									<span>이대휘</span><br>
									<progress class="people_prog" value="72" max="90">
										<strong>Progress:80%</strong>
									</progress>
								</div>
							</div>
							<div class="people">
								<i class="fa fa-user-circle" style="font-size: 35px; float: left; line-height:44px"></i>
								<div class="eachcontent">
									<span style="float:right">50/90</span>
									<span>배진영</span><br>
									<progress class="people_prog" value="50" max="90">
										<strong>Progress:80%</strong>
									</progress>
								</div>
							</div>
							<div class="people">
								<i class="fa fa-user-circle" style="font-size: 35px; float: left; line-height:44px"></i>
								<div class="eachcontent">
									<span style="float:right">67/90</span>
									<span>황민현</span><br>
									<progress class="people_prog" value="67" max="90">
										<strong>Progress:80%</strong>
									</progress>
								</div>
							</div>
							<div class="people">
								<i class="fa fa-user-circle" style="font-size: 35px; float: left; line-height:44px"></i>
								<div class="eachcontent">
									<span style="float:right">67/90</span>
									<span>옹성우</span><br>
									<progress class="people_prog" value="67" max="90">
										<strong>Progress:80%</strong>
									</progress>
								</div>
							</div>
						</div>
					</div>

					<!-- GroupPeople Member Exit -->
					<div id="Member_Exit">
						<div class="GroupStatus">
							<div style="text-align: right; margin: 20px 20px 20px 0; height: 38px; padding-left: 20px;">
								<span style="float:left; line-height: 40px; font-size: 30px;">전체 멤버 관리</span>
								<button type="button" name="button" class="member_fin btn_style">완료</button>
							</div>
							<div class="people">
								<i class="fa fa-user-circle" style="font-size: 35px; float: left; line-height:44px"></i>
								<div class="eachcontent">
									<button type="button" name="button" class="exit">강퇴</button>
									<span>강다니엘</span><br>
									<progress class="people_prog" value="45" max="100">
										<strong>Progress:80%</strong>
									</progress>
								</div>
							</div>

							<div class="people">
								<i class="fa fa-user-circle" style="font-size: 35px; float: left; line-height:44px"></i>
								<div class="eachcontent">
									<button type="button" name="button" class="exit">강퇴</button>
									<span>박지훈</span><br>
									<progress class="people_prog" value="45" max="100">
										<strong>Progress:80%</strong>
									</progress>
								</div>
							</div>
							<div class="people">
								<i class="fa fa-user-circle" style="font-size: 35px; float: left; line-height:44px"></i>
								<div class="eachcontent" >
									<button type="button" name="button" class="exit">강퇴</button>
									<span>이대휘</span><br>
									<progress class="people_prog" value="72" max="90">
										<strong>Progress:80%</strong>
									</progress>
								</div>
							</div>
							<div class="people">
								<i class="fa fa-user-circle" style="font-size: 35px; float: left; line-height:44px"></i>
								<div class="eachcontent">
									<button type="button" name="button" class="exit">강퇴</button>
									<span>배진영</span><br>
									<progress class="people_prog" value="50" max="90">
										<strong>Progress:80%</strong>
									</progress>
								</div>
							</div>
							<div class="people">
								<i class="fa fa-user-circle" style="font-size: 35px; float: left; line-height:44px"></i>
								<div class="eachcontent">
									<button type="button" name="button" class="exit">강퇴</button>
									<span>황민현</span><br>
									<progress class="people_prog" value="67" max="90">
										<strong>Progress:80%</strong>
									</progress>
								</div>
							</div>
							<div class="people">
								<i class="fa fa-user-circle" style="font-size: 35px; float: left; line-height:44px"></i>
								<div class="eachcontent">
									<button type="button" name="button" class="exit">강퇴</button>
									<span>옹성우</span><br>
									<progress class="people_prog" value="67" max="90">
										<strong>Progress:80%</strong>
									</progress>
								</div>
							</div>
						</div>
					</div>
					<!-- GroupPeople Member Exit -->
					<div id="Waiting_Member">
						<div class="GroupStatus">
							<div style="text-align: right; margin: 20px 20px 20px 0; height: 38px; padding-left: 20px;">
								<span style="float:left; line-height: 40px; font-size: 30px;">대기 신청자 관리</span>
								<button type="button" name="button" class="member_fin btn_style">완료</button>
							</div>
							<div class="people">
								<div class="eachcontent" style="width: 98%;">
									<button type="button" name="button" class="exit">거절</button>
									<button type="button" name="button" class="exit" style="margin-right: 10px; background:rgb(41, 128, 185)">수락</button>
									<span style="font-weight: bold;">강다니엘</span><br>
									<p>같이 알고리즘 공부하고 싶어요~</p>
								</div>
							</div>
							<div class="people">
								<div class="eachcontent" style="width: 98%;">
									<button type="button" name="button" class="exit">거절</button>
									<button type="button" name="button" class="exit" style="margin-right: 10px; background:rgb(41, 128, 185)">수락</button>
									<span style="font-weight: bold;">Bubble sort</span><br>
									<p>알고리즘 실력을 키우고 싶습니다!</p>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- Wrapper finish -->
			</div>
			<!-- GroupDetail Finish -->
	</body>
</html>
