import React,{ useState, useEffect } from 'react'
import SockJS from 'sockjs-client';
import Stomp from 'stompjs';
import ChatComponent from '../Component/ChatComponent';

function ChatContainer(){

    const [inputContents, setInputContents] = useState([]);
    const [inputUsername, setInputUsername] = useState('');
    const [inputMessage, setInputMessage] = useState('');

    let sockJS = new SockJS("http://localhost:8080/webSocket");
    let stompClient  = Stomp.over(sockJS);
    stompClient.debug = () => {};

    useEffect(()=>{
        stompClient.connect({},()=>{
          stompClient.subscribe('/topic/roomId',(data)=>{
            const newMessage = JSON.parse(data.body);
            addMessage(newMessage);
          });
        });
    },[]);

    const addMessage = (message) =>{
        setInputContents(prev=>[...prev, message]);
    };

    const handleEnter = (username, content) => {
        const newMessage = { username, content };
        stompClient.send("/hello",{},JSON.stringify(newMessage));
        setInputMessage("");
    };

    return(
        <> 
            <ChatComponent
                handleEnter={handleEnter}
                inputContents={inputContents}
                inputMessage={inputMessage}
                setInputMessage={setInputMessage}
                inputUsername={inputUsername}
                setInputUsername={setInputUsername}
            />
        </>
    )
}
export default ChatContainer;