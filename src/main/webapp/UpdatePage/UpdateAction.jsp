<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="BBS.BBSDAO" %>
<%@ page import="BBS.BBS" %>
<% request.setCharacterEncoding("UTF-8");%>


<html>
<head>
  <title>글 수정</title>
</head>
<body>
<%
  String userID=null;
  if (session.getAttribute("UserID")!=null){
    userID=(String) session.getAttribute("UserID");
  }

  if(userID == null){
    PrintWriter script=response.getWriter();
    script.println("<script>");
    script.println("alert('로그인을 하세요')");
    script.println("location.href='login.jsp'");
    script.println("</script>");
  }
  int bbsID=0;

  if (request.getParameter("bbsID") != null) {
    bbsID= Integer.parseInt(request.getParameter("bbsID"));
  }
  if(bbsID==0){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('유효하지 않은 글 입니다.')");
    script.println("location.href=View.jsp()");
    script.println("</script>");
  }
  BBS bbs=new BBSDAO().getBBS(bbsID);
  if(!userID.equals(bbs.getUserID())){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('권한이 없습니다.')");
    script.println("location.href=View.jsp()");
    script.println("</script>");
  } else {
    if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
            || request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('입력하지 않으신 부분이 있습니다')");
      script.println("history.back()");
      script.println("</script>");
    } else {
      BBSDAO bbsdao = new BBSDAO();
      int result = bbsdao.update(bbsID,request.getParameter("bbsTitle"),request.getParameter("bbsContent"));

      if (result == -1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('글수정에 실패하셨습니다.')");
        script.println("history.back()");
        script.println("</script>");
      } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href='http://localhost:8080/MenoMeno/ViewPage/View.jsp'");
        script.println("</script>");
      }
    }
  }
%>

