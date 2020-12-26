import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router'
import './App.css';
import Nav from './Component/Nav/Nav';
import Filter from './Component/Nav/Filter';
import Login from './Component/Login/Login';
import Join from './Component/Login/Join';
import MyBook from './Component/MyBook/MyBook';
import All from './Component/All/All';
import Team from './Component/Team/Team';
import { Route } from 'react-router-dom'; 

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
    const userInfo = JSON.parse(localStorage.getItem('user'));
    if(isAuthenticated){
      setUser(userInfo.username)
      history.push('/')
    }else{
      handleLogout()
    }
  },[isAuthenticated])
  
  return (
    <div className="body">
      <div className="autoMargin">
        <Route exact path="/">
          <Nav handleLogout={handleLogout} isAuthenticated={isAuthenticated}/>
          <Filter/>
          <All/>
        </Route>

        <Route exact path="/login">
          <Login userHasAuthenticated={userHasAuthenticated}/>
        </Route>

        <Route exact path="/join">
          <Join userHasAuthenticated={userHasAuthenticated}/>
        </Route>

        <Route exact path="/mine">
          <Nav handleLogout={handleLogout} isAuthenticated={isAuthenticated}/>
          <Filter/>
          <MyBook/>
        </Route>

        <Route exact path="/team">
          <Nav handleLogout={handleLogout} isAuthenticated={isAuthenticated}/>
          <Filter/>
          <Team/>
        </Route>

        <Route exact path="/follower">
          <Nav handleLogout={handleLogout} isAuthenticated={isAuthenticated}/>
          <Filter/>
        </Route>
      </div>
    </div>
  );
}

export default App;
