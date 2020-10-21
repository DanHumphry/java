<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.bee.www.vo.AttendanceVo" %>
<%@ page import="java.util.ArrayList" %>
<%
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);
    ArrayList<AttendanceVo> list = (ArrayList<AttendanceVo>) request.getAttribute("list");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>attendance</title>
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="stylesheet" type="text/css" href="/css/index_header.css">
    <link rel="stylesheet" type="text/css" href="/css/reviews.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="board-container">
    <div class="body-header">
        <form action="/attendanceRegister.do" method="post" onsubmit="validateCheck()">
            <textarea name="content" id="content" type="text" placeholder="내용을 입력하세요."></textarea>
            <button type="submit">글쓰기</button>
        </form>
    </div>

    <div class="board-list">
        <table>
            <tbody>
            <tr>
                <td name="title" id="title" class="title"></td>
                <td name="" id="" class="user"></td>
                <td name="writeDate" id="writeDate" class="date"></td>
            </tr>
            <%
                for (int i = 0; i < list.size(); i++) {
            %>
            <tr>
                <td class="title"><%=list.get(i).getContent()%></td>
                <td class="user"><%=list.get(i).getNickname()%></td>
                <td class="date"><%=list.get(i).getWriteDate().substring(0, 11)%></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>
<script>
    function validateCheck() {
        var content = $('#content').val();

        if (!content) {
            alert("내용을 입력해 주세요.");
            $('#content').focus();
            return false;
        }
    }
</script>
</body>
</html>
