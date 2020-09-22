import React, { useEffect, useState } from 'react';
import axios from "axios";

function App() {
    const [res, setRes] = useState()

    useEffect(()=>{
        getApi()
    })

    const getApi = () => {
        axios.get("http://localhost:8080/api/hello")
            .then(res => {
                console.log(res);
                setRes(res.data.message)
            })
            .catch(res => console.log(res))
    }


  return (
      <div className="App">
          {res}
      </div>
  );
}

export default App;