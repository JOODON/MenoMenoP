<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="Sing_Up.css">

    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Rubik:wght@500&display=swap" rel="stylesheet">

    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

    <title>회원가입 페이지</title>
</head>
<body>
<section class="sign-up-form">
    <h1>Meno sign-up</h1>
    <form action="Sing_UpAction.jsp" method="post">
        <div class="line">
            <label for="name" id="name-text"><p>이름</p></label>
            <input type="text" id="name" name="UserName" required maxlength="20" title="이름을 입력하세요.">
        </div>

        <div class="line">
            <p>성별</p>
            <input type="radio" value="남" id="m" name="UserGender" checked><label for="m">남</label>
            <input type="radio" value="여" id="f" name="UserGender"><label for="f">여</label>
        </div>

        <div class="line">
            <label for="id" id="id-text"><p>아이디</p></label>
            <input type="text" id="id" name="UserID" autocapitalize="off" required maxlength="20" title="아이디를 입력하세요.">
            <input type="submit" id="overlap" value="중복확인">
        </div>

        <div class="line">
            <label for="pw" id="pw-text"><p>비밀번호</p></label>
            <input type="password" id="pw" name="UserPassword" autocapitalize="off" required maxlength="20" title="비밀번호를 입력하세요.">
            <!--            <div id="message1">*특수문자를 포함해주세요.</div>-->
            <div id="message2">*비밀번호가 일치하지 않습니다.</div>
        </div>

        <div class="line">
            <label for="repw" id="repw-text"><p>비밀번호 재확인</p></label>
            <input type="password" id="repw" name="repw" autocapitalize="off" required maxlength="20" title="비밀번호를 재입력하세요.">

        </div>

        <div class="line">
            <span><p>생년월일</p></span>
            <input type="text" class="birth" id="year" title="출생년도를 선택하세요." name="yy" required><span>년</span></input>
            <input type="text" class="birth" id="month" title="출생년도를 선택하세요." name="yy" required><span>월</span></input>
            <input type="text" class="birth" id="day" title="출생년도를 선택하세요." name="yy" required><span>일</span></input>
        </div>

        <div class="line">
            <p>이메일</p>
            <input type="text" id="mail" name="UserEmail" autocapitalize="off" required maxlength="20" title="이메일을 입력하세요."> @
            <input type="text" id="domain" name="UserEmail2" autocapitalize="off" required maxlength="20">

            <select id="mail-sel" name="mail-sel" required>
                <option value="type">직접 입력</option>
                <option value="naver.com">naver.com</option>
                <option value="daum.net">daum.net</option>
                <option value="google.com">google.com</option>
                <option value="hanmail.net">hanmail.net</option>
                <option value="kokao.com">kokao.com</option>
            </select>
        </div>

        <div class="line">
            <p>전화번호</p>
            <input type="text" class="number" id="number1" name="UserPhoneNumber" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
            <input type="text" class="number" id="number2" name="UserPhoneNumber2" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
            <input type="text" class="number" id="number3" name="UserPhoneNumber3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
        </div>

        <div class="line">
            <button type="submit" id="but">가입하기</button>
        </div>
    </form>
    <script src ="sign_up.js"></script>
</section>
</body>
</html>