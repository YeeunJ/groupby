<%@ page language="java" pageEncoding="UTF-8"%>
<div id="group_make" class="modal" stlye="box-shadow: 0 0 10px rgba(68, 85, 93, 0.8) !important;">
    <div id="head">
    <h1 id="title_create">모임생성</h1>
    <input type="radio" id="radio_make" name="make_radio" value="make" checked>
    <label for="make">모임생성</label>
    <input type="radio" id="radio_link" name="make_radio" value="link">
    <label for="link">링크로 참여</label>
   </div>

    <div id="make_div">
      <form id = "form1" name="make_group_form" action = "/createGroup" class="form" role="form" method="post">
        <div class="left">
            <div class="name" style="display: inline-block;"><p class="labelname">모임 이름<span class="essential"> *</span></p></div>
            <input name="name" required/>
            <div class="name"><p class="labelname">전체 공개 여부</p>
              <input style="margin-left: 5px; width:auto;" type="checkbox" name="visible" checked="checked"/>
            </div>
            <div class="name" style="margin-top: 0px;"><p class="labelname">팀원 과제 추가 가능</p>
              <input style="margin-left: 5px; width:auto;" type="checkbox" name="createYN" checked="checked"/>
            </div>
            <div style="overflow:hidden; margin-top:-12px;">
              <div class="name"><p class="labelname" style="margin-bottom: 0; float:left;">모임 소개<span class="essential"> *</span></p></div>
              <textarea style="float:left;" name="introduce" required></textarea>
            </div>
            <div style="overflow:hidden; margin-bottom:12px;">
              <div class="name"><p class="labelname" style="float:left; margin-bottom: 0;">모임 공지<span class="essential"> *</span></p></div>
              <textarea style="float:left;" name="notice" required></textarea>
            </div>

            <div class="name" style="display: inline-block; position: relative;"><p class="labelname">참가 링크<span class="essential"> *</span></p><button type="button" class="btnB" id="duplicate_check" style="position: absolute; top:-2px; left:360px; font-weight: initial">중복확인</button></div>
            <input name="link" id = "duplicateLink" required></input>
			<input id="duplicate" hidden></input>
            <div class="name"><p class="labelname" style="margin-bottom: 0;">모임 기한<span class="essential"> *</span></p>
              <input style=" width:auto;" type="checkbox" id="deadline_check" name="deadline" checked="checked" />무제한
              <br>
              <div id="deadline">
                <input type="date" name="startDate" class="date"></input>~<input type="date" name="endDate" class="date" style="margin-left: 10px;"></input>
              </div>
            </div>

            <div style="overflow:hidden; margin-top:12px 0;">
              <div class="name" style="float:left; margin:0;"><p class="labelname" style="margin-bottom: 0;">보상(선택사항)</p></div>
              <textarea style="float:left" name="reward"></textarea>
            </div>
            <div style="overflow:hidden; margin-bottom:12px;">
              <div class="name" style="float:left; margin:0;" ><p class="labelname" style="margin-bottom: 0;">보상 조건(선택사항)</p></div>
              <textarea style="float:left" name="rwCondition"></textarea>
            </div>



        </div>

        <div class="right">
            <h3 class="title">과제 <button type="button" id="add_hw" class="btnB" style="float:right;">과제추가</button></h3>
            <div id="list">
              <div class="add">
                <button type="button" class="delete"><i class="fa fa-minus-square"></i></button>
                <input id="hw_title_add" name="title" placeholder="과제 제목"></input><br>
                <textarea id="hw_content_add" name="description" placeholder="과제 설명"></textarea>
              </div>
            </div>
            <div id="element">
              <div class="add">
                <button type="button" class="delete"><i class="fa fa-minus-square"></i></button>
                <input id="hw_title_add" name="title" placeholder="과제 제목"></input><br>
                <textarea id="hw_content_add" name="description" placeholder="과제 설명"></textarea>
              </div>
            </div>
        </div>
      </div>
      <div id="button_place">
        <a class="nostyle" href="#" rel="modal:close"><button type="button" class="btnB">취소하기</button></a><button type="submit" class="btnB">생성하기</button>
      </div>
    </form>

    <div id="link_div">
      <form name="link_group_form"action = "/createGroup" method="post" class="form" role="form">
        <input name="link" placeholder="링크를 입력해주세요" required/>
        <button type="submit" class="btnB">참가하기</button>
      </form>
    </div>
  </div>
