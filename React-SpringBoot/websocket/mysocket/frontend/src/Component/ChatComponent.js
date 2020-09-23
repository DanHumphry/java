import React from 'react';

function ChatComponent({
    handleEnter,
    inputContents,
    inputMessage,
    setInputMessage,
    inputUsername,
    setInputUsername,
}){
    
    return(
        <>
            유저이름 : 
            <input value={inputUsername}
            onChange={e=>setInputUsername(e.target.value)}/>

            {
                inputContents.map((a, i)=>{
                    return(
                    <div key={i}>
                        {a.username} : {a.content} ..
                    </div>
                )})
            }

            <input 
            placeholder="메세지를 입력하세요." 
            value={inputMessage}
            onChange={(e) => setInputMessage(e.target.value)}
            />
            <input type="submit" value="전송" onClick={()=>{
                handleEnter(inputUsername, inputMessage)
            }}
            />
        </>
    )
}
export default ChatComponent;