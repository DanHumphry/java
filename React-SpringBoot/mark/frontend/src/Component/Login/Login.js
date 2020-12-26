import React, {useState} from 'react';
import { Link } from 'react-router-dom';
import { useHistory } from 'react-router'
import '../../css/Login.css'
import Google from './Google';
import axios from 'axios';

function Login(props) {
  const history = useHistory()
  const URL = 'http://localhost:8080/';

  let [loginInfo, setLoginInfo] = useState({username : "", password : ""});

  const SetJoinOnChange = (e)=>{
    let arr = { ...loginInfo, [e.target.name] : e.target.value }
    setLoginInfo(arr)
  }

  const submitLoginButton = (e)=>{
    e.preventDefault()
    console.log(loginInfo)
    axios.post(URL + 'authenticate', loginInfo)
    .then((res) => {
      console.log(res)
      if(res.status === 200 && res.data.token && res.data.username){
        props.userHasAuthenticated(JSON.stringify(res.data));
        history.push('/')
      }
    })
  }
  
  return (
    <div className="login-container">
    <div className="login-box">
      <div className="exit">
        <button onClick={()=>{history.push('/')}}>
            <svg className="icon-longarrow" viewBox="0 0 54 24"><path d="M.42 11.158L12.38.256c.333-.27.696-.322 1.09-.155.395.166.593.467.593.903v6.977h38.87c.29 0 .53.093.716.28.187.187.28.426.28.716v5.98c0 .29-.093.53-.28.716a.971.971 0 0 1-.716.28h-38.87v6.977c0 .416-.199.717-.592.903-.395.167-.759.104-1.09-.186L.42 12.62a1.018 1.018 0 0 1 0-1.462z"></path></svg>
        </button>
      </div>
      <span>로그인</span>
      <form>
        <input name="username" type="text" placeholder="아이디를 입력하세요" onChange={(e)=>{SetJoinOnChange(e)}}/>
        <input name="password" type="password" placeholder="비밀번호를 입력하세요" onChange={(e)=>{SetJoinOnChange(e)}}/>
        <button className="JoinLoign-button" onClick={(e)=>{submitLoginButton(e)}}>로그인</button>
      </form>
      <section className="social-box">
        <h4>소셜 계정으로 로그인</h4>
        <div className="googlebox">
            <Google/>
        </div> 
      </section>
      <div className="login-foot">
        <span>아직 회원이 아니신가요 ?</span>
        <div className="foot-link"><Link to="/join">회원가입</Link></div>
      </div>
    </div>
  </div>
  );
}

export default Login;
