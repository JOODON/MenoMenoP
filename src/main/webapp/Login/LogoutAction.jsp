<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" contant="text/html"; charset="UTF-8">
</head>
<body>
<%
    session.invalidate();//세션을 뺏어주는 것
%>
<script>
    location.href='http://localhost:8080/MenoMeno/MainPage/MainPage.jsp'
</script>
</body>
</html>
