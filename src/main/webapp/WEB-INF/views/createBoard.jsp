<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<link rel="stylesheet" href="/css/createBoard.css">
	<script type="text/javascript" src="/js/createBoard.js"></script>
</head>

<body>
  <!-- Modal 창-->
  <div id="group_make" class="modal">
    <div id="head">
    <h1 id="title">모임생성</h1>
    <input type="radio" id="radio_make" name="make_radio" value="make" checked>
    <label for="make">모임생성</label>
    <input type="radio" id="radio_link" name="make_radio" value="link">
    <label for="link">링크로 참여</label>
   </div>

    <div id="make_div">
      <form name="make_group_form" class="form" role="form">
        <div class="left">
            <div class="name">모임 이름<span class="essential"> *</span></div>
            <input name="group_name" required/>
            <div class="name">전체 공개 여부<span class="essential"> *</span>
              <input style="margin-left: 5px; width:auto;" type="checkbox" name="public" value="public" checked/>
            </div>
            <div class="name">모임 소개<span class="essential"> *</span></div>
            <textarea name="group_intro" required></textarea>
            <div class="name">모임 공지<span class="essential"> *</span></div>
            <textarea name="group_notice" required></textarea>
            <div class="name">참가 링크<span class="essential"> *</span></div>
            <input name="group_link" required><button type="button" id="duplicate_check">중복확인</button></input>

            <div class="name">모임 기한<span class="essential"> *</span>
              <input style="margin-left: 15px; width:auto;" type="checkbox" id="deadline_check" name="deadline" value="forever" checked/>무제한
              <br>
              <div id="deadline">
                <input type="date" class="date"></input>~<input type="date" class="date" style="margin-left: 10px;"></input>
              </div>
            </div>

            <div class="name">보상(선택사항)</div>
            <textarea name="group_intro"></textarea>
            <div class="name">보상 조건(선택사항)</div>
            <textarea name="group_intro"></textarea>
        </div>

        <div class="right">
          <h3 class="title">과제 <button type="button" id="add_hw" style="float:right;">과제추가</button></h3>

            <div id="list">
              <div class="add">
                <button type="button" class="delete">X</button>
                <input id="hw_title_add" placeholder="과제 제목"></input><br>
                <textarea id="hw_content_add" placeholder="과제 설명"></textarea>
              </div>
            </div>
            <div id="element">
              <div class="add">
                <button type="button" class="delete">X</button>
                <input id="hw_title_add" placeholder="과제 제목"></input><br>
                <textarea id="hw_content_add" placeholder="과제 설명"></textarea>
              </div>
            </div>
        </div>
      </div>
      <div id="button_place">
        <a class="nostyle" href="#" rel="modal:close"><button type="button">취소하기</button></a><button type="submit">생성하기</button>
      </div>
    </form>

    <div id="link_div">
      <form name="link_group_form" class="form" role="form">
        <input name="group_link" placeholder="링크를 입력해주세요" required/>
        <button type="submit">참가하기</button>
      </form>
    </div>
  </div>

  <!-- Link to open the modal -->
  <p><a href="#group_make" rel="modal:open">Open Modal</a></p>
</body>
</html>