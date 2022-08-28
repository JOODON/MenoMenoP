<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="User.UserDAO" %>
<%@ page import="User.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>

<%
    request.setCharacterEncoding("UTF-8");
    String UserName=null;
    String UserGender=null;
    String UserID=null;
    String UserPassword=null;
    String UserEmail=null;
    String UserPhoneNumber=null;

    if (request.getParameter("UserName") != null) {
        UserName=(String) request.getParameter("UserName");
    }
    if (request.getParameter("UserGender") != null) {
        UserGender=(String) request.getParameter("UserGender");
    }
    if (request.getParameter("UserID") != null) {
        UserID=(String) request.getParameter("UserID");
    }
    if (request.getParameter("UserPassword") != null) {
        UserPassword=(String) request.getParameter("UserPassword");
    }
    if (request.getParameter("UserEmail") != null) {
        UserEmail=(String) request.getParameter("UserEmail")+"@"+(String) request.getParameter("UserEmail2");
    }
    if (request.getParameter("UserPhoneNumber") != null) {
        UserPhoneNumber=(String) request.getParameter("UserPhoneNumber")+"-"+(String) request.getParameter("UserPhoneNumber2")+"-"+(String) request.getParameter("UserPhoneNumber3");
    }
    if(UserID.equals("")|| UserPassword.equals("")){
        PrintWriter script=response.getWriter();
        script.println("<script>");
        script.println("alert('입력 안된 사항이 있습니다!')");
        script.println("location.href='history.back()'");
        script.println("</script>");
        script.close();
        return;
    }
    UserDTO userDTO =new UserDTO(UserName,UserGender,UserID,UserPassword,UserEmail,UserPhoneNumber);
    UserDAO userDao=new UserDAO();
    int insertCount= userDao.addUser(userDTO);

    if(insertCount==1){
        PrintWriter script=response.getWriter();
        script.println("<script>");
        script.println("alert('회원가입에 성공했습니다')");
        script.println("location.href='http://localhost:8080/MenoMeno/Login/login.jsp'");
        script.println("</script>");
        script.close();
        return;
    }
%>