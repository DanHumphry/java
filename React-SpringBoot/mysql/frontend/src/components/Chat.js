import React, { useState, useEffect } from 'react';
import '../css/Chat.css';
import basic from '../img/basic.jpg'
import {Link} from 'react-router-dom';
import SockJS from 'sockjs-client';
import Stomp from 'stompjs';

function Chat(props){
    let [search, setSearch] = useState(false);
    let [searchContent, setSearchContent] = useState("");

    // let [chat, setChat] = useState("");



    const [inputContents, setInputContents] = useState([]);
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
            <section className="Chat-container">
                <div className="all-margin">
                    <div className="Chat-header">
                        <div className="header-margin">
                            <div className="profile">
                                <img src={basic} alt="/"></img>
                            </div>
                            <div className="profile-memu">
                                <ul>
                                    <li><Link to="/profile">내 정보</Link></li>
                                    <li><Link to="/" onClick={()=>{props.handleLogout()}}>로그아웃</Link></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div className="chat-body">
                        <div className="chat-body-header">
                            <div>
                                <svg width="25" height="25" viewBox="0 0 17 17" onClick={()=>{setSearch(!search)}}>
                                    <path fillRule="evenodd" d="M13.66 7.36a6.3 6.3 0 1 1-12.598 0 6.3 6.3 0 0 1 12.598 0zm-1.73 5.772a7.36 7.36 0 1 1 1.201-1.201l3.636 3.635c.31.31.31.815 0 1.126l-.075.075a.796.796 0 0 1-1.126 0l-3.636-3.635z" clipRule="evenodd"></path>
                                </svg>
                                {
                                    search === true ?(<input type="text" placeholder="찾을 단어 검색" onChange={(e)=>{setSearchContent(e.target.value)}}></input>) : null
                                }
                                
                            </div>
                        </div>
                        <div className="chat-body-content">
                            <div className="inUserAlarm">
                                {props.user}님이 입장하셨습니다.
                            </div>
                            {
                                inputContents.map((a, i)=>{
                                    return(
                                        <div className="user-chatting" key={i}>
                                            <div className="user-img">
                                                <img src={basic} alt="/"></img>
                                                <div className="user-name">
                                                    <h4>{a.username}</h4>
                                                </div>
                                            </div>
                                            <div className="user-contnets">
                                                {a.content}
                                            </div>
                                        </div>
                                    )
                                })
                            }
                        </div>
                        <div className="chat-body-footer">
                            <textarea type="text" placeholder="내용을 입력하세요." onChange={(e)=>{setInputMessage(e.target.value)}}></textarea>
                            <button onClick={()=>{handleEnter(props.user, inputMessage)}}>전송</button>
                        </div>
                    </div>
                </div>
            </section>
        </>
    )
}
export default Chat;