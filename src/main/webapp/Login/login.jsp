<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="login.css">

    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Rubik:wght@500&display=swap" rel="stylesheet">

    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

    <title>로그인 페이지</title>
</head>
<body>
<section class="login-form">
    <h1>Meno Login</h1>
    <form action="LoginAction.jsp" method="post">
        <div class="int-area">
            <input type="text" name="userID" id="id" autocapitalize="off" required title="아이디를 입력하세요.">
            <label for="id" id="user-name">ID</label>
        </div>

        <div class="int-area">
            <input type="password" name="userPassword" id="pw" autocapitalize="off" required title="비밀번호를 입력하세요.">
            <label for="pw" id="password">PASSWORD</label>
        </div>

        <div class="btn-area">
            <button type="submit" id="btu">LOGIN</button>
        </div>
    </form>

    <div class="link">
        <a href="http://localhost:8080/MenoMeno/Sing_Up/Sing_Up.jsp" id="sgin-up">회원가입</a>
        <a href="../SWS/id pass find.html" id="find-idpw">아이디/비밀번호 찾기</a>
    </div>

</section>

<script>
    let id = $('#id');
    let pw = $('#pw');
    let btu = $('#btu');

    $(btu).on('click', function () {
        if($(id).val() == "") {
            $(id).next('label').addClass('warning');
            setTimeout(function () {
                $('label').removeClass('warning');
            }, 1500);
        }
        else if($(pw).val() == "") {
            $(pw).next('label').addClass('warning');
            setTimeout(function () {
                $('label').removeClass('warning');
            }, 1500);
        }
    });
</script>

</body>
</html>