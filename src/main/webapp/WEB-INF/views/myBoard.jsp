<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.group.by.board.myBoard.*" %>
<%@ page import="com.group.by.dto.missionDTO" %>
<%@ page import="com.group.by.dto.groupinfoDTO" %>
<%@ page import="com.group.by.dto.progressDTO" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>


<jsp:useBean id="dao" class="com.group.by.board.myBoard.myBoardDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="com.group.by.dto.missionDTO" scope="page"></jsp:useBean>
<jsp:useBean id="dto_group" class="com.group.by.dto.groupinfoDTO" scope="page"></jsp:useBean>
<jsp:useBean id="progress" class="com.group.by.dto.progressDTO" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>

	<head>
		<title>TOGETHER</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<%@ include file="/WEB-INF/views/createBoard_my.jsp" %>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <script type="text/javascript" src="/js/allBoard.js"></script>
    <script type="text/javascript" src="/js/createBoard.js?d"></script>
    <link rel="stylesheet" href="/css/createBoard_my.css?">


		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
		<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="/css/myBoard.css" rel="stylesheet" />
		<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>

	</head>
	<script type="text/JavaScript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- seunga script -->
	<script type="text/javascript">
		$(document).ready(function(){
			// checkbox
			$("input:checkbox[name=mission]").click(function(){
				if($(this).is(":checked")==true) {
					var $box = $(this).parent('div.check');

					alert("미션을 완료했습니다.");
					$(this).parent( 'div.check' ).css( 'background', '#ccc' );
					// var $box = $(this).parent('div.check').clone();
					// $(this).parent('div.check').hide();
					// $(".checkWrapper").append($box);
					// $(".checkWrapper").append($(this).parent('div.check'));
					var missionID =  $(this).attr("value");
					var userID = 2;
					dao.missionTrue(userID, missionID);

				}
				else {
					alert("풀렸음");
					$(this).parent( 'div.check' ).css( 'background', 'rgb(250, 250, 250)' );
					// var index = $(this).parent('div.check').attr("value");
					// console.log(index);
					var missionID =  $(this).attr("value");
					var userID = 2;
					dao.missionTrue(userID, missionID);

					// $('div.check').eq(index).show();
					// $(this).parent('div.check').remove();
				}
			});
			// function checkedBox() {}
			// 		if($("input:checkbox[name=mission]").is(":checked")==true) {
			// 			$(this).parent( 'div.check' ).css( 'background', '#ccccccf' );
			// 		}
			// }

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
				alert("미션이 수정되었습니다.");
			});
			$('#EditGroupInfo').click(function(){
				alert("그룹 정보가 수정되었습니다.");
			});
			$('#missionAddBtn').click(function(){
				alert("미션이 추가되었습니다.");
			});

			$('#editcancel').click(function(){
				$('#EditCheckList').hide();
				$('#CHECKLIST').show();
			});


			$('#GroupInfobtn').click(function(){
				$('#GroupEdit').show();
				$('#GroupInfo').hide();
			});
			$('#GroupCancelbtn').click(function(){
				$('#GroupEdit').hide();
				$('#GroupInfo').show();
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

      <!-- Group Info -->
			<%
				groupinfoDTO info = dao.GroupInfo(null);
				dto_group = info;
			%>

      <div class="w3-card w3-round w3-white w3-hide-small">
        <div class="w3-container">
          <div id="GroupInfo">
    					<div style="margin: 15px 0;">
    						<span class="title"><%= dto_group.getName() %></span>
    					</div>
    					<hr>
    					<div style="position: relative; margin-bottom: 15px;">
    						<span class="bold">나의 진행률</span><br>
    						<div id="progressbar">
    						  <div style="width: 40%;"><p class="prog_text" >40%</p></div>
    						</div>
    					</div>
    					<div style="position: relative; margin-bottom: 15px;">
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
    						<span>- 보상: <%= dto_group.getReward() %></span><br>
    						<span>- 조건: <%= dto_group.getRwCondition() %></span><br>
    						<span class="group_text">"<%= dto_group.getNotice() %>"</span>
    					</div>
    					<span id="GroupInfobtn" class="btn" style="background:rgba(54, 92, 244, 0.6); float:right; margin-bottom: 15px;">수정</span>
          </div>
					<!-- Group Info Edit -->
					<div id="GroupEdit" class="w3-row-padding" style="padding:0">

						<form class="" action="updateGroup" method="post">
							<div style="margin: 15px 0;">
								<input type="text" class="title" name="title" value="<%= dto_group.getName() %>" style>
							</div>
							<hr>
							<span class="bold" style="margin-bottom: 0px;">모임 활동 기간&nbsp;&nbsp;</span><br>
							<input type="date" name="startdate" style="width:45%;" value="<%= dto_group.getStartDate() %>"><span>~</span><input type="date" style="width:45%;" name="enddate" value="<%= dto_group.getEndDate() %>">
							<%-- <input typeㄹ="text" name="enddate" value="2020.08.08 ~ 2020.12.3"><br> --%>
							<br /><span class="bold" style="margin-top: 10px;">보상 및 조건</span><br>
							<textarea name="reward" rows="2" width="100%" class="textarea"><%= dto_group.getReward() %></textarea><br>
							<textarea name="rewardCD" rows="2" width="100%" class="textarea"><%= dto_group.getRwCondition() %></textarea><br>
							<span class="bold" style="margin-top: 10px;">모임 소개</span><br>
							<textarea name="notice" rows="5" style="width:100%;"><%= dto_group.getNotice() %></textarea>
							<button type="submit" name="button" class="btn" id="EditGroupInfo" style="background:rgba(76, 175, 80, 0.6); float:right; margin: 15px 0; border:none">완료</button>
							<span id="GroupCancelbtn" class="btn" style="background:#ccc; float:right; margin: 15px 5px 0 0; padding: 5px 10px;">취소</span>
						</form>
		      </div>
        </div>
      </div>
      <br>
    <!-- End Left Column -->
    </div>

    <!-- Middle Column -->
    <div class="w3-col m7">
	  <!-- CHECKLIST -->
      <div id="CHECKLIST" class="w3-container w3-card w3-white w3-round w3-margin" style="margin-top:0!important;"><br>
				<div style="text-align: right; margin-bottom: 30px;">
					<h2 style="float:left; line-height:25px; font-weight:bold; color: #3a4b53;">CHECKLIST</h2>
					<a class="a-no-style" href="#group_make_my" rel="modal:open"><button type="button" style="color: #fff; background: #3a4b53; border: none; border-radius: 4px;">과제 추가</button></a>
					<%-- <button type="button" name="button" style="font-size: 13px; padding: 4px 20px; border:none; margin: 6px 10px 0 0;">과제 추가</button> --%>
					<span id="editbtn"><i class="fa fa-cog" aria-hidden="true" style="font-size:20px; color: #6c757d; cursor: pointer"></i></span>
				</div>
				<hr>
				<div class="checkWrapper">
					<%
						ArrayList<missionDTO> list = dao.MissionList(null);
						ArrayList<String> mlist = dao.MissionComplete(null);

						// System.out.print("list isze: "+mlist.get(1));
						for(int i=0 ; i<list.size() ; i++) {
							dto = list.get(i);
							// System.out.println("in jsp: "+ dto.getId() + dto.getContent()+dto.getGroupID());
					%>
					<div class="check" value="<%= i %>">
						<input type="checkbox" name="mission" value="<%= dto.getId() %>">

						<span style="padding-left: 10px;"><%= dto.getName() %></span>
						<div style="float:right;">
							<span class="showfinish"><i class="fa fa-list-alt"></i></span>
							<span class="detailbtn"><i class="fa fa-angle-down"></i></span>
						</div>
						<div class="check_finish">
							<%= mlist.get(i) %>완료
						</div>
						<div class="check_detail">
							<p><%= dto.getContent() %></p>
						</div>
					</div>

					<%
						}
					%>
				</div>


				</div>


				<!-- edit checklist -->
			  <div id="EditCheckList" class="w3-container w3-card w3-white w3-round w3-margin" style="margin-top: 0 !important;"><br>
				  <div>

							<form class="" action="missionEdit" method="post">
								<div style="text-align: right; margin-bottom: 35px;">
									<h2 style="float:left; line-height:30px; font-weight: bold; color: #3a4b53">CHECKLIST EDIT</h2>
									<span id="editcancel" class="btn" style="background:#ccc; margin-top: 15px;">취소</span>
									<input id="editfin" type="submit" class="check_edit btn" style="background:rgba(76, 175, 80, 0.6); border: none; margin-top: 13px;" name="" value="완료">
								</div>
								<hr>

								<%

									// System.out.print("list isze: "+list.size());
									for(int i=0 ; i<list.size() ; i++) {
										dto = list.get(i);
								%>


								<div class="checkEditlist">
									<input type="hidden" name="missionID"  value="<%= dto.getId() %>">
									<input type="text" name="title" value="<%= dto.getName() %>">
									<div style="float:right;">
										<span class="btn" style="background:rgba(244, 67, 54, 0.6)">삭제</span>
									</div>
									<div class="p_cont check_detail_edit">
										<textarea name="content" style="width:100%;"><%= dto.getContent() %></textarea>
									</div>
								</div>

								<%
									}
								%>

							</form>
						</div>
		      </div>
      </div>


    <!-- End Middle Column -->


	<!-- Right Column -->
	<div class="w3-col m2">
		<div class="w3-card w3-round w3-white w3-center allpeople">
			<!-- 전체 참가자 -->
			<div id="AllGroup" class="w3-container">
				<p style="font-size: 25px; font-weight: bold; color: #3a4b53; margin: 0 0 10px 0; display: inline-block; margin-bottom: 15px;">전체 진행률</p>
				<span class="member_setting"><i class="fa fa-cog" aria-hidden="true" style="font-size:20px; color: #6c757d; cursor: pointer; float: right; margin-top: 8px;"></i></span>
				<% ArrayList<progressDTO> _list = dao.getRightsideInfo(2); %>
				<%
            		if(list != null){
                    for(int i=0; i<_list.size(); i++){
                %>
                     <div class="eachcontent">
                     <div style="float:left; width:7%;">
                        <span><%= i+1 %></span>
                     </div>
                     <div style="float:left; width: 93%;">
                        <span style="float:right"><%= _list.get(i).getCompleteMission() %>/<%= _list.get(i).getAllMission() %></span>
                        <span><%= _list.get(i).getName() %></span><br>
                        <div id="progressbar_tot">
                             <div style="width: <%= _list.get(i).getCompleteMission()*1.0 / _list.get(i).getAllMission() *100 %>%;"><p class="prog_text_tot" ><%= _list.get(i).getCompleteMission()*1.0 / _list.get(i).getAllMission() *100 %>%</p></div>
                        </div>
                     </div>
                  </div>
                  <hr>
                      <%
                   }
                }
            %>
				
			</div>

			<!-- 참가자 관리 -->
			<div id="ManagePeople" class="w3-container">
				<p style="font-size: 25px; font-weight: bold; color: #3a4b53; margin: 0 0 10px 0; display: inline-block; margin-bottom: 15px;">참가자 관리</p>
				<span class="managefin"><i class="fa fa-cog" aria-hidden="true" style="font-size:20px; color: #6c757d; cursor: pointer; float: right; margin-top: 8px;"></i></span>

				<div class="eachcontent">
					<div style="float:left; width:7%;">
						<span>1</span>
					</div>
					<div style="float:left; width: 93%;">
						<span>강다니엘</span><span class="exitbtn" >강퇴</span><br>
						<div id="progressbar_tot">
						  <div style="width: 93%;"><p class="prog_text_tot" >93%</p></div>
						</div>
					</div>
				</div>
				<hr>
				<%
            		if(list != null){
                    for(int i=0; i<_list.size(); i++){
                %>
                     <div class="eachcontent">
                     <div style="float:left; width:7%;">
                        <span><%= i+1 %></span>
                     </div>
                     <div style="float:left; width: 93%;">
                        <span style="float:right"><%= _list.get(i).getCompleteMission() %>/<%= _list.get(i).getAllMission() %></span>
                        <span><%= _list.get(i).getName() %></span><br>
                        <div id="progressbar_tot">
                             <div style="width: <%= _list.get(i).getCompleteMission()*1.0 / _list.get(i).getAllMission() *100 %>%;"><p class="prog_text_tot" ><%= _list.get(i).getCompleteMission()*1.0 / _list.get(i).getAllMission() *100 %>%</p></div>
                        </div>
                     </div>
                  </div>
                  <hr>
                      <%
                   }
                }
            %>
			</div>
		</div>
		<br>

		<!-- 잔디판 -->
		<div class="w3-card w3-round w3-white w3-center">
			<div class="w3-container">
				<p>Friend Request</p>
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
	<!-- End Right Column -->
	</div>

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
