<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>dashboard</title>
    <link rel="stylesheet" href="/css/dashboard.css">
    <link rel="stylesheet" href="/css/createBoard.css">
    <link rel="stylesheet" href="/css/allBoard.css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    
    <script src="https://kit.fontawesome.com/ef6d04f75a.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    
    <script type="text/javascript" src="/js/allBoard.js"></script>
    <script type="text/javascript" src="/js/createBoard.js"></script>

  </head>
  <body>
    <div id = 'wrapper'>
      <div id = "main">
  		<div id = "appInfo">
  			<div id = "title">�� �� ��</div>
  			<div id = "userInfo">
  				<div id = "profile">
    				  <div id="profileImg"><img src="/images/back.jpg" id = "myImg"/></div>
              <div id="profileContent">
                <h3 id = "name">Harry Edward</h3>
                <p id = "info">0000000@handong.edu / 30</p>
                <p id = "introduce">�ڱ�Ұ��ڱ�Ұ��ڱ�Ұ�!!!</p>
                <button id = "edit">edit</button>
            </div>
  				</div>
  				<div id = "joinInfo">
  					<h3 style = "font-size: 20px; font-weight: 500;">Join Info</h3>
  					<div id = "content">
  						<div class = "joinYN">
                <div class = 'joinC'>
                  <h5>����-�м��� �ƴ� ���ڵ��� ����</h5>
                  <p>�׷� ���� ��û <b style="color:red;">����</b> ���߽��ϴ�.</p>
                </div>
                <div class = 'joinB'>
                  <button type="button" class= "jConfirm" name="jConfirm">Ȯ��</button>
                </div>
              </div>
              <div class = "joinYN">
                <div class = 'joinC'>
                  <h5>�˼����� ���� �����ؿ�~</h5>
                  <p>�׷� ���� ��û <b style="color:blue;">����</b> ���߽��ϴ�.</p>
                </div>
                <div class = 'joinB'>
                  <button type="button" class= "jConfirm" name="jConfirm">Ȯ��</button>
                </div>
              </div>
  					</div>
  				</div>
  			</div>
  		</div>
  		<div id = "boardInfo">
  			<ul class="nav nav-tabs" role="tablist" id="myTab">
  			  <li role="presentation" class="active" id="my">
            <a href="#home" aria-controls="home" role="tab" data-toggle="tab">�� ����</a>
          </li>
  			  <li role="presentation" id="all">
            <a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">��ü ����</a>
          </li>
  			</ul>

  			<div id="tab-content">
          <div id="my_content">
            <form id="mySearch" class = "form-inline search" method="get" >
              <input type="text" class="Tsearch" name="Tsearch" value="" placeholder="����, �������� �˻��ϼ���..">
              <button type="button" name="button" class = "sButton"><i class="fas fa-search"></i></button>
              <select class="category" name="category" class="form-control">
                <option value="allCategory">all category</option>
                <option value="study">study</option>
                <option value="etc">����</option>
                <option value="etc2">������</option>
              </select>
              <button type="button" name="button" id = "new" data-toggle="modal" data-target="#group_make">new</button>
            </form>
            <div class = "boardContent">
              <div class="contentLeft2">
  				  		<h4 style = "font-weight: 700;">ALGORITHM CAMP <i class="fas fa-book-open"></i> <i class="fas fa-user-cog"></i></h4>
                <p>
                  �Ϸ翡 �˰��� 5������ ���� Ǫ���� ���� �����Դϴ�!!<br>
                  ���� �����ϰ� �˰��� ������ ���� Ǯ�鼭 ���� ���� ������ �� ������ ȯ���ؿ�~
                </p>
              </div>
					  	<div class = "contentRight2">
						  ���� ������ <div class = "progressInfo">10/20</div><br>
              <progress value="10" max="20" style= "width: 100%; margin-top: 7px"></progress>
					 	 </div>
				   </div>
           <div class = "boardContent">
             <div class="contentLeft2">
               <h4 style = "font-weight: 700;">ALGORITHM CAMP <i class="fas fa-book-open"></i></h4>
               <p>
                 �Ϸ翡 �˰��� 5������ ���� Ǫ���� ���� �����Դϴ�!!<br>
                 ���� �����ϰ� �˰��� ������ ���� Ǯ�鼭 ���� ���� ������ �� ������ ȯ���ؿ�~
               </p>
             </div>
             <div class = "contentRight2">
             ���� ������ <div class = "progressInfo">10/20</div><br>
             <progress value="10" max="20" style= "width: 100%; margin-top: 7px"></progress>
            </div>
          </div>
          <div class = "boardContent">
            <div class="contentLeft2">
              <h4 style = "font-weight: 700;">ALGORITHM CAMP <i class="fas fa-book-open"></i></h4>
              <p>
                �Ϸ翡 �˰��� 5������ ���� Ǫ���� ���� �����Դϴ�!!<br>
                ���� �����ϰ� �˰��� ������ ���� Ǯ�鼭 ���� ���� ������ �� ������ ȯ���ؿ�~
              </p>
            </div>
            <div class = "contentRight2">
            ���� ������ <div class = "progressInfo">10/20</div><br>
            <progress value="10" max="20" style= "width: 100%; margin-top: 7px"></progress>
           </div>
         </div>
          </div>
          <div id="all_content" hidden>
            <form id="allSearch" class = "form-inline search" method="get" >
              <input type="text" class="Tsearch" name="Tsearch" value="" placeholder="����, �������� �˻��ϼ���..">
              <button type="button" name="button" class = "sButton"><i class="fas fa-search"></i></button>
              <select class="category" name="category" class="form-control">
                <option value="allCategory">all category</option>
                <option value="study">study</option>
                <option value="etc">����</option>
                <option value="etc2">������</option>
              </select>
            </form>
            <div class = "boardContent" data-toggle="modal" data-target="#group_join">
              <div class="contentLeft">
                <h4 style = "font-weight: 700;">ALGORITHM CAMP <i class="fas fa-book-open"></i></h4>
                <p>
                  �Ϸ翡 �˰��� 5������ ���� Ǫ���� ���� �����Դϴ�!!<br>
                  ���� �����ϰ� �˰��� ������ ���� Ǯ�鼭 ���� ���� ������ �� ������ ȯ���ؿ�~
                </p>
              </div>
              <div class = "contentRight">
                <div class="right1"><div class = "infoT">ȸ�� ��</div><div class = "infoC">5</div></div>
  						  <div class="right2"><div class = "infoT">�̼� ��</div><div class = "infoC">20</div></div>
             </div>
           </div>
          </div>
  			</div>
  		</div>
  	</div>
  </div>
	<%@ include file="/WEB-INF/views/createBoard.jsp" %>
	<%@ include file="/WEB-INF/views/allBoard.jsp" %>
	<script>
  $('#myTab > li').click(function(){
    console.log($(this).attr('id'));
    $('#my_content').hide();
    $('#all_content').hide();
    $('#tab-content > #'+$(this).attr('id')+'_content').show();
  })
	</script>
  </body>
</html>
    