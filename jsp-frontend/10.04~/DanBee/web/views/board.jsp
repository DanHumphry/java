<%@ page import="com.bee.www.vo.AttendanceVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);

    ArrayList<AttendanceVo> list = (ArrayList<AttendanceVo>) request.getAttribute("list");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>board</title>
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="stylesheet" type="text/css" href="/css/index_header.css">
    <link rel="stylesheet" type="text/css" href="/css/schoolInfo.css">
    <script>
        function showDetail(num){
            location.href="/board-detail.do?num="+num;
        }
    </script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="board-container">
    <div class="content-left">
        <div class="head">
            <main class="site-main">
                <article class="post-page">
                    <div class="entry-content">
                        <div class="content-list">
                            <div class="list-header2">
                                <div class="board-sort2">
                                        <form>
                                            <select class="list-sort">
                                                <option value="newest">최신순</option>
                                                <option value="best">추천순</option>
                                            </select>
                                        </form>
                                    <div class="control">
                                        <a href="/boardWrite.do" class="searchADNcontrol">글쓰기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="board-list">
                                <table>
                                    <thead>
                                    <tr>
                                        <th class="num">번호</th>
                                        <th class="title" style="min-width: 120px;">제목</th>
                                        <th class="user">작성자</th>
                                        <th class="date">작성일</th>
                                        <th class="view">추천수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for(int i=0;i<list.size();i++) {
                                    %>
                                    <tr>
                                        <td class="num"><%=list.get(i).getB_sq()%></td>
                                        <td onclick="showDetail(<%=list.get(i).getB_sq()%>)" class="title"><%=list.get(i).getTitle()%></td>
                                        <td class="user"><%=list.get(i).getNickname()%></td>
                                        <td class="date"><%=list.get(i).getWriteDate().substring(0, 11)%></td>
                                        <td class="view likeCt<%=i%>"></td>
                                    </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pagination">
                                <ul>
                                    <li>
                                        <a href="#">«</a>
                                    </li>
                                    <li class="active">
                                        <a href="#">
                                            1
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="#">
                                            2
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">»</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="search">
                                <form>
                                    <select>
                                        <option>전체</option>
                                        <option value="title">제목</option>
                                        <option value="username">작성자</option>
                                    </select>
                                    <input type="text"/>
                                    <button type="submit" class="searchADNcontrol">검색</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </article>
            </main>
        </div>
    </div>
</div>
<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script>
    $(function(){
        var sBtn = $(".pagination ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
        sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
            sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
            $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
        })
    })
    $(function() {
        function recCount() {
            <%
                for(int i=0;i<list.size();i++) {
            %>
            $.ajax({
                url: "/recCount.do",
                type: "POST",
                data: {
                    no: '<%=list.get(i).getB_sq()%>'
                },
                error: function () {
                    console.log("서버 통신 실패");
                },
                success: function (data) {
                    let JsonData = JSON.parse(data);
                    $(".likeCt<%=i%>").html(JsonData.count);
                },
            })
            <% } %>
        };
        recCount();
    })
</script>
</body>
</html>
