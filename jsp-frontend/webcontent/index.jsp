<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css">
</head>
<body>
    <header>
        <div class="header-area">
            <div class="header-main">
                <div class="header-container">
                    <div class="menu-wrapper">
                        <div class="logo">
                            <a href="index.jsp">
                                <h3>Logo</h3>
                            </a>
                        </div>
                        <div class="main-menu">
                            <nav>
                                <ul>
                                    <li><a href="map.jsp"><h4>위치</h4></a></li>
                                    <li><a href="review.jsp"><h4>후기</h4></a></li>
                                    <li><a href="free.jsp"><h4>잡담</h4></a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="login">
                            <a href="login.jsp">
                                <h4>
                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                    viewBox="0 0 28.9 28.9" style="enable-background:new 0 0 28.9 28.9;" xml:space="preserve">
                                <style type="text/css">
                                    .st0{fill:#fff;}
                                </style>
                                <g>
                                    <path class="st0" d="M14.5,28.9C6.5,28.9,0,22.4,0,14.5C0,6.5,6.5,0,14.5,0s14.5,6.5,14.5,14.5C28.9,22.4,22.4,28.9,14.5,28.9
                                        M14.5,1.7C7.4,1.7,1.7,7.4,1.7,14.5c0,7.1,5.7,12.8,12.8,12.8s12.8-5.7,12.8-12.8C27.3,7.4,21.5,1.7,14.5,1.7"/>
                                    <path class="st0" d="M14.5,5.7c-3,0-5.4,2.4-5.4,5.4c0,3,2.4,5.4,5.4,5.4s5.4-2.4,5.4-5.4C19.9,8.1,17.4,5.7,14.5,5.7"/>
                                    <path class="st0" d="M14.5,25.9c3.5,0,6.6-1.6,8.7-4c-0.9-2.8-2.4-4.7-4.3-5.8c-1.2,1-2.7,1.7-4.4,1.7s-3.2-0.6-4.4-1.7
                                        c-1.9,1.1-3.5,3-4.3,5.8C7.9,24.4,11,25.9,14.5,25.9"/>
                                </g>
                                </svg>
                                로그인</h4>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <main>
        <div class="back-container">
            <div class="back-img">
                <div class="main-container">
                    <div class="main-padding">
                        <div class="main-section">
                            <div class="main-title">
                                <h1>국비지원 정보공유 커뮤니티</h1>
                                <p>국비지원을 받을 수 있는 학원의 위치<br/>졸업생의 솔직한 후기<br/>그리고 자유로운 정보공유의 잡담</p>
                            </div>
                            <form action="#" class="main-search">
                                <div class="input-form">
                                    <input type="text" placeholder="단어 검색">
                                </div>
                                <div class="search-form">
                                    <a href="filter.html">
                                        <svg width="17" height="17" viewBox="0 0 17 17"><path fill-rule="evenodd" d="M13.66 7.36a6.3 6.3 0 1 1-12.598 0 6.3 6.3 0 0 1 12.598 0zm-1.73 5.772a7.36 7.36 0 1 1 1.201-1.201l3.636 3.635c.31.31.31.815 0 1.126l-.075.075a.796.796 0 0 1-1.126 0l-3.636-3.635z" clip-rule="evenodd"></path></svg>
                                        Search
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>