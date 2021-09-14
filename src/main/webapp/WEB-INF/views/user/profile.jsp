<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
		<!-- navbar -->
		<jsp:include page="/WEB-INF/views/user/layout/navigation.jsp"></jsp:include>
	<div class="content-profile-page">
   <div class="profile-user-page card">
      <div class="img-user-profile">
        <img class="profile-bgHome" src="https://37.media.tumblr.com/88cbce9265c55a70a753beb0d6ecc2cd/tumblr_n8gxzn78qH1st5lhmo1_1280.jpg" />
        <img class="avatar" src="http://gravatar.com/avatar/288ce55a011c709f4e17aef7e3c86c64?s=200" alt="jofpin"/>
           </div>
          <button>Follow</button>
          <div class="user-profile-data">
            <h1>${userLogined.username }</h1>
            <p>${userLogined.email }</p>
            <p>Vai trò: ${userLogined.username=='admin'? 'Người quản trị':'Người dùng' }</p>
          </div> 
          <div class="description-profile">Front-end | Security Researcher | CSS Warrior | <a href="https://twitter.com/bullgit" title="bullgit"><strong>@bullgit</strong></a> | I love to create small things for the internet!</div>
       <ul class="data-user">
        <li><a><strong>3390</strong><span>Posts</span></a></li>
        <li><a><strong>718</strong><span>Followers</span></a></li>
        <li><a><strong>239</strong><span>Following</span></a></li>
       </ul>
      </div>
    </div>
<footer>
   <h4>Design by <a href="https://twitter.com/jofpin" target="_blank" title="José Pino">@jofpin</a></h4>
</footer>
</body>
</html>