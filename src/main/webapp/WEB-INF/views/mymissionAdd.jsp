<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.group.by.board.myBoard.*" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="dao" class="com.group.by.board.myBoard.myBoardDAO"></jsp:useBean>


<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <%
    request.setCharacterEncoding("UTF-8");
    String [] name = request.getParameterValues("title");
    String [] content = request.getParameterValues("description");

// participation에서 groupID가 2인 사람을 고른다
// mission_info table에 userID인 사람들에게 complete=0으로 추가한다.
// SELECT userID FROM participation WHERE groupID = 2;
// SELECT missionID FROM mission order by missionID desc limit 1;  --> missionID
// INSERT INTO mission_info(missionID, userID, complete, regDate, group_info)
// VALUES (SELECT missionID FROM mission order by missionID desc limit 1, USER_ID, 0, null, 2)

    Date start = null;
    Date end = null;
    System.out.println("length: "+name.length);
    System.out.println("1: "+name[1]);

    for(int i=0 ; i<name.length-1; i++) {
      System.out.println(name[i] + " / "+ content[i]);
      int cnt = dao.missionAdd(name[i], content[i], start, end);
      // int result = dao.shootMission();
      if(cnt==0) {
        out.println("<p> 성적 입력을 실패했습니다.</p>");
      }
    }

    %>
  </body>
  <script>
    alert("과제가 추가되었습니다.");
    location.href='myBoard';
  </script>
</html>
