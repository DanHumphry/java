import React, { useEffect, useState } from 'react';
import { Route } from 'react-router-dom';
import { useHistory } from 'react-router'
import './App.css'
import Sign from './components/Sign';
import Chat from './components/Chat';
import Profile from './components/Profile';

function App() {
  const history = useHistory()
  let [user, setUser] = useState();
  let [isAuthenticated, setisAuthenticated] = useState(localStorage.getItem('user') ? true : false)

  const userHasAuthenticated = (userData) => { 
    setisAuthenticated(true)
    localStorage.setItem('user', userData);
  }
  
  const handleLogout = () => {
    setisAuthenticated(false)
    setUser("")
    localStorage.removeItem('user');
    history.push('/')
  }
    
  useEffect(()=>{
    const test = JSON.parse(localStorage.getItem('user'));
    if(isAuthenticated){
      setUser(test.username)
      history.push('/chat')
    }
    else{
      history.push('/')
    }
  },[isAuthenticated])

  return (
    <>
    <Route exact path="/">
      <Sign userHasAuthenticated={userHasAuthenticated} history={history}/>
    </Route>
      
    <Route exact path="/chat">
      <Chat handleLogout={handleLogout} user={user}/>
    </Route>

    <Route exact path="/profile">
      <Profile handleLogout={handleLogout} user={user}/>
    </Route>
    </>
  );
}

export default App;