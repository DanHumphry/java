import React from 'react';
import UseForm from '../contaniers/UseForm'

function LoginJoin(){
    const { handleIDChange,
            handlePWChange,
            submitLoginButton,
            submitJoinButton } = UseForm()

    return(
        <>
          <h1>Login</h1>
          email: <input type="email" onChange={(e)=>{handleIDChange(e)}}/>
          Password: <input type="password" onChange={(e)=>{handlePWChange(e)}}/>
          <button className="btn btn-success" onClick={submitLoginButton}>Login</button>

          <h1>Join</h1>
          email: <input type="text" onChange={(e)=>{handleIDChange(e)}}/>
          Password: <input type="password" onChange={(e)=>{handlePWChange(e)}}/>
          <button className="btn btn-success" onClick={submitJoinButton}>Join</button>
      </>
    )
}
export default LoginJoin;