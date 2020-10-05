import React from 'react';
import '../css/Chat.css';
import '../css/Profile.css'
import basic from '../img/basic.jpg'
import {Link} from 'react-router-dom';

function Profile(props){

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
                                    <li><Link to="/chat">채팅방</Link></li>
                                    <li><Link to="/" onClick={()=>{props.handleLogout()}}>로그아웃</Link></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div className="img-section">
                        <div className="img-area">
                            <img src={basic} alt="/"></img>
                            <button className="up-button">업로드</button>
                            <button className="del-button">제거</button>
                        </div>
                    </div>

                    <div className="profile-section">
                        <div className="nickname">
                            <div className="wrapper">
                                <div className="title-wrapper">
                                    <h3>닉네임</h3>
                                </div>
                                <div className="content-wrapper">
                                    <div className="contents">{props.user}</div>
                                </div>
                                <div className="edit-wrapper">
                                    <button className="fix-button">수정</button>
                                </div>
                            </div>
                        </div>
                        
                        <div className="leave">
                            <div className="wrapper">
                                <div className="title-wrapper">
                                    <h3>회원탈퇴</h3>
                                </div>
                                <div className="content-wrapper">
                                    <div className="contents">
                                        <button className="leave-button">회원탈퇴</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </>
    )
}
export default Profile;