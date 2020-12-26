import React from 'react'
import profile from '../../Img/profile.jpg'
import link from '../../Svg/link.svg'
import '../../css/All.css'

function All() {

    return(
        <div className="allSection">

            <div className="mainActicle">
                <div className="scrapButton">
                    <svg viewBox="0 0 16 16" version="1.1" width="18" height="18" aria-hidden="true"><path fillRule="evenodd" d="M7.75 2a.75.75 0 01.75.75V7h4.25a.75.75 0 110 1.5H8.5v4.25a.75.75 0 11-1.5 0V8.5H2.75a.75.75 0 010-1.5H7V2.75A.75.75 0 017.75 2z"></path></svg>
                    <button>스크랩</button>
                </div>
                <div className="AllUserInfo">
                    <div className="leftInfo">
                        <p className="name">username</p>
                        <p>·</p>
                        <p className="date">2020-12-24</p>
                    </div>
                    <div className="rightInfo">
                        <img src={link} alt=""/>
                        <p>0</p>
                    </div>
                </div>
                <div className="AllMain">
                    <img src={profile} alt=""/>
                    <div className="mainContent">
                        <p>React와 DRF를 이용한 velog</p>
                        <div className="tagInfo">
                            <p>#react</p>
                            <p>#react</p>
                            <p>#react</p>
                        </div>
                    </div>
                </div>
            </div>

            <div className="mainActicle">
                <div className="scrapButton">
                    <svg viewBox="0 0 16 16" version="1.1" width="18" height="18" aria-hidden="true"><path fillRule="evenodd" d="M7.75 2a.75.75 0 01.75.75V7h4.25a.75.75 0 110 1.5H8.5v4.25a.75.75 0 11-1.5 0V8.5H2.75a.75.75 0 010-1.5H7V2.75A.75.75 0 017.75 2z"></path></svg>
                    <button>스크랩</button>
                </div>
                <div className="AllUserInfo">
                    <div className="leftInfo">
                        <p className="name">username</p>
                        <p>·</p>
                        <p className="date">2020-12-24</p>
                    </div>
                    <div className="rightInfo">
                        <img src={link} alt=""/>
                        <p>0</p>
                    </div>
                </div>
                <div className="AllMain">
                    <img src={profile} alt=""/>
                    <div className="mainContent">
                        <p>React와 DRF를 이용한 velog</p>
                        <div className="tagInfo">
                            <p>#react</p>
                            <p>#react</p>
                            <p>#react</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    )
}
export default All;