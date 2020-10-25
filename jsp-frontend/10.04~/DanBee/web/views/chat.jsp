<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page import="com.bee.www.vo.MemberVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);
    MemberVo vo = (MemberVo) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
    <link rel="stylesheet" type="text/css" href="/css/chat.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>
<div id="main-container">
    <div id="chat-container">

    </div>
    <div id="bottom-container">
        <input id="inputMessage" type="text">
        <input id="btn-submit" type="submit" value="전송" >
    </div>
</div>

<script type="text/javascript">
    // WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
    var webSocket = new WebSocket("ws://localhost:8080/chat.do/websocket");

    var inputMessage = document.getElementById('inputMessage');

    webSocket.onerror = function(e){
        onError(e);
    };
    webSocket.onopen = function(e){
        onOpen(e);
    };
    webSocket.onmessage = function(e){
        onMessage(e);
    };

    // Send 버튼을 누르면 호출되는 함수
    function onMessage(e){
        let imgURL = "<%=vo.getNewFileName()%>";
        let chatMsg = e.data;
        let date = new Date();
        let dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        if(chatMsg.substring(0,6) == 'server'){
            //backend에서 sendText보낸 내용이 server로 시작할시 입장과 퇴장이기때문에
            //입장과 퇴장문은 다른 html요소가 실행되도록 if문 설계
            let $chat = $("<div class='chat notice'>" + chatMsg + "</div>");
            $('#chat-container').append($chat);
        }else{
            //sendText가 보낸 내용이 inputMessage.value를 포함하는 내용이고
            //보낸 session과 받는 session이 다른경우(내가 보낸 메세지가 아닌경우) 다른 html요소가 실행 설계
            let $chat = $(
                "<div class='chat-box chat-margin'>" +
                "<div class=\"chat-img\">" +
                "<img id=\"image_section\" src=\"../resources/img/"+imgURL+"\" alt=\"\"/>" +
                "</div>" +
                "<div class='chat'>"
                + chatMsg +
                "</div>" +
                "<div class='chat-info chat-box otherUser-chat'>"
                + dateInfo +
                "</div>" +
                "</div>"
            );
            $('#chat-container').append($chat);
        }
        $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);
    }

    function onOpen(e){

    }
    function onError(e){
        alert(e.data);
    }

    function send(){
        let chatMsg = inputMessage.value;
        if(chatMsg == ''){
            return;
        }
        let date = new Date();
        let dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        let $chat = $(
            "<div class='my-chat-box'>" +
            "<div class='chat-info my-chatInfo'>"
            + dateInfo +
            "</div>" +
            "<div class='chat my-chat'>"
            + chatMsg +
            "</div>" +
            "</div>"
        );
        $('#chat-container').append($chat);
        webSocket.send(chatMsg);
        //backend에서 내가 보낸 메세지는 다시 나에게 돌아오지 않게 되있기때문에 미리 append시켜준 모습(서버가 꺼져있어도 내메세지는 확인가능)
        //그런다음 webSocket.send실행, webSocket.onmessage가 실행된다

        inputMessage.value = "";
        $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);
    }
</script>

<script type="text/javascript">
    $(function(){
        $('#inputMessage').keydown(function(key){
            if(key.keyCode == 13){
                $('#inputMessage').focus();
                send();
            }
        });
        $('#btn-submit').click(function(){
            send();
        });
    })
</script>
</body>
</html>
