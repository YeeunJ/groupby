<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>dashboard</title>
    <link rel="stylesheet" href="/css/dashboard.css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    
    <script src="https://kit.fontawesome.com/ef6d04f75a.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    
    <script type="text/javascript" src="/js/allBoard.js"></script>
    <script type="text/javascript" src="/js/createBoard.js?d"></script>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/createBoard.css">
    <link rel="stylesheet" href="/css/allBoard.css">

  </head>
  <body>
    <div id = 'wrapper'>
      <div id = "main">
  		<div id = "appInfo">
  			<div id = "title">투 게 더</div>
  				<%@ include file="/WEB-INF/views/createBoard.jsp" %>
	            <%@ include file="/WEB-INF/views/allBoard.jsp" %>
  			<div id = "userInfo">
  				<div id = "profile">
    				  <div id="profileImg"><img src="/images/back.jpg" id = "myImg"/></div>
              <div id="profileContent">
                <h3 id = "name">Harry Edward</h3>
                <p id = "info">0000000@handong.edu / 30</p>
                <p id = "introduce">자기소개자기소개자기소개!!!</p>
                <button id = "edit">edit</button>
            </div>
  				</div>
  				<div id = "joinInfo">
  					<h3 style = "font-size: 20px; font-weight: 500;">Join Info</h3>
  					<div id = "content">
  						<div class = "joinYN">
                <div class = 'joinC'>
                  <h5>패피-패션좀 아는 남자들의 모임</h5>
                  <p>그룹 참여 요청 <b style="color:red;">거절</b> 당했습니다.</p>
                </div>
                <div class = 'joinB'>
                  <button type="button" class= "jConfirm" name="jConfirm">확인</button>
                </div>
              </div>
              <div class = "joinYN">
                <div class = 'joinC'>
                  <h5>팝송으로 영어 공부해요~</h5>
                  <p>그룹 참여 요청 <b style="color:blue;">수락</b> 당했습니다.</p>
                </div>
                <div class = 'joinB'>
                  <button type="button" class= "jConfirm" name="jConfirm">확인</button>
                </div>
              </div>
  					</div>
  				</div>
  			</div>
  		</div>
  		<div id = "boardInfo">
  			<ul class="nav nav-tabs" role="tablist" id="myTab">
  			  <li role="presentation" class="active" id="my">
            <a href="#home" aria-controls="home" role="tab" data-toggle="tab">내 모임</a>
          </li>
  			  <li role="presentation" id="all">
            <a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">전체 모임</a>
          </li>
  			</ul>

  			<div id="tab-content">
          <div id="my_content">
            <form id="mySearch" class = "form-inline search" method="get" >
              <input type="text" class="Tsearch" name="Tsearch" value="" placeholder="제목, 내용으로 검색하세요..">
              <button type="button" name="button" class = "sButton"><i class="fas fa-search"></i></button>
              <select class="category" name="category" class="form-control">
                <option value="allCategory">all category</option>
                <option value="study">study</option>
                <option value="etc">뭐가</option>
                <option value="etc2">있을까</option>
              </select>
              <a href="#group_make" rel="modal:open"><button type="button" name="button" id = "new">new</button></a>
            </form>
            <div class = "boardContent">
              <div class="contentLeft2">
  				  		<h4 style = "font-weight: 700;">ALGORITHM CAMP <i class="fas fa-book-open"></i> <i class="fas fa-user-cog"></i></h4>
                <p>
                  하루에 알고리즘 5문제씩 같이 푸려고 만든 모임입니다!!<br>
                  같이 성실하게 알고리즘 문제를 같이 풀면서 나눌 생각 있으신 분 누구나 환영해요~
                </p>
              </div>
					  	<div class = "contentRight2">
						  나의 진도율 <div class = "progressInfo">10/20</div><br>
              <progress value="10" max="20" style= "width: 100%; margin-top: 7px"></progress>
					 	 </div>
				   </div>
           <div class = "boardContent">
             <div class="contentLeft2">
               <h4 style = "font-weight: 700;">ALGORITHM CAMP <i class="fas fa-book-open"></i></h4>
               <p>
                 하루에 알고리즘 5문제씩 같이 푸려고 만든 모임입니다!!<br>
                 같이 성실하게 알고리즘 문제를 같이 풀면서 나눌 생각 있으신 분 누구나 환영해요~
               </p>
             </div>
             <div class = "contentRight2">
             나의 진도율 <div class = "progressInfo">10/20</div><br>
             <progress value="10" max="20" style= "width: 100%; margin-top: 7px"></progress>
            </div>
          </div>
          <div class = "boardContent">
            <div class="contentLeft2">
              <h4 style = "font-weight: 700;">ALGORITHM CAMP <i class="fas fa-book-open"></i></h4>
              <p>
                하루에 알고리즘 5문제씩 같이 푸려고 만든 모임입니다!!<br>
                같이 성실하게 알고리즘 문제를 같이 풀면서 나눌 생각 있으신 분 누구나 환영해요~
              </p>
            </div>
            <div class = "contentRight2">
            나의 진도율 <div class = "progressInfo">10/20</div><br>
            <progress value="10" max="20" style= "width: 100%; margin-top: 7px"></progress>
           </div>
         </div>
          </div>
          <div id="all_content" hidden>
            <form id="allSearch" class = "form-inline search" method="get" >
              <input type="text" class="Tsearch" name="Tsearch" value="" placeholder="제목, 내용으로 검색하세요..">
              <button type="button" name="button" class = "sButton"><i class="fas fa-search"></i></button>
              <select class="category" name="category" class="form-control">
                <option value="allCategory">all category</option>
                <option value="study">study</option>
                <option value="etc">뭐가</option>
                <option value="etc2">있을까</option>
              </select>
            </form>
            <a href="#group_join" rel="modal:open" class="nostyle"> <div class = "boardContent">
            <!-- data-toggle="modal" data-target="#group_join" -->
              <div class="contentLeft">
                <h4 style = "font-weight: 700;">ALGORITHM CAMP <i class="fas fa-book-open"></i></h4>
                <p>
                  하루에 알고리즘 5문제씩 같이 푸려고 만든 모임입니다!!<br>
                  같이 성실하게 알고리즘 문제를 같이 풀면서 나눌 생각 있으신 분 누구나 환영해요~
                </p>
              </div>
              <div class = "contentRight">
                <div class="right1"><div class = "infoT">회원 수</div><div class = "infoC">5</div></div>
  						  <div class="right2"><div class = "infoT">미션 수</div><div class = "infoC">20</div></div>
             </div>
           </div></a>
          </div>
  			</div>
  		</div>
  	</div>
  </div>
	<script>
  $('#myTab > li').click(function(){
    $('#my').attr('class', '');
    $('#all').attr('class', '');
    $(this).attr('class', 'active');
    $('#my_content').hide();
    $('#all_content').hide();
    $('#tab-content > #'+$(this).attr('id')+'_content').show();
  })
	</script>
  </body>
</html>