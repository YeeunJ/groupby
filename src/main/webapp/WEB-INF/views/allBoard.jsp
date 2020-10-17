<%@ page language="java" pageEncoding="UTF-8"%>

  <div id="group_join" class="modal">
    <h1 class="all" id="all_title"><%= all_list.get(selected).getName() %></h1>
    <hr class="all">
    <div class="total_info_ex"><span class="bold">참가 인원</span>15명</div>
    <div class="total_info_ex"><span class="bold">모임 활동 기간</span><%= all_list.get(selected).getStartDate() %> ~ <%= all_list.get(selected).getEndDate() %></div>
    <div class="total_info_ex"><span class="bold">보상 및 조건</span><%= all_list.get(selected).getReward() %> | <%= all_list.get(selected).getRwCondition() %>
      <!--
      <div id="reward_info">
        - 보증금 환불<br> - 30일간 90문제
      </div>-->
    </div>
    <p class="explan"><%= all_list.get(selected).getIntroduce() %></p>
    <div class="total_info top">
      <div class="total_info_box left">
        <h3 class="all">공통 미션 예시</h3>
        <div style="text-align:center; font-size: 14px;">(현재 총 20개)</div>
        <div class="content">
          <div class="check_all">
            <image class="image_check" src="./images/check.png">
            <div class="content_check">array 관련 20~30번 문제 풀기</div>
          </div>
          <div class="check_all">
            <image class="image_check" src="./images/check.png">
            <div class="content_check">DP 관련 20~30번 문제 풀기</div>
          </div>
          <div class="check_all">
            <image class="image_check" src="./images/check.png">
            <div class="content_check">피어 리뷰 5개</div>
          </div>
        </div>
      </div>
      <div class="total_info_box right">
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
      <form>
      <table>
        <tr>
          <td class="ex">사용할 이름</td>
          <td class="input"><input type="text" placeholder="사용할 이름을 입력해주세요"/></td>
        </tr>
        <tr>
          <td class="ex">간단한 소개</td>
          <td class="input"><textarea placeholder="모임에 간단하게 자기 소개를 해주세요~:)"></textarea></td>
        </tr>
      </table>
      <!--<input style="margin-left: 10px;" type="checkbox" name="info" value="info" checked/>
      모임에 내 정보 공개-->
    </div>

    <button type="submit" id="total_info_submit">JOIN</button>
  </form>
    <!--<a href="#" rel="modal:close">Close</a>-->
  </div>