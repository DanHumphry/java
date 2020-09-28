import React, { useEffect, useState } from 'react';
import axios from "axios";

function App() {
    // const [res, setRes] = useState()

    // useEffect(()=>{
    //     getApi()
    // })

    // const getApi = () => {
    //     axios.get("http://localhost:8080/hello")
    //         .then(res => {
    //             console.log(res);
    //             setRes(res.data.message)
    //         })
    //         .catch(res => console.log(res))
    // }

  let [username, setUsername] = useState();
  let [userPw, setUserPw] = useState();

  const handleIDChange = (e)=>{
    setUsername(e.target.value);
  }
  const handlePWChange = (e)=>{
    setUserPw(e.target.value);
  }

  const submitButton = ()=>{
    const sendData = {
      username : username,
      password : userPw
    }
    axios.post('http://localhost:8080/register', sendData)
    .then((res) => {
      console.log(res);
      console.log("token : " + res.data.token)
    })
  }
  
  return (
      <div className="App">
          <h1>Login</h1>
          User Name: <input type="text" onChange={(e)=>{handleIDChange(e)}}/>
          Password: <input type="password" onChange={(e)=>{handlePWChange(e)}}/>
          <button className="btn btn-success" onClick={submitButton}>Login</button>
      </div>
  );
}

export default App;