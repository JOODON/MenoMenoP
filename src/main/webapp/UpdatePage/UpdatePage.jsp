<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="BBS.BBS" %>
<%@ page import="BBS.BBSDAO" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="UpdatePage.css">

    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Rubik:wght@500&display=swap" rel="stylesheet">

    <title>글쓰기 페이지</title>
</head>
<body>
<%
    String userID=null;

    if(session.getAttribute("UserID") != null ){
        userID=(String) session.getAttribute("UserID");
    }

    if (userID==null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을하세요.')");
        script.println("location.href=login.jsp()");
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
    }
%>

<div class="body">
<form action="UpdateAction.jsp?bbsID=<%=bbsID%>" method="post">
    <div id="writee">
        <h1 id="space">글수정 양식</h1>

        <div id="writeee">
            <div id="title">
                <textarea id="titlee" name="bbsTitle" rows="1" cols="55" placeholder="제목을 입력하세요(최대 100자)" maxlength="100" required style="overflow:hidden"><%= bbs.getBbsTitle()%></textarea>
            </div>

            <div id="contents">
                <textarea id="contentss" name="bbsContent" placeholder="내용을 입력하세요" required><%= bbs.getBbsContent()%></textarea>
            </div>

            <div class="filebox">
                <input class="upload-name" value="파일선택" disabled="disabled">
                <label for="ex_filename">업로드</label>
                <input type="file" id="ex_filename" class="upload-hidden">
            </div>

            <div class="write">
                <button type="submit" id="bw">글 수정
                </button>
            </div>
        </div>
    </div>
</form>
</div>
<script>
    $(document).ready(function(){
        var fileTarget = $('.filebox .upload-hidden');

        fileTarget.on('change', function(){
            if(window.FileReader){
                var filename = $(this)[0].files[0].name;
            } else {
                var filename = $(this).val().split('/').pop().split('\\').pop();
            }

            $(this).siblings('.upload-name').val(filename);
        });
    });
</script>
</body>

</html>