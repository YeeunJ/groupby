<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.group.by.board.myBoard.*" %>
<jsp:useBean id="dao" class="com.group.by.board.myBoard.myBoardDAO"></jsp:useBean>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>

    <%

    String title = request.getParameter("title");
		// Date startdate = request.getParameter("startdate");
		// Date enddate = request.getParameter("enddate");

    String reward = request.getParameter("reward");
		String rewardCD = request.getParameter("rewardCD");
		String notice = request.getParameter("notice");
    int result = dao.updateGroup(title, null, null, reward, rewardCD, notice);
    %>
    <script>
      alert("그룹 정보가 수정되었습니다.");
      location.href='myBoard';
    </script>

  </body>
</html>
