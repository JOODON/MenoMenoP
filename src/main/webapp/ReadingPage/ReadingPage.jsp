<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="BBS.BBS" %>
<%@ page import="BBS.BBSDAO" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="ReadingPage.css">

    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Rubik:wght@500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <title>게시물 페이지</title>
</head>
<body>
<%
    String userID=null;

    if(session.getAttribute("UserID") != null ){
        userID=(String) session.getAttribute("UserID");
    }
    int bbsID=0;
    if (request.getParameter("bbsID") != null) {
        bbsID= Integer.parseInt(request.getParameter("bbsID"));
    }
    if(bbsID == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글 입니다.')");
        script.println("location.href=maim.jsp()");
        script.println("</script>");
    }
    BBS bbs = new BBSDAO().getBBS(bbsID);
%>
<section class="container">
    <h1 class="posting_title"><%=bbs.getBbsTitle().replaceAll(" ", " &nbsp").replaceAll("<", " &lt;").replaceAll("<", " &gt;").replaceAll("\n", "</br>") %></h1>

    <section class="con">
        <section class="info">
            <div class="profile">
                <img class="profile_img" src="img.png" alt="">
            </div>

            <div class="profile_info">
                <strong id="pro_name">
                    <span><%=bbs.getUserID()%></span>
                </strong>

                <span id="hits">
                        <span class="material-symbols-outlined">visibility</span><span>0</span>
                    </span>

                <span id="date">
                        <span><span class="material-symbols-outlined">schedule</span><%=bbs.getBbsDate().substring(0,11)+bbs.getBbsDate().substring(11,13)+"시" + bbs.getBbsDate().substring(14,16)+ "분"%></span>
                    </span>
            </div>
        </section>

        <span id="corre_delete">
             <%
                 if( userID !=null && userID.equals(bbs.getUserID())){
             %>
                <a id="corre" name="corre" href="http://localhost:8080/MenoMeno/UpdatePage/UpdatePage.jsp?bbsID=<%= bbsID %>"> 수정 </a>
                <a id="delete" name="delete" onclick="return confirm(`정말로 삭제하시겠습니까?`)" href="http://localhost:8080/MenoMeno/Delete\DeleteAction.jsp?bbsID=<%= bbsID %>"> 삭제</a>
                </span>
        <%
            }
        %>
    </section>

    <section class="text">
        <div id="text"><%=bbs.getBbsContent().replaceAll(" ", " &nbsp").replaceAll("<", " &lt;").replaceAll("<", " &gt;").replaceAll("\n", "</br>")%></div>
    </section>

    <section class="comments">
        <div class="comments_icon">
            <strong id="com"><span class="material-symbols-outlined">sms</span>댓글</strong>
        </div>

        <!--            댓글 양식-->
        <section class="reply">
            <div class="profile">
                <img class="profile_img" src="img.png" alt="">
            </div>

            <div class="reply_info">
                <strong id="reply_name">
                    <span>작성자 이름</span>
                </strong>
                <span id="time">
                    <span>2022-08-20 22:11</span>
                    </span>
                <span id="content">댓글 남깁니다</span>
            </div>
        </section>
    </section>

    <button type="button" id="reply_but" onclick="location.href='../SWS/newcomment.html'">댓글작성하러 가기</button>

    <section class="list">
        <ul class="previous">
            <li class="li1">
                <span class="material-symbols-outlined">expand_less</span>이전글
            </li>
            <li>
                <a href="" id="pre">이전 게시물 제목</a>
            </li>
        </ul>

        <ul class="previous">
            <li class="li1">
                <span class="material-symbols-outlined">expand_more</span>다음글
            </li>
            <li>
                <a href="" id="next">다음 게시물 제목</a>
            </li>
        </ul>
    </section>
</section>

</body>
</html>
