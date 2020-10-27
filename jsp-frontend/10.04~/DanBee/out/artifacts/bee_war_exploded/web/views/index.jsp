<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Good Bee</title>
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="stylesheet" type="text/css" href="/css/index_header.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="mainImg-section">
    <div class="mainImg-header">
        <ul>
            <li><div class="circle" style="background-color: red;"></div></li>
            <li><div class="circle" style="background-color: orange;"></div></li>
            <li><div class="circle" style="background-color: teal;"></div></li>
        </ul>
    </div>
    <div class="mainImg-body">
        <a href="chat.do">
            <svg id="Capa_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg"><g><g>
                <path clip-rule="evenodd" d="m114.355 41.494h96.6c62.901 0 114.355 51.454 114.355 114.355v4.964c0 62.872-51.454 114.326-114.355 114.326h-96.6-22.836c-2.453 0-2.19-.088-4.351 1.022l-45.73 23.508c-2.453.905-3.65.234-3.504-2.278l2.628-48.826c.058-.409.146-.467-.117-.672-24.705-21.024-40.445-52.3-40.445-87.08v-4.964c0-62.901 51.454-114.355 114.355-114.355z" fill="#bcea73" fill-rule="evenodd"/></g><g><path clip-rule="evenodd" d="m397.645 211.946h-96.63c-62.901 0-114.355 51.454-114.355 114.355v4.964c0 62.872 51.454 114.355 114.355 114.355h96.63 22.836c2.424 0 2.161-.117 4.322 1.022l45.73 23.478c2.482.905 3.65.234 3.533-2.249l-2.657-48.855c-.058-.38-.146-.438.117-.672 24.705-21.023 40.474-52.298 40.474-87.078v-4.964c0-62.902-51.454-114.356-114.355-114.356z" fill="#8dcafc" fill-rule="evenodd"/></g><g><path d="m403.397 290.079h-105.653c-4.268 0-7.726-3.459-7.726-7.726s3.459-7.726 7.726-7.726h105.653c4.268 0 7.726 3.459 7.726 7.726.001 4.267-3.458 7.726-7.726 7.726z" fill="#f8f6f6"/></g><g><path d="m403.397 339.138h-105.653c-4.268 0-7.726-3.459-7.726-7.726s3.459-7.726 7.726-7.726h105.653c4.268 0 7.726 3.459 7.726 7.726.001 4.267-3.458 7.726-7.726 7.726z" fill="#f8f6f6"/></g><g>
                <path d="m403.397 388.198h-105.653c-4.268 0-7.726-3.459-7.726-7.726s3.459-7.726 7.726-7.726h105.653c4.268 0 7.726 3.459 7.726 7.726.001 4.266-3.458 7.726-7.726 7.726z" fill="#f8f6f6"/></g><g><path d="m213.409 115.45h-105.653c-4.267 0-7.726-3.459-7.726-7.726s3.459-7.726 7.726-7.726h105.653c4.267 0 7.726 3.459 7.726 7.726s-3.459 7.726-7.726 7.726z" fill="#f8f6f6"/></g><g><path d="m213.409 164.51h-105.653c-4.267 0-7.726-3.459-7.726-7.726s3.459-7.726 7.726-7.726h105.653c4.267 0 7.726 3.459 7.726 7.726s-3.459 7.726-7.726 7.726z" fill="#f8f6f6"/></g><g><path d="m160.582 213.599h-52.826c-4.267 0-7.726-3.459-7.726-7.726s3.459-7.726 7.726-7.726h52.826c4.267 0 7.726 3.459 7.726 7.726 0 4.266-3.459 7.726-7.726 7.726z" fill="#f8f6f6"/></g><g><path clip-rule="evenodd" d="m192.179 41.494c39.248 26.136 64.829 69.005 64.829 117.451 0 27.07-8.001 52.389-21.902 74.027 18.66-13.229 41.438-21.025 65.909-21.025h12.148c7.768-15.419 12.148-32.794 12.148-51.133v-4.964c0-62.901-51.454-114.355-114.355-114.355h-18.777z" fill="#99d53b" fill-rule="evenodd"/></g><g><path clip-rule="evenodd" d="m401.47 212.005c28.735 26.194 46.548 62.755 46.548 103.171 0 57.616-36.152 107.318-88.453 130.446h38.079 22.836c2.424 0 2.161-.117 4.322 1.022l45.73 23.478c2.482.905 3.65.234 3.533-2.249l-2.657-48.855c-.058-.38-.146-.438.117-.672 24.706-21.025 40.475-52.3 40.475-87.08v-4.964c0-61.617-49.381-112.253-110.53-114.297z" fill="#64b9fc" fill-rule="evenodd"/></g></g>
            </svg>
            <h2>채팅입장</h2>
        </a>
    </div>
</div>
<script>
    function signOut() {
            var auth2 = gapi.auth2.getAuthInstance();
            auth2.signOut().then(function () {
                console.log('User signed out.');
            });
        }
</script>
</body>
</html>