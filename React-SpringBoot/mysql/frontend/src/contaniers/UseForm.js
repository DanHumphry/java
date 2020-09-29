import {useState} from 'react';
import axios from 'axios';

function UseForm(){
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
    return {
        handleIDChange,
        handlePWChange,
        submitLoginButton,
        submitJoinButton
    }
}
export default UseForm;