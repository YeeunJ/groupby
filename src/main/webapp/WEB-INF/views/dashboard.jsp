<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.group.by.dto.progressDTO" %>
<%@ page import = "com.group.by.dto.groupinfoDTO" %>
<!DOCTYPE html>
<html>
<title>TOGETHER</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='/css/index.css?qwe'>
<link rel="stylesheet" href="/css/createBoard.css?asd">
<link rel="stylesheet" href="/css/allBoard.css?asdfgh">

<!-- heeju -->
<% int selected = 0;%>
<% ArrayList<groupinfoDTO> all_list = (ArrayList<groupinfoDTO>)request.getAttribute("allgroup"); %>
<%@ include file="/WEB-INF/views/createBoard.jsp" %>
<%@ include file="/WEB-INF/views/allBoard.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script type="text/javascript" src="/js/allBoard.js"></script>
<script type="text/javascript" src="/js/createBoard.js?d"></script>


<style>
  html,
  body,
  h1,
  h2,
  h3,
  h4,
  h5 {
    font-family: "Open Sans", sans-serif
  }
</style>

<body class="w3-theme-l5">
  <% ArrayList<progressDTO> list = (ArrayList<progressDTO>)request.getAttribute("progress"); %>
  <!-- Navbar -->
  <div class="w3-top">
    <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
      <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
      <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>TOGETHER</a>
      <div class="w3-dropdown-hover w3-hide-small">
        <button class="w3-button w3-padding-large" title="Notifications"><i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">3</span></button>
        <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
          <a href="#" class="w3-bar-item w3-button">One new friend request</a>
          <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
          <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
        </div>
      </div>
      <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account">Logout</a>
    </div>
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
    <a href="#" class="w3-bar-item w3-button w3-padding-large">My Boards</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">All Boards</a>
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
            <p class="w3-center"><img src="https://cdn.imweb.me/upload/S202002259d2c4f16c33cd/92b04bb4b9172.jpg" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
            <hr>
            <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> Harry Edward</p>
            <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> 0000000@handong.edu / 30</p>
            <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> 안녕하세요!!ㅎㅎ 자기소개자기소개!!</p>
          </div>
        </div>
        <br>

        <!-- Accordion -->
        <div class="w3-card w3-round">
          <div class="w3-white">
            <button class="w3-button w3-block w3-theme-l1 w3-left-align" onclick="myBoard()"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Boards</button>
            <button class="w3-button w3-block w3-theme-l1 w3-left-align" onclick="allBoard()"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> All Boards</button>
          </div>
        </div>
        <br>

        <!-- Interests -->
        <%-- <div class="w3-card w3-round w3-white w3-hide-small">
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
        </div> --%>
        <!-- End Left Column -->
      </div>

      <!-- Middle Column -->
      <div class="w3-col m7">
        <div class="w3-row-padding">
          <div class="w3-col m12">
            <div class="w3-card w3-round w3-white">
              <div id="myBoard" class="w3-container w3-padding" style="padding-top:0!important;height: 800px; overflow: auto;"><br>
                <div style="text-align: right; margin-bottom: 30px;">
                  <h2 style="float:left; line-height:25px; font-weight:bold; color: #3a4b53; font-family: 'Do Hyeon', sans-serif;">MY BOARDS</h2>
                </div><br>
                <hr class="w3-clear" style="margin: 5px 0 0 0;">
                <form id="mySearch" class="form-inline search" method="get">
                  <input type="text" class="Tsearch" name="Tsearch" value="" placeholder="제목, 내용으로 검색하세요..">
                  <button type="button" name="button" class="sButton"><i class="fa fa-search fa-fw "></i></button>
                  <select class="category" name="category" class="form-control">
                    <option value="allCategory">all category</option>
                    <option value="study">study</option>
                    <option value="etc">뭐가</option>
                    <option value="etc2">있을까</option>
                  </select>
                  <a class="a-no-style" href="#group_make" rel="modal:open"><button type="button" style="float: right; color: #fff; background: #3a4b53; border: none; border-radius: 4px; float:right; height: 34px;">new</button></a>
                </form>
                <%
                if(list != null){
                	for(int i=0; i<list.size(); i++){
                		%>
                <div class="check" onclick="location.href='./myBoard/<%= list.get(i).getId()%>'">
                  <div class="contentLeft2">
                    <h4 style="font-size: 22px; font-weight: 700; font-family: 'Do Hyeon', sans-serif;"> <%= list.get(i).getName() %> <i class="fa fa-book"></i> <i class="fa fa-cogs"></i></h4>
                    <div id="progressbar_tot">

                      <div style="width: <%= list.get(i).getCompleteMission()*1.0 / list.get(i).getAllMission() *100 %>%;">
                      <% if(list.get(i).getCompleteMission()*1.0 / list.get(i).getAllMission() > 0) {%>
                        <p class="prog_text_tot"><%= list.get(i).getCompleteMission()*1.0 / list.get(i).getAllMission() *100 %>% (<%= list.get(i).getCompleteMission() %>/<%= list.get(i).getAllMission() %>)</p>
                      <%}else{ %>
                      <p class="prog_text_tot">0</p>
                      <%} %>
                      </div>
                    </div>
                  </div>
                  <div class="contentRight2">
                    2020/08/20 13:29:37
                  </div>
                </div>

                <%
                	}
                }
                %>
              </div>
                <div id="allBoard" class="w3-container w3-padding" style="padding-top:0!important;height: 800px; overflow: auto;"><br>
                  <div style="text-align: right; margin-bottom: 30px;">
                    <h2 style="float:left; line-height:25px; font-weight:bold; color: #3a4b53; font-family: 'Do Hyeon', sans-serif;">ALL BOARDS</h2>
                  </div><br>
                  <hr class="w3-clear" style="margin: 5px 0 0 0;">
                  <form id="mySearch" class="form-inline search" method="get">
                    <input type="text" class="Tsearch" name="Tsearch" value="" placeholder="제목, 내용으로 검색하세요..">
                    <button type="button" name="button" class="sButton"><i class="fa fa-search fa-fw "></i></button>
                    <select class="category" name="category" class="form-control">
                      <option value="allCategory">all category</option>
                      <option value="study">study</option>
                      <option value="etc">뭐가</option>
                      <option value="etc2">있을까</option>
                    </select>
                  </form>
                   <%
                  	System.out.println("hello?");
                  	System.out.println(all_list);
                	if(all_list != null){
                	for(int i=0; i<all_list.size(); i++){
                		%>
                  <a class="a-no-style" href="#group_join" rel="modal:open">
                    <div class="check" onclick="changeSpecific(this)">
                      <div class="contentLeft2">
                        <h4 style="font-weight: 700; font-size: 22px; font-family: 'Do Hyeon', sans-serif;"><%= all_list.get(i).getName() %> <i class="fa fa-book"></i> <i class="fa fa-cogs"></i></h4>
                      </div>
                      <div class="contentRight">
                        <%= all_list.get(i).getRegDate() %>
                      </div>
                      <p style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"><%= all_list.get(i).getIntroduce() %></p>
                      <div style="width:0; height:0; font-size:0px;">
                    	<div><%= all_list.get(i).getName() %></div>
                    	<div>15</div>
                    	<div><%= all_list.get(i).getStartDate() %></div>
                    	<div><%= all_list.get(i).getEndDate() %></div>
                    	<div><%= all_list.get(i).getRwCondition() %></div>
                    	<div><%= all_list.get(i).getReward() %></div>
                    	<div><%= all_list.get(i).getIntroduce() %></div>
                    </div>
                    </div>
                  </a>
                    <%
                			}
                		}
                	%>
                </div>
              </div>
            </div>
          </div>
        </div>
          <!-- Right Column -->
          <div class="w3-col m2">
            <div class="w3-card w3-round w3-white w3-center">
              <div class="w3-container">
                <p>여기에 달력 넣을 예정!!:</p>
                <img src="/w3images/forest.jpg" alt="Forest" style="width:100%;">
                <p><strong>Holiday</strong></p>
                <p>Friday 15:00</p>
                <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
              </div>
            </div>
            <br>
          </div>
            <!-- End Right Column -->

          <!-- End Grid -->

        <!-- End Page Container -->
      </div>
      <br>
    </div>
    <!-- Footer -->
    <footer class="w3-container w3-theme-d3 w3-padding-16">
    </footer>

    <script>
      // Used to toggle the menu on smaller screens when clicking on the menu button
      function openNav() {
        var x = document.getElementById("navDemo");
        if (x.className.indexOf("w3-show") == -1) {
          x.className += " w3-show";
        } else {
          x.className = x.className.replace(" w3-show", "");
        }
      }

      function myBoard() {
        document.getElementById("myBoard").style.display = "block";
        document.getElementById("allBoard").style.display = "none";
      }

      function allBoard() {
        document.getElementById("myBoard").style.display = "none";
        document.getElementById("allBoard").style.display = "block";
      }

      function changeSpecific(obj){
    	  var title= obj.children[3].children[0].innerHTML;
    	  var num= obj.children[3].children[1].innerHTML;
    	  var start=obj.children[3].children[2].innerHTML;
    	  var end =obj.children[3].children[3].innerHTML;
    	  var rwc = obj.children[3].children[4].innerHTML;
    	  var rw = obj.children[3].children[5].innerHTML;
    	  var explan = obj.children[3].children[6].innerHTML;
    	  if(title == "null") title="없음";
    	  if(num == "null") num="0";
    	  if(start == "null") start = "없음";
    	  if(end == "null") end = "없음";
    	  if(rwc == "null") rwc = "없음";
    	  if(rw == "null") rw = "없음";
    	  if(explan == "null") explan = "없음";
    	  document.getElementById('all_title').innerHTML= title;
    	  document.getElementById('all_num').innerHTML= num;
    	  document.getElementById('all_start').innerHTML= start;
    	  document.getElementById('all_end').innerHTML= end;
    	  document.getElementById('all_rwc').innerHTML= rwc;
    	  document.getElementById('all_rw').innerHTML = rw;
    	  document.getElementById('all_explan').innerHTML="\" "+explan+" \"";
      }
    </script>

</body>

</html>
