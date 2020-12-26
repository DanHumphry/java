import React,{ useState } from 'react'
import '../../css/Test.css'
import folder from '../../Svg/folder.svg'

function MyBook() {
    // 백엔드로 보내야할 state값
    let [writeInfo, setWriteInfo] = useState({URL : "", Title : ""});
    let [folderValue, setFolderValue] = useState({Folder : "선택하지않음"});
    let [plusFolder, setPlusFolder] = useState("")
    let [Tag, setTag] = useState("");

    // 백엔드에서 가져와야하는 state값
    let [bookMark, setBookMark] = useState([]);
    let [folderList, setFolderList] = useState([]);

    let [clickFolderList, setClickFolderList] = useState([])
    let [selectModal, setSelectModal] = useState(false);

    const SetBookMark = (e)=>{
        let arr = { ...writeInfo, [e.target.name] : e.target.value }
        setWriteInfo(arr)
    }

    // 지금 태그를 만드는게 잘안되는중 ',' 이라는 문자를 입력받았을때 indexOf~ 가 -1이 아니거나
    // e.target.value의 입력받은 마지막 문자인 ','를 인식할 수 있어야한다. 
    const MakeTag = (e)=>{
        setTag(e.target.value)
        console.log(e.target.value === ',')
        Test()
    }
    const Test = ()=>{
        console.log(Tag.indexOf(","))
    }

    const ClickFolder = (name)=>{
        let Num = 0;
        let List = [...clickFolderList]
        
        List.map((a)=>{
            if(a === name){
                Num = 1;
            }
            return Num;
        })
        if (Num === 0) {
            List.push(name)
        }else{
            List.splice(List.indexOf(name),1)
        }
        setClickFolderList(List)
    }

    const SubmitWrite = ()=>{
        let arr = [...bookMark]
        let sendData = {
            URL : writeInfo.URL,
            Title : writeInfo.Title,
            Tag : writeInfo.Tag,
            Folder : folderValue.Folder,
        }
        arr.push(sendData)
        setBookMark(arr)
        setWriteInfo({URL : "", Title : "", Tag : ""});
    }
    return (
        <>
        <div className="mobile_main">
            <div className="mobile_plusFolder">
                <input onChange={(e)=>{setPlusFolder(e.target.value)}} placeholder="폴더이름"/>
                <button onClick={()=>{
                    let arr = [...folderList]
                    arr.push(plusFolder + "/")
                    setFolderList(arr)
                    setPlusFolder("")
                }}>폴더추가</button>
            </div>
            <hr/>
            <div className="mobile_plusContent">
                <div className="plusInputInfo">
                    <p>URL : </p><input name="URL" onChange={(e)=>{SetBookMark(e)}}/>
                </div>
                <div className="plusInputInfo">
                    <p>Title : </p><input name="Title" onChange={(e)=>{SetBookMark(e)}}/>
                </div>
                <div className="plusInputInfo">
                    <p>Tag : </p><input onChange={(e)=>{MakeTag(e)}}/>
                </div>
                <div className="plusInputInfo" style={{justifyContent : "space-between"}}>
                    <div style={{display : "flex"}} onClick={()=>{setSelectModal(!selectModal)}}>
                        <p style={{width : "52.91px"}}>Folder : </p>
                        <input className="folderSelect" value={folderValue.Folder} readOnly style={{maxWidth : "130px"}}/>
                        <svg viewBox="0 0 24 24" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"></path></svg>
                        {
                            selectModal === true
                            ?(
                            <div className="mobileSelectForm">
                                <ul>
                                    <li onClick={()=>{
                                        setFolderValue({Folder : "선택하지않음"})
                                        setSelectModal(false)
                                        }}>선택하지않음
                                    </li>
                                    {
                                        folderList.map((a,i)=>{
                                            let firstFolder = a.split('/')[0]
                                            return <li key={i} onClick={()=>{
                                                    setFolderValue({Folder : a})
                                                    setSelectModal(false)
                                                    }}>
                                                    {firstFolder}</li>
                                        })
                                    }
                                </ul>
                            </div>
                            )
                            : null
                        }
                    </div>
                    <div>
                        <button onClick={SubmitWrite}>추가하기</button>
                    </div>
                </div>
            </div>
            <hr/>
            <div className="mobile_content">
                <div>
                {
                    folderList.map((a,i)=>{
                        let firstFolder = a.split('/')[0];
                        // let secondFolders = a.split('/')[1].split(',')
                        let inFolderList = [];

                        bookMark.map((A)=>{
                            if(A.Folder === a){
                                inFolderList.push(A)
                            }
                            return inFolderList
                        })

                        return(
                            <div key={i} className="repeatFolder">
                                <img src={folder} alt=""></img>
                                <p onClick={()=>{ClickFolder(a)}}>{firstFolder}</p>
                                {/* <div className="plusFolderInFolder">
                                    <input onChange={(e)=>{setPlusFolder(e.target.value)}}/>
                                    <p onClick={()=>{
                                        let arr = [...folderList]
                                        arr.splice(arr.indexOf(a), 1, a + "" + plusFolder + ",")
                                        setFolderList(arr)
                                    }}>폴더 추가하기</p>
                                </div> */}
                                {
                                    inFolderList.map((a,i)=>{
                                        let Num;
                                        let list;

                                        if(clickFolderList.length !== 0){
                                            clickFolderList.map(()=>{
                                                if(Num !== 0 && clickFolderList.indexOf(a.Folder) !== -1){
                                                    Num = 1;
                                                    return Num;
                                                }else{
                                                    Num = 0;
                                                    return Num;
                                                }
                                            })
                                            
                                            if(Num === 1){
                                                list = (
                                                    <div key={i} className="inFolderRepeatContent">
                                                        <p onClick={()=>{window.open(a.URL)}}>{a.Title}</p>
                                                    </div> 
                                                )
                                            }
                                        }
                                        return list
                                    })
                                }
                            </div>
                        )
                    })
                }
                {
                    bookMark.map((a,i)=>{
                        let filter;
                        if(a.Folder === "선택하지않음"){
                            filter = (
                            <div key={i} className="repeatContent">
                                <p onClick={()=>{window.open(a.URL)}}>{a.Title}</p>
                            </div>
                            )
                        }
                        
                        return filter
                    })
                }
                </div>
            </div>
        </div>
        </>
    )
}
export default MyBook;