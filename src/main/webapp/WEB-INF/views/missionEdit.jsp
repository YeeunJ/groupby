<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.group.by.board.myBoard.*" %>
<jsp:useBean id="dao" class="com.group.by.board.myBoard.myBoardDAO"></jsp:useBean>

!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <%
    String [] missionID = request.getParameterValues("missionID");
    String [] title = request.getParameterValues("title");
    String [] content = request.getParameterValues("content");
    // System.out.println("length: "+missionID.length + Integer.parseInt(missionID[0])+ title[0]+content[0]);
    int length = missionID.length;
    for(int i=0 ; i<length ; i++) {
      // System.out.println("length: "+missionID.length + Integer.parseInt(missionID[i])+ title[i]+content[i]);
      dao.updateMission(Integer.parseInt(missionID[i]), title[i], content[i]);
    }
    %>
    <script>
      alert("미션 정보가 수정되었습니다.");
      location.href='myBoard';
    </script>

  </body>
</html>
