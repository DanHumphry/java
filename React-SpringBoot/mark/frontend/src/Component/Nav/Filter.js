import React, { useState } from 'react'

function Filter() {
    let [filterList] = useState([{id : 1, name: '가나다순'}, {id : 2, name: '최신순'}, {id : 3, name: '오래된순'}, {id : 4, name: '스크랩순'}])

    return(
        <>
        <div className="mobile_filter">
            <div className="first_filter">
                <ul>
                    {
                    filterList.map((a)=>{
                        return(
                        <li key={a.id}>
                            <input id={a.name} className="filters-input__checkbox" value="action" type="checkbox" data-type="genres"></input>
                            <label className="input__label | filters-input__label--checkbox" htmlFor={a.name}>
                            <span>{a.name}</span>
                            <span className="filters-input__tick">
                                <svg focusable="false" aria-hidden="true">
                                <use xlinkHref="#check">
                                    <svg viewBox="0 0 24 24" id="check" xmlns="http://www.w3.org/2000/svg"><path d="M9 21.035l-9-8.638 2.791-2.87 6.156 5.874 12.21-12.436L24 5.782z"></path></svg>
                                </use>
                                </svg>
                            </span>
                            </label>
                        </li>
                        )
                    })
                    }
                </ul>
            </div>
            <div className="second_filter">

            </div>
            <div className="third_filter">

            </div>
        </div>
        <hr style={{marginTop : "2.5rem"}}/>
        </>
    )
}
export default Filter;