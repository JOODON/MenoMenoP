<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="BBS.BBS" %>
<%@ page import="BBS.BBSDAO" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="View.css">

    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Rubik:wght@500&display=swap" rel="stylesheet">

    <title>글목록 페이지</title>
</head>
<body>
<%
    String userID=null;
    if (session.getAttribute("UserID")!= null){
        userID=(String) session.getAttribute("UserID");
    }
    int pageNumber=1;
    if(request.getParameter("pageNumber") != null ){
        pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
    }
%>
<div class="bodyy">
    <div>
        <h1 id="list">글목록 게시판</h1>
        <div class="listcontents">
            <table class="tablee">
                <tr class="formm">
                    <th id="num">번호</th>
                    <th id="subject">제목</th>
                    <th id="date">작성일</th>
                    <th id="view">조회수</th>
                </tr>
                <%
                    BBSDAO bbsdao=new BBSDAO();
                    ArrayList<BBS> list = bbsdao.getList(pageNumber);
                    for (int i=0; i< list.size(); i++){

                %>
                <tr>
                    <td><%= list.get(i).getBbsID()%></td>
                    <td><a href="http://localhost:8080/MenoMeno/ReadingPage/ReadingPage.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%= list.get(i).getBbsTitle().replaceAll(" ", " &nbsp").replaceAll("<", " &lt;").replaceAll("<", " &gt;").replaceAll("\n", "</br>")%></a></td>
                    <td><%= list.get(i).getBbsDate().substring(0,11)+ list.get(i).getBbsDate().substring(11,13)+"시" + list.get(i).getBbsDate().substring(14,16)+ "분" %></td>
                    <td>000</td>
                </tr>
                <%
                    }
                %>
            </table>
            <div class="go">
                <div class="gobt1">
                    <button type="submit" id="bwg"><a href="http://localhost:8080/MenoMeno/WritePage/Write.jsp">글 작성하기</a></button>
                </div>
                <div class="gobt2">
                    <button type="submit" id="bhg"><a href="http://localhost:8080/MenoMeno">홈으로 가기</a></button>
                </div>
            </div>
            <div class="gobt">
                <div class="gobt3">
                    <%
                        if (pageNumber !=1){

                    %>
                    <button><a id="bwg" href="View.jsp?pageNumber=<%= pageNumber - 1 %>"> 이전</a></button>
                </div>
                <%
                    }if (bbsdao.nextPage(pageNumber+1)){
                %>
                <div class="gobt4">
                    <button><a id="bwg" href="View.jsp?pageNumber=<%= pageNumber + 1 %>"> 다음</a></button>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>

<script>
    var text = document.querySelector('#subject1');
    text.onclick = function() {
        text.style.color = 'purple';
    }

</script>
</body>
</html>