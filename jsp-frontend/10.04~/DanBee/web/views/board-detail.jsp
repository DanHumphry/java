<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page import="com.bee.www.vo.AttendanceVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AttendanceVo vo = (AttendanceVo) request.getAttribute("vo");
    LoginManager lm=LoginManager.getInstance();
    String id=lm.getMemberId(session);
    ArrayList<AttendanceVo> list = (ArrayList<AttendanceVo>) request.getAttribute("list");
    ArrayList<AttendanceVo> ReList = (ArrayList<AttendanceVo>) request.getAttribute("ReList");
    System.out.println(ReList);
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
<jsp:include page="header.jsp"></jsp:include>
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
        <h4>Comments <%=list.size()%></h4>
    </div>
    <%
        for(int i=0;i<list.size();i++) {
    %>
    <table >
        <tbody >
        <tr class="left-section" >
            <td class="left-info-nick"><%=list.get(i).getNickname()%></td>
            <td class="left-info-date"><%=list.get(i).getWriteDate()%></td>
        </tr >
        <tr class="right-section" >
            <td id="reCmt<%=i%>" class="right-info">답변</td >
            <td id="fixCmt<%=i%>" class="right-info">수정</td >
            <td id="delCmt<%=i%>" class="right-info">삭제</td >
        </tr >
        </tbody >
        <tfoot >
        <tr class="cmt-content">
            <td class="comment-content"><%=list.get(i).getContent()%></td>
        </tr>
        <tr class="reCmtCnt">
            <td class="reCmtCnt-nick">닉네임</td>
            <td class="reCmtCnt-date">2020-20-20</td>
            <td class="reCmtCnt-right-info" style="right: 55px">수정</td >
            <td class="reCmtCnt-right-info" style="right: 10px">삭제</td >
            <td class="reCmtCnt-content">내용입니다.</td>
        </tr>
        <tr class="reCmt-hidden<%=i%> hiddenReCmt">
            <td class="reComment-txt">
                <textarea id="reCmtCnt<%=i%>" name="reCmtCnt<%=i%>" placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
            </td>
            <td class="reComment-button">
                <button id="reCmtCnt-btn<%=i%>" class="reCmtBtn">댓글달기</button>
            </td>
        </tr>
        </tfoot >

    </table >
    <% } %>
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
                    console.log(data);
                    let JsonData = JSON.parse(data);
                    console.log(JsonData);
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
                    location.reload()
                },
            })
            <% }  %>
        })

        <%
            for(int i=0;i<list.size();i++) {
        %>
        $("#reCmt<%=i%>").click(function (){
            $(".hiddenReCmt").css("display", "none");
            $(".reCmt-hidden<%=i%>").css("display", "block");
        })
        <% } %>


        <%
            for(int i=0;i<list.size();i++) {
        %>
        $("#reCmtCnt-btn<%=i%>").click(function(){
            <%
                if (id==null){
            %>
            alert("로그인이 필요합니다.");
            location.href='/login.do';
            <%
                }else {
            %>
            $.ajax({
                url: "/reCommentIn.do",
                type: "POST",
                data: {
                    num : '<%=list.get(i).getC_sq()%>',
                    content : $("#reCmtCnt<%=i%>").val()
                },
                success: function () {
                    console.log("보내기 성공");
                    location.reload()
                },
            })
            <% }  %>
        })
        <% } %>
    })
</script>
</body>
</html>