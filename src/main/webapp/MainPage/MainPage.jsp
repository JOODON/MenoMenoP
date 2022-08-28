<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="MainPage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Rubik:wght@500&display=swap" rel="stylesheet">
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <title>메인 페이지</title>
</head>
<body>
<%
    String userID=null;
    if (session.getAttribute("UserID")!= null){
        userID=(String) session.getAttribute("UserID");
    }
%>
<div class="header">
    <div class="header-title">
        <h1 class="maintitle">Meno Meno   <i class="fa-solid fa-book-open"></i>  </h1>
    </div>
    <div class="header-nav">
        <a href="#" class="main"><i class="fa-solid fa-house-chimney"></i> Home</a>
        <a href="#" class="Search"><i class="fa-solid fa-magnifying-glass"></i> Search</a>
        <a href="http://localhost:8080/MenoMeno/ViewPage/View.jsp" class="Contact"><i class="fa-regular fa-address-book"></i> Contact</a>
        <%
            if(userID == null){

        %>
        <a href="http://localhost:8080/MenoMeno/Login/login.jsp" class="login"><i class="fa-regular fa-user"></i> login</a>
        <%
        }else{
        %>
        <a href="http://localhost:8080/MenoMeno/Login/LogoutAction.jsp" class="login"><i class="fa-regular fa-user"></i> LoginOut</a>
        <%}
        %>
        <a href="http://localhost:8080/MenoMeno/Sing_Up/Sing_Up.jsp" class="Custom"> <i class="fa-regular fa-user"></i> Custom Join</a>
    </div>
</div>

<div class="main-page">
    <h1>Meno Meno</h1>
    <p>당신의 오늘 하루 있었던 일을 기록해보세요</p>
    <p>소중한 추억들을 공유하고 공감하고</p>
    <span class="bt">
    <button class="Reading"><a class="Readinglink" href="http://localhost:8080/MenoMeno/ViewPage/View.jsp">글목록 보러 가기</a></button>
    <button class="Writing"><a class="Writinglink" href="http://localhost:8080/MenoMeno/WritePage/Write.jsp">글 쓰러 가기</a></button>
    </span>
</div>

<div class="sub-page">
    <div class="sub-page-header">
        <h1>무엇을 할수 있나요?</h1>
        <h3>이 페이지에서 할수 있는 것</h3>
    </div>
    <div class="sub-page-main">
        <div class="sub-page1">
            <h4><i class="fa-solid fa-pen"></i>  자신의 추억들을 작성할수 있어요  <i class="fa-solid fa-pen"></i></h4>
            <p>당신의 추억들을 하나하나 작성해 보세요<br>
                행복했던 기억들 슬펐던 기억들을 적으면서<br>
                자신의 소중 했던 추억을 떠 올려 보세요</p>
        </div>
        <div class="sub-page2">
            <h4><i class="fa-solid fa-comments"></i>  사람들과 소통할수 있어요  <i class="fa-solid fa-comments"></i></h4>
            <p>당신의 소중한 추억을 사람들과 공유하고<br>
                다양한 사람들의 추억을 보고 생각하며<br>
                공감과 위로 축하의 말들을 전하세요</p>
        </div>
        <div class="sub-page3">
            <h4><i class="fa-solid fa-pager"></i>  자신만의 페이지를 꾸밀수 있어요  <i class="fa-solid fa-pager"></i></h4>
            <p>자신의 감성으로 자신의 페이지를 꾸며보세요<br>
                자신의 감성을로 만든 페이지를 자랑하고 <br>
                다른사람들의 페이지를 확인해보세요</p>
        </div>
    </div>
</div>
<div class="FAQ">
    <div class="faq1">
        <h1> <i class="fa-regular fa-circle-question"></i>  FAQ  <i class="fa-regular fa-circle-question"></i></h1>
        <h3><button class="question1"><i class="fa-solid fa-angle-down"></i></button>  중복하여 아이디를 가입 할수 있나요?</h3>
        <p class="faq1text">중복 아이디 가입은 가능합니다 하지만 중복한 계정 글로 <br>게시판 테러 및 무분별한 악성 댓글시 추방 조치가 될수 있습니다</p>
    </div>
    <div class="faq2">
        <h3><button class="question2"><i class="fa-solid fa-angle-down"></i></button>  다른 사람들과 소통하는 방법이 따로 있나요?</h3>
        <P class="faq2text">일반 게시판 처럼 다른 사람들의 글을 잃고 공감되는 부분이<br> 있으면 공감 부분 그리고 댓글 달기 기능 등을 지원 하고 있습니다.</P>
    </div>
    <div class="faq3">
        <h3><button class="question3"><i class="fa-solid fa-angle-down"></i></button>  특정한 사람의 게시글만 찾아 볼수 있나요?</h3>
        <p class="faq3text">아직까지는 기능을 구현 하지 못했으나 사용자가 많아 질 경우<br>특정한 사람의 게시글만 찾아보는 기능을 넣어볼 생각입니다</p>
    </div>
</div>
<div class="line">
    <div class="bottom-nav-top">
        <h4>이용 약간</h4>
        <h4 class="Pes-info">개인정보 처리 방침</h4>
        <h4 class="Call">연락</h4>
    </div>
</div>

<div class="bottom-nav-bot">
    <h4>032-000-1111</h4>
    <h4>Meno Meno</h4>
</div>
<script src="MainPage.js"></script>
</body>
</html>