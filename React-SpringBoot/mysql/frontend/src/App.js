import React, { useState } from 'react';
import axios from "axios";

function App() {

  let [username, setUsername] = useState();
  let [userPw, setUserPw] = useState();

  const handleIDChange = (e)=>{
    setUsername(e.target.value);
  }
  const handlePWChange = (e)=>{
    setUserPw(e.target.value);
  }

  const submitLoginButton = ()=>{
    const sendData = {
      username : username,
      password : userPw
    }
    axios.post('http://localhost:8080/authenticate', sendData)
    .then((res) => {
      console.log(res);
      console.log("token : " + res.data.token)
    })
  }

  const submitJoinButton = ()=>{
    const sendData = {
      username : username,
      password : userPw
    }
    axios.post('http://localhost:8080/register', sendData)
    .then((res) => {
      console.log(res)
      console.log("회원가입 성공 !!")
    })
  }

  // const testSubmit = ()=>{
  //   const sendData = {
  //     username : username,
  //     password : userPw
  //   }
  //   fetch('http://localhost:8080/authenticate', {
  //     method : 'POST',
  //     headers: {
  //         'Content-Type' : `application/json`,
  //     },
  //     body : sendData
  //   })
  //   .then((res) => {
  //     console.log(res);
  //   })
  // }

  return (
      <div className="App">
          <h1>Login</h1>
          User Name: <input type="text" onChange={(e)=>{handleIDChange(e)}}/>
          Password: <input type="password" onChange={(e)=>{handlePWChange(e)}}/>
          <button className="btn btn-success" onClick={submitLoginButton}>Login</button>

          <h1>Join</h1>
          User Name: <input type="text" onChange={(e)=>{handleIDChange(e)}}/>
          Password: <input type="password" onChange={(e)=>{handlePWChange(e)}}/>
          <button className="btn btn-success" onClick={submitJoinButton}>Join</button>
      </div>
  );
}

export default App;