<%@ page language="java" pageEncoding="UTF-8"%>
<div id="group_make_my" class="modal">
    <div id="make_div">
      <form name="make_group_form" action="/mymissionAdd/<%= (int)request.getAttribute("groupid") %>" class="form" role="form">
        <div class="right">
            <h3 class="title">과제 <button type="button" id="add_hw" class="btnB" style="float:right;">과제추가</button></h3>
            <div id="list">
              <div class="add">
                <button type="button" class="delete"><i class="fa fa-minus-square"></i></button>
                <input id="hw_title_add" placeholder="과제 제목" name="title"></input><br>
                <textarea id="hw_content_add" placeholder="과제 설명" name="description"></textarea>
              </div>
            </div>
            <div id="element">
              <div class="add">
                <button type="button" class="delete"><i class="fa fa-minus-square"></i></button>
                <input id="hw_title_add" placeholder="과제 제목" name="title"></input><br>
                <textarea id="hw_content_add" name="description" placeholder="과제 설명"></textarea>
              </div>
            </div>

        </div>
      </div>
      <div id="button_place">
        <a class="nostyle" href="#" rel="modal:close"><button type="button" class="btnB" style="margin-right:10px">취소</button></a><button id="missionAddBtn" type="submit" class="btnB" style="margin-right: 10px;">추가</button>
      </div>
    </form>

  </div>
