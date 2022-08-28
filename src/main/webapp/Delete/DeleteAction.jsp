<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="BBS.BBSDAO" %>
<%@ page import="BBS.BBS" %>
<% request.setCharacterEncoding("UTF-8");%>

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
        script.println("location.href=maim.jsp()");
        script.println("</script>");
    }
    BBS bbs=new BBSDAO().getBBS(bbsID);
    if(!userID.equals(bbs.getUserID())){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다.')");
        script.println("location.href=maim.jsp()");
        script.println("</script>");
    } else {
        BBSDAO bbsdao = new BBSDAO();
        int result = bbsdao.delete(bbsID);
        if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('글삭제에 실패하셨습니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href='http://localhost:8080/MenoMeno/ViewPage/View.jsp'");
            script.println("</script>");
        }
    }
%>

