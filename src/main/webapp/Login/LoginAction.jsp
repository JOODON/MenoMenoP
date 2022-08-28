<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="User.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="UserDTO" class="User.UserDTO" scope="page"/>
<%--<jsp:useBean id="자바빈즈 식별 이름" calss="자바빈즈 클래스이름" scope="범위" />--%>
<jsp:setProperty name="UserDTO" property="userID"/>
<%--<jsp:getProperty name="자바빈즈 식별이름" property="프로퍼티명" />--%>
<jsp:setProperty name="UserDTO" property="userPassword"/>
<%--HTML에서 Form데이터를 이쪽으로 보내줌 그래서 Property랑 Name이랑 똑같이 해줘야됨 Set에 들어가야되니깐!--%>
<%
    String UserID=null;

    if (session.getAttribute("UserID")!=null){
        UserID=(String) session.getAttribute("UserID");
    }
    if(UserID != null){
        PrintWriter script=response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인이 되어있습니다.')");
        script.println("location.href='http://localhost:8080/MenoMeno'");
        script.println("</script>");
    }
    UserDAO userDAO=new UserDAO();

    int result= userDAO.login(UserDTO.getUserID(),UserDTO.getUserPassword());

    if(result==1){
        session.setAttribute("UserID",UserDTO.getUserID());//로그인한 인원들에 한에서 세션을 부여함
        PrintWriter script=response.getWriter();
        script.println("<script>");
        script.println("location.href='http://localhost:8080/MenoMeno/MainPage/MainPage.jsp'");
        script.println("</script>");
    }
    else if (result==0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 틀립니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if (result==-1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('존재하지 않는 아이디입니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if (result==-2) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류가 발생했습니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
%>