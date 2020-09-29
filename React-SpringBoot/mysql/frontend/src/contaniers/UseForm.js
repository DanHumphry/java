import {useState} from 'react';
import axios from 'axios';

function UseForm(){
    let [username, setUsername] = useState();
    let [userPw, setUserPw] = useState();

    const handleIDChange = (e)=>{
        // const emailRegExp = /^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$/;
        // console.log(emailRegExp)
        setUsername(e.target.value);
    }
    const handlePWChange = (e)=>{
        setUserPw(e.target.value);
    }

    const submitLoginButton = (e)=>{
        e.preventDefault()
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

    const submitJoinButton = (e)=>{
        e.preventDefault()
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

    // const test = (e)=>{
    //     e.preventDefault()
    //     const data = {
    //     username : username,
    //     password : userPw
    //     }
    //     fetch('http://localhost:8080/register', {
    //         method: 'POST',
    //         headers:{
    //           'Content-Type': 'application/json'
    //         },
    //         body: JSON.stringify(data)
    //       }).then((res) => {
    //           console.log(res)
    //       })
    //       .then((res) =>{
    //           console.log(res)
    //       })
    // }

    return {
        handleIDChange,
        handlePWChange,
        submitLoginButton,
        submitJoinButton,
    }
}
export default UseForm;