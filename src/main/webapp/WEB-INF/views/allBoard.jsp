<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.group.by.dto.missionDTO" %>

  <div id="group_join" class="modal">
    <h1 class="all" id="all_title">알고리즘 캠프</h1>
    <hr class="all">
    <div class="total_info_ex"><span class="bold">참가 인원</span><span id="all_num">15</span>명</div>
    <div class="total_info_ex"><span class="bold">모임 활동 기간</span><span id="all_start"></span> ~ <span id="all_end"></span></div>
    <div class="total_info_ex"><span class="bold">보상 및 조건</span><span id="all_rwc"></span> | <span id="all_rw"></span>
      <!--
      <div id="reward_info">
        - 보증금 환불<br> - 30일간 90문제
      </div>-->
    </div>
    <% ArrayList<missionDTO> mission_list = (ArrayList<missionDTO>)request.getAttribute("mission"); %>
    <p class="explan" id="all_explan">"열심히 알고리즘을 풀어봅시다. ㅎㅎ랄라랄ㄹ라"</p>
    <div class="total_info top">
      <div class="total_info_box all_left">
        <h3 class="all">공통 미션 예시</h3>
        <div style="text-align:center; font-size: 14px;">(현재 총 20개)</div>
        <div class="content">
        <% 
       		if(mission_list != null){
       			for(int i=0; i<mission_list.size(); i++){
        %>
          <div class="check_all">
            <image class="image_check" src="./images/check.png">
            <div class="content_check"><%= mission_list.get(i).getName() %></div>
          </div>
        <%
       			}
       		}
        %>
        <!--
          <div class="check_all">
            <image class="image_check" src="./images/check.png">
            <div class="content_check">DP 관련 20~30번 문제 풀기</div>
          </div>
          <div class="check_all">
            <image class="image_check" src="./images/check.png">
            <div class="content_check">피어 리뷰 5개</div>
          </div>
         -->
        </div>
      </div>
      <div class="total_info_box all_right">
        <h3 class="all">모임 활성도</h3>
        <div style="text-align:center; font-size: 13px; margin-bottom: 0px;">최근 일주일 간 미션 수행도</div>
        <div class="content" style="padding-right:10px; height: 145px;">
          <canvas id="myChart"></canvas>
        </div>
      </div>
      <!--<div class="total_info_box right">
        <h3>팀원 진도율</h3>
        <div style="text-align:center; font-size: 14px;"><br></div>
        <div class="content">
          <div class="member">
            <image class="image_member" src="./data/member.png">
            <div class="content_member">
              익명 <div class="member_progress_n">5/20</div>
              <progress value="5" max="20"></progress>
            </div>
          </div>
          <div class="member">
            <image class="image_member" src="./data/member.png">
            <div class="content_member">
              박형식 <div class="member_progress_n">8/20</div>
              <progress value="8" max="20"></progress>
            </div>
          </div>
          <div class="member">
            <image class="image_member" src="./data/member.png">
            <div class="content_member">
              박보영 <div class="member_progress_n">6/20</div>
              <progress value="6" max="20"></progress>
            </div>
          </div>
        </div>
      </div>-->
    </div>

    <div class="total_info join">
      <h3 class="all">Join Info</h3>
      <form id = "form_join" name="join_group_form" action = "/joinGroup" class="form" role="form" method="post">
      <table>
        <tr>
          <td class="ex">사용할 이름</td>
          <td class="input"><input type="text" name="name" placeholder="사용할 이름을 입력해주세요"/></td>
        </tr>
        <tr>
          <td class="ex">간단한 소개</td>
          <td class="input"><textarea name="introduce" placeholder="모임에 간단하게 자기 소개를 해주세요~:)"></textarea></td>
        </tr>
        <input id="group_id" name="group_id" style="display:none"></input>
      </table>
      <!--<input style="margin-left: 10px;" type="checkbox" name="info" value="info" checked/>
      모임에 내 정보 공개-->
    </div>

    <button type="submit" id="total_info_submit">JOIN</button>
  </form>
    <!--<a href="#" rel="modal:close">Close</a>-->
  </div>