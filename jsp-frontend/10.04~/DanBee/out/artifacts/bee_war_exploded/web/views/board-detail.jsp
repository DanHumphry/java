<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page import="com.bee.www.vo.AttendanceVo" %>
<%@ page import="com.bee.www.vo.MemberVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AttendanceVo vo = (AttendanceVo) request.getAttribute("vo");
    LoginManager lm=LoginManager.getInstance();
    String id=lm.getMemberId(session);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
    <link rel="stylesheet" href="css/detail.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
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
                    if(id==null){
                %>
                <a href="/join.do">
                    <h3 class="join">회원가입</h3>
                </a>
                <a href="/login.do">
                    <h3>로그인</h3></a>
                <% }
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

<section class="title-section">
    <div class="title-logo">
        <a href="/">
            <img src="../images/GoodBee.png">
        </a>
    </div>
</section>

<div class="main-margin">
    <section class="nav-section">
        <nav>
            <ul>
                <li><a href="/attendance.do">출석체크</a></li>
                <li><a href="/board.do" style="color: rgb(12, 167, 179);">게시판</a></li>
            </ul>
        </nav>
    </section>
</div>
<div class="detail-auto">
    <div class="detail-container">

        <aside>
            <div class="aside-container">
                <div class="svg-circle btnLike" id="btnLike">
                    <svg class="like-svg" viewBox="0 0 24 24"><path fill="currentColor" d="M18 1l-6 4-6-4-6 5v7l12 10 12-10v-7z"></path></svg>
                </div>
                <div class="like-count">
                    <span class="likeCt"></span>
                </div>
            </div>
        </aside>

        <hr>
        <div class="detail-title">
            <h2 class="title-h2"><%=vo.getTitle()%></h2>
        </div>
        <hr>
        <div class="detail-userInfo">
            <div class="pull-left">
                <p class="userName"><%=vo.getNickname()%></p>
                <P><%=vo.getWriteDate().substring(0, 11)%></P>
            </div>
            <div class="pull-right">
                <div class="detail-content">
                    <div class="content-count">
                        <svg class="like-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 22 22"><defs><clipPath><rect y="8" x="8" height="32" width="32" fill="none" rx="16"/></clipPath><clipPath><rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/></clipPath><clipPath><rect width="32" height="32" x="392.57" y="507.8" fill="none" rx="16"/></clipPath><clipPath><rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/></clipPath><clipPath><rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/></clipPath><clipPath><rect width="32" height="32" x="392.57" y="507.8" fill="none" rx="16"/></clipPath><clipPath><rect width="32" height="32" x="8" y="8" fill="none" rx="16"/></clipPath><clipPath><rect width="32" height="32" x="392.57" y="507.8" fill="none" rx="16"/></clipPath><clipPath><rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/></clipPath><clipPath><rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/></clipPath><clipPath><rect y="8" x="8" height="32" width="32" fill="none" rx="16"/></clipPath><clipPath><path d="m0 706.47h1490.93v-706.47h-1490.93v706.47"/></clipPath><clipPath><path d="m22.2 686.12h1447.73v-667.19h-1447.73v667.19"/></clipPath><clipPath><rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/></clipPath><clipPath><rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/></clipPath><clipPath><rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/></clipPath><clipPath><rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/></clipPath><clipPath><rect y="8" x="8" height="32" width="32" fill="none" rx="16"/></clipPath></defs><path d="m740.86 187.66c0-12.912 12.526-23.416 27.922-23.416 15.397 0 27.923 10.505 27.923 23.416 0 12.912-12.526 23.416-27.923 23.416-1.295 0-2.594-.075-3.871-.223-5.93 3.767-10.308 5.829-13.02 6.131-.094.001-.189.016-.282.016-.872 0-1.678-.434-2.159-1.163-.537-.815-.572-1.848-.094-2.692.022-.04 2.116-3.861 1.512-7.51-6.37-4.458-10.01-10.973-10.01-17.975" fill="#4d4d4d" transform="matrix(.30328 0 0 .30328-222.16-46.812)"/></svg>
                        댓글숫자
                    </div>
                    <div class="mobile-like-count">
                        <button id="like-btn" class="mobile-like-button btnLike">
                            <svg width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M18 1l-6 4-6-4-6 5v7l12 10 12-10v-7z"></path></svg>
                            <span class="likeCt"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="detail-dec">
            <p><%=vo.getContent()%></p>
        </div>
    </div>
