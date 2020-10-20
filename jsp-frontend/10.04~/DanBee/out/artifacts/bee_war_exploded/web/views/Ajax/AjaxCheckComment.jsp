<%@ page import="com.bee.www.vo.AttendanceVo"%><%@ page import="java.util.ArrayList"%><%@ page contentType="text/plain;charset=UTF-8" language="java" %>
<%
    ArrayList<AttendanceVo> list = (ArrayList<AttendanceVo>) request.getAttribute("list");
%>
<%
    for(int i=0;i<list.size();i++) {
%>
{
    "c_sq" : "<%=list.get(i).getC_sq()%>",
    "b_sq" : "<%=list.get(i).getB_sq()%>",
    "nickname" : "<%=list.get(i).getNickname()%>",
    "writeDate" : "<%=list.get(i).getWriteDate()%>",
    "content" : "<%=list.get(i).getContent()%>",
},
<% } %>