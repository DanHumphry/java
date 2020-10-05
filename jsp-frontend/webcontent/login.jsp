<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css">
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
                            <a href="index.jsp">
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
        <div class="back-container2">
            <div class="back-img2">
                <div class="main-container">
                    <div class="main-padding">
                        <div class="main-section">
                            <section class="container">
                                <article class="modal">
                                    <a href="index.jsp"><div class="exit-wrapper">
                                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" tabindex="1" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
                                        </svg>
                                    </div></a>
                                    <div class="tabs">
                                      <span class="tab signin active"><a href="#signin">로그인</a></span>
                                      <span class="tab signup"><a href="#signup">회원가입</a></span>
                                    </div>
                                    <div class="content">
                                        <section class="signin-cont cont">
                                            <form>
                                                <input id="id" type="text" class="inpt" placeholder="Your email"/>
                                                <input id="password" type="password" class="inpt" placeholder="Your password"/>
                                                <section class="social-box">
                                                    <h4>소셜 계정으로 로그인</h4>
                                                    <div class="googlebox">
                                                        <a href="#">
                                                            <svg width="20" height="20" fill="none" viewBox="0 0 20 20" class="google-login">
                                                            <path fill="#4285F4" d="M19.99 10.187c0-.82-.069-1.417-.216-2.037H10.2v3.698h5.62c-.113.92-.725 2.303-2.084 3.233l-.02.124 3.028 2.292.21.02c1.926-1.738 3.037-4.296 3.037-7.33z"></path>
                                                            <path fill="#34A853" d="M10.2 19.931c2.753 0 5.064-.886 6.753-2.414l-3.218-2.436c-.862.587-2.017.997-3.536.997a6.126 6.126 0 0 1-5.801-4.141l-.12.01-3.148 2.38-.041.112c1.677 3.256 5.122 5.492 9.11 5.492z"></path>
                                                            <path fill="#FBBC05" d="M4.398 11.937a6.008 6.008 0 0 1-.34-1.971c0-.687.125-1.351.329-1.971l-.006-.132-3.188-2.42-.104.05A9.79 9.79 0 0 0 .001 9.965a9.79 9.79 0 0 0 1.088 4.473l3.309-2.502z"></path>
                                                            <path fill="#EB4335" d="M10.2 3.853c1.914 0 3.206.809 3.943 1.484l2.878-2.746C15.253.985 12.953 0 10.199 0 6.211 0 2.766 2.237 1.09 5.492l3.297 2.503A6.152 6.152 0 0 1 10.2 3.853z"></path>
                                                            </svg>
                                                        </a>
                                                    </div>
                                                </section>
                                                <h4>아이디가 기억나지 않으신다면 ?
                                                    <br/><a href="#">클릭</a>
                                                </h4>
                                                <div class="submit-wrap">
                                                    <input type="submit" value="로그인" class="submit"/>
                                                </div>
                                            </form>
                                        </section>
                                        <section class="signup-cont cont">
                                            <form>
                                            	<input id="id" type="text" class="inpt" placeholder="Your Id"/>
                                                <input id="pw" type="password" class="inpt" placeholder="Your password"/>
                                                <input id="email" type="email" class="inpt" placeholder="Your email"/>
                                                <input id="name" type="text" class="inpt" placeholder="Your Name"/>
                                                <section class="social-box">
                                                    <h4>소셜 계정으로 회원가입</h4>
                                                    <div class="googlebox">
                                                        <a href="#">
                                                            <svg width="20" height="20" fill="none" viewBox="0 0 20 20" class="google-login">
                                                            <path fill="#4285F4" d="M19.99 10.187c0-.82-.069-1.417-.216-2.037H10.2v3.698h5.62c-.113.92-.725 2.303-2.084 3.233l-.02.124 3.028 2.292.21.02c1.926-1.738 3.037-4.296 3.037-7.33z"></path>
                                                            <path fill="#34A853" d="M10.2 19.931c2.753 0 5.064-.886 6.753-2.414l-3.218-2.436c-.862.587-2.017.997-3.536.997a6.126 6.126 0 0 1-5.801-4.141l-.12.01-3.148 2.38-.041.112c1.677 3.256 5.122 5.492 9.11 5.492z"></path>
                                                            <path fill="#FBBC05" d="M4.398 11.937a6.008 6.008 0 0 1-.34-1.971c0-.687.125-1.351.329-1.971l-.006-.132-3.188-2.42-.104.05A9.79 9.79 0 0 0 .001 9.965a9.79 9.79 0 0 0 1.088 4.473l3.309-2.502z"></path>
                                                            <path fill="#EB4335" d="M10.2 3.853c1.914 0 3.206.809 3.943 1.484l2.878-2.746C15.253.985 12.953 0 10.199 0 6.211 0 2.766 2.237 1.09 5.492l3.297 2.503A6.152 6.152 0 0 1 10.2 3.853z"></path>
                                                            </svg>
                                                        </a>
                                                    </div>
                                                </section>
                                                <div class="submit-wrap">
                                                    <input type="submit" value="회원가입" class="submit"/>
                                                </div>
                                            </form>
                                        </section>
                                    </div>
                                </article>
                              </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript">
        $('.tabs .tab').click(function () {
            if ($(this).hasClass('signin')) {
                $('.tabs .tab').removeClass('active');
                $(this).addClass('active');
                $('.cont').hide();
                $('.signin-cont').show();
            }
            if ($(this).hasClass('signup')) {
                $('.tabs .tab').removeClass('active');
                $(this).addClass('active');
                $('.cont').hide();
                $('.signup-cont').show();
            }
        });
        $('.container .bg').mousemove(function (e) {
            var amountMovedX = (e.pageX * -1 / 30);
            var amountMovedY = (e.pageY * -1 / 9);
            $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>