</div>
<div class="detail-button">
    <%
        if (id != null) {
            if (id.equals(vo.getId())) {
    %>
    <div class="left-button">
        <button onclick="location.href='/board-update.do?num=<%=vo.getB_sq()%>'">수정</button>
        <button onclick="location.href='/board-delete.do?num=<%=vo.getB_sq()%>'">삭제</button>
    </div>
    <div class="right-button">
        <button onclick="location.href='/board.do'">목록</button>
    </div>
    <%}else {%>
    <div class="right-button">
        <button onclick="location.href='/board.do'">목록</button>
    </div>
    <%}
    }
    else{
    %>
    <div class="right-button">
        <button onclick="location.href='/board.do'">목록</button>
    </div>
    <% } %>
</div>
<div class="commnet-container">
    <div class="comment-count">
        <h4>Comments 댓글숫자</h4>
    </div>
<%--    <%--%>
<%--        for (int i = 0; i < vo.getComments(); i++) {--%>
<%--    %>--%>
    <table >
        <tbody >
        <tr class="left-section" >
            <td class="left-info-nick">nick</td>
            <td class="left-info-date">date</td>
        </tr >
        <tr class="right-section" >
            <td class="right-info" ><a href = "#" > 답변 </a ></td >
            <td class="right-info" ><a href = "#" > 수정 </a ></td >
            <td class="right-info" ><a href = "#" > 삭제 </a ></td >
        </tr >
        </tbody >
        <tfoot >
        <tr >
            <td class="comment-content">contents</td>
        </tr >
        </tfoot >
    </table >
<%--    <% } %>--%>
    <div>
        <div class="comment-txt">
            <textarea id="cmtCnt" name="cmtCnt" placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
        </div>
        <div class="comment-button">
            <button id="cmtCnt-btn">댓글달기</button>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".btnLike").click(function(){
            <%
                if (id==null){
            %>
                alert("로그인이 필요합니다.");
                location.href='/login.do';
            <%
                }else {
            %>
                $.ajax({
                    url: "/recUpdate.do",
                    type: "POST",
                    data: {
                        no: '<%=vo.getB_sq()%>'
                    },
                    success: function () {
                        recCount();
                    },
                })
            <% }  %>
        })
        // 게시글 추천수
        function recCount() {
            $.ajax({
                url: "/recCount.do",
                type: "POST",
                data: {
                    no: '<%=vo.getB_sq()%>'
                },
                error: function () {
                    console.log("서버 통신 실패");
                },
                success: function (data) {
                    let JsonData = JSON.parse(data);
                    $(".likeCt").html(JsonData.count);
                    if(JsonData.onOff == 0){ //전달받은 0은 아직 추천하지 않았을경우
                        $(".btnLike svg").css("color" , "rgb(134, 142, 150)")
                    }else {//내가 추천해 놓은 경우
                        $(".btnLike svg").css("color" , "#8bd6f1")
                    }
                },
            })
        };
        recCount();

        $("#cmtCnt-btn").click(function(){
            <%
                if (id==null){
            %>
            alert("로그인이 필요합니다.");
            location.href='/login.do';
            <%
                }else {
            %>
            $.ajax({
                url: "/commentIn.do",
                type: "POST",
                data: {
                    num : '<%=vo.getB_sq()%>',
                    content : $("#cmtCnt").val()
                },
                success: function () {
                    console.log("보내기 성공");
                    commentUp();
                },
            })
            <% }  %>
        })
        function commentUp() {
            $.ajax({
                url: "/commentUp.do",
                type: "GET",
                error: function () {
                    console.log("가져오기 실패");
                },
                success: function (data) {
                    console.log(data);
                    let list = [];
                    list.push(data);
                    console.log(list);
                    let JsonData = JSON.parse(data);
                    console.log(JsonData);
                    console.log(JsonData.c_sq);
                },
            })
        };
        commentUp()
    })
</script>
</body>
</html>