<%--
  Created by IntelliJ IDEA.
  User: launc
  Date: 2022-08-23
  Time: 오전 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Write.css">

    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Rubik:wght@500&display=swap" rel="stylesheet">

    <title>글쓰기 페이지</title>
</head>
<body>
<div class="body">
    <div id="writee">
        <h1 id="space">글쓰기 양식</h1>

        <div id="writeee">
            <form action="WriteAction.jsp" method="post">
            <div id="title">
                <textarea name="bbsTitle" id="titlee" rows="1" cols="55" placeholder="제목을 입력하세요(최대 100자)" maxlength="100" required style="overflow:hidden"></textarea>
            </div>

            <div id="contents">
                <textarea name="bbsContent" id="contentss" placeholder="내용을 입력하세요" required></textarea>
            </div>

            <div class="filebox">
                <input class="upload-name" value="파일선택" disabled="disabled">
                <label for="ex_filename">업로드</label>
                <input type="file" id="ex_filename" class="upload-hidden">
            </div>

            <div class="write">
                <button type="submit" id="bw">글작성</button>
            </div>
            </form>
        </div>
    </div>
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
