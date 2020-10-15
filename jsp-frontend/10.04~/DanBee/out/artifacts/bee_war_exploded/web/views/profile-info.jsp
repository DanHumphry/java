<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page import="com.bee.www.vo.MemberVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);
    MemberVo vo = (MemberVo) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
    <link rel="stylesheet" href="css/profile.css">
</head>
<body>
<header>
    <div class="header-area">
        <div class="header-main">
            <div class="header-filter">
                <svg width="17" height="17" viewBox="0 0 17 17">
                    <path fill-rule="evenodd" d="M13.66 7.36a6.3 6.3 0 1 1-12.598 0 6.3 6.3 0 0 1 12.598 0zm-1.73 5.772a7.36 7.36 0 1 1 1.201-1.201l3.636 3.635c.31.31.31.815 0 1.126l-.075.075a.796.796 0 0 1-1.126 0l-3.636-3.635z" clip-rule="evenodd"></path>
                </svg>
                <input type="text" placeholder="검색할 내용.."/>
            </div>
            <div class="header-login">
                <%
                    //로그인 상태
                    if(id==null){
                %>
                <a href="/join.do">
                    <h3 class="join">회원가입</h3>
                </a>
                <a href="/login.do">
                    <h3>로그인</h3></a>
                <% } //로그아웃 상태
                else { %>
                <a href="/profile.do?id=<%=id%>">
                    <h3 class="join">회원정보</h3>
                </a>
                <a href="/logout.do">
                    <h3>로그아웃</h3>
                </a>
                <% }  %>
            </div>
        </div>
    </div>
</header>

<section class="Chat-container">
    <div class="all-margin">
        <form action="" method="post">
            <div class="img-section">
                <div class="img-area">
                    <img id="image_section" src="<%=vo.getImage()%>" alt=""/>
                    <button class="up-button" type="button">
                        <label for="imgFile" class="img-up">
                            <input type="file" id="imgFile" name="imgFile" accept=".jpg, .png, .jpeg, .gif"/>업로드
                        </label>
                    </button>
                    <button class="del-button" onclick="delImg()">제거</button>
                </div>
            </div>
        </form>
        <form action="profileUpdate.do" method="post">
            <div class="profile-section">
                <div class="nickname">
                    <div class="wrapper">
                        <div class="title-wrapper">
                            <h3>닉네임</h3>
                        </div>
                        <div class="content-wrapper">
                            <div class="contents cont"><%=vo.getNickname()%></div>
                            <div class="contents-input cont" style="display: none;">
                                <input id="nick" name="nick" class="fixName-input" type="text" value="<%=vo.getNickname()%>"/>
                            </div>
                        </div>
                        <div class="edit-wrapper">
                            <button class="tab fix-button active" type="button">수정</button>
                            <button class="tab update-button" type="submit">저장</button>
                        </div>
                    </div>
                </div>

                <div class="leave">
                    <div class="wrapper">
                        <div class="title-wrapper">
                            <h3>회원탈퇴</h3>
                        </div>
                        <div class="content-wrapper">
                            <div class="contents">
                                <button class="leave-button">회원탈퇴</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>

<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#image_section').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#imgFile").change(function () {
        readURL(this);
    });

    function delImg(){
        $('#image_section').removeAttr('src');
    }


    $('.edit-wrapper .tab').click(function () {
        if ($(this).hasClass('fix-button')) {
            $('.edit-wrapper .tab').removeClass('active');
            $('.update-button').addClass('active');
            $('.cont').hide();
            $('.contents-input').show();
        }
        if ($(this).hasClass('update-button')) {
            $('.edit-wrapper .tab').removeClass('active');
            $('.fix-button').addClass('active');
            $('.cont').hide();
            $('.contents').show();
        }
    });
</script>
</body>
</html>
