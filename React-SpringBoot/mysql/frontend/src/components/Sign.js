import React, { useState } from 'react';
import axios from 'axios';
import GoogleSign from './GoogleSign';

function Sign(props) {
    let [signBar, setSignBar] = useState("로그인");
    let active = "active"
    
    let [userEmail, setUserEmail] = useState("");
    let [userPw, setUserPw] = useState("");

    const sendData = { username : userEmail, password : userPw }
    const URL = 'http://localhost:8080/'

    const emptyInput = ()=>{
        setUserEmail("")
        setUserPw("");
    }
    const handleEmailChange = (e)=>{
        // const emailRegExp = /^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$/;
        setUserEmail(e.target.value);
    }
    const handlePWChange = (e)=>{
        setUserPw(e.target.value);
    }

    const submitLoginButton = ()=>{
      axios.post(URL + 'authenticate', sendData)
      .then((res) => {
        if(res.status === 200 && res.data.token && res.data.username){
            props.userHasAuthenticated(JSON.stringify(res.data));
            props.history.push('/chat')
        }
      })
    }
    const submitJoinButton = ()=>{
        console.log(sendData)
        axios.post(URL + 'register', sendData)
        .then((res) => {
        if(res.status === 200)
            submitLoginButton()
        })
    }

    

  return (
    <>
      <section className="container">
        <article className="modal">
          <h1>CHAT</h1>
			      <div className="tabs">
				    <span className={"tab " + (signBar === "로그인" ? active : "")} onClick={()=>{
              setSignBar("로그인")
              emptyInput()
            }}>로그인</span>
				    <span className={"tab " + (signBar === "회원가입" ? active : "")} onClick={()=>{
              setSignBar("회원가입")
              emptyInput()
              }}>회원가입</span>
			      </div>
            <div className="content">
                <section className="form-section">
                    <form>
                        <input type="email" value={userEmail} className="inpt" placeholder="Your email" onChange={(e)=>{handleEmailChange(e)}}/>
                        <input type="password" value={userPw} className="inpt" placeholder="Your password" onChange={(e)=>{handlePWChange(e)}}/>

                        <GoogleSign signBar={signBar} userHasAuthenticated={props.userHasAuthenticated}/>

                        <div className="submit-wrap">
                          {
                            signBar === "로그인" 
                            ? <input type="submit" value="로그인" className="submit" onClick={(e)=>{
                              e.preventDefault()
                              submitLoginButton()}}/>
                            : <input type="submit" value="회원가입" className="submit" onClick={(e)=>{
                              e.preventDefault()
                              submitJoinButton()}}/>
                          }
                        </div>
                    </form>
                </section>
            </div>
        </article>
      </section>
    </>
  );
}

export default Sign;