import React, { useRef, useState } from 'react';
import { Link } from 'react-router-dom';
import { useHistory } from 'react-router';
import '../../css/Login.css';
import Google from './Google';
import axios from 'axios';

function Join(props) {
    const history = useHistory()

    let [joinInfo, setJoinInfo] = useState({email : "", username : "", password : ""});
    let [hiddenIdStyle, setHiddenIdStyle] = useState({display : "none"}); // input부분 클릭시 정규표현식 검사 식이 나오도록 
    let [hiddenPwdStyle, setHiddenPwdStyle] = useState({display : "none"});// 초기값 display : none세팅

    let case1Ref = useRef(null);
    let case2Ref = useRef(null);
    let case3Ref = useRef(null);
    let case4Ref = useRef(null);
    let case5Ref = useRef(null);

    //회원가입 input의 onChange이벤트
    const SetJoinOnChange = (e)=>{
      let arr = { ...joinInfo, [e.target.name] : e.target.value }
      setJoinInfo(arr)
    }

    //정규표현식 Id검사
    const CheckId = (e)=>{
      let regex = /^[a-z0-9]{4,20}$/
      if(regex.test(e) === false){
        case1Ref.current.className = "case no"
      }else{
        case1Ref.current.className = "case ok"
      }
    }

    //pwd검사
    const CheckPwd = (e)=>{
      let num = e.search(/[0-9]/g);
      let eng = e.search(/[a-z]/ig);
      let spe = e.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
      if(e.length < 10 || e.length > 20){
        case4Ref.current.className = "case no"
      }else if(e.search(/\s/) !== -1){
        case4Ref.current.className = "case no"
      }else{
        case4Ref.current.className = "case ok"
      }
      
      if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
        case3Ref.current.className = "case no"
      }else{
        case3Ref.current.className = "case ok"
      }
    }

    //pwd재검사
    const ReCheckPwd = (e)=>{
      if(joinInfo.password !== e){
        case5Ref.current.className = "case no"
      }else{
        case5Ref.current.className = "case ok"
      }
    }

    const URL = 'http://localhost:8080/';
    const sendData = { 
      email : joinInfo.email, 
      username : joinInfo.username,
      password : joinInfo.password
    }

    const submitJoinButton = (e)=>{
      console.log(sendData)
      e.preventDefault()
      axios.post(URL + 'register', sendData)
      .then((res) => {
      if(res.status === 200)
          submitLoginButton()
      })
    }

    const submitLoginButton = ()=>{
      axios.post(URL + 'authenticate', sendData)
      .then((res) => {
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
      <span>회원가입</span>
      <form>

        {/* 이메일 */}
        <button className="sendEmailBtn">인증발송</button>
        <input type="text" placeholder="이메일을 입력하세요" name="email" onChange={(e)=>{SetJoinOnChange(e)}}/>
        <button style={{width : "55.31px"}} className="sendEmailBtn">확인</button>
        <input type="text" placeholder="인증번호확인"/>
        {/* 이메일 */}

        {/* 아이디 */}
        <button className="sendEmailBtn">중복확인</button>
        <input type="text" placeholder="아이디를 입력하세요" onFocus={()=>{setHiddenIdStyle({display : "block"})}} name="username"
        onChange={(e)=>{
          CheckId(e.target.value)
          SetJoinOnChange(e)
        }}/>
        <div className="focusInputOn" style={hiddenIdStyle}>
          <p ref={case1Ref} className="case">4자 이상의 영문 혹은 영문과 숫자를 조합</p>
          <p ref={case2Ref} className="case">아이디 중복확인</p>
        </div>
        {/* 아이디 */}

        {/* 비밀번호 */}
        <input style={{width : "298px"}} type="password" placeholder="비밀번호를 입력하세요" name="password"
        onFocus={()=>{setHiddenPwdStyle({display : "block"})}} onChange={(e)=>{
          CheckPwd(e.target.value)
          SetJoinOnChange(e)
        }}/>
        <div className="focusInputOn" style={hiddenPwdStyle}>
          <p ref={case3Ref} className="case">영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력</p>
          <p ref={case4Ref} className="case">10자리 ~ 20자리 이내로 공백없이 입력</p>
        </div>
        <input style={{width : "298px"}} type="password" placeholder="비밀번호를 한번 더 입력해주세요" onChange={(e)=>{
          ReCheckPwd(e.target.value)
        }}/>
        <div className="focusInputOn" style={hiddenPwdStyle}>
          <p ref={case5Ref} className="case">동일한 비밀번호 입력</p>
        </div>
        {/* 비밀번호 */}
        <button className="JoinLoign-button" onClick={(e)=>{submitJoinButton(e)}}>회원가입</button>
      </form>
      <section className="social-box">
        <h4>소셜 계정으로 회원가입</h4>
        <div className="googlebox">
            <Google/>
        </div>
      </section>
      <div className="login-foot">
        <span>이미 회원이신가요 ?</span>
        <div className="foot-link"><Link to="/login">로그인</Link></div>
      </div>
    </div>
  </div>
  );
}

export default Join;
