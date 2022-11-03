<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/market.css">
<title>중고나라</title>
</head>
<body>
    <div style="overflow: auto;">
		<nav>
			<ul class = "nav-container">
				<li class = "nav-item"><a href ="main.jsp">메인</a></li>
				<li class = "nav-item"><a href ="board.jsp">게시판</a></li>
                <li class = "nav-item"><a href ="login.jsp">로그인</a></li>
                <li class = "nav-item"><a href ="register.jsp">회원가입</a></li>
			</ul>
		</nav>
		<div class = "register-main">
            <h1 class = "logo">회원가입</h1>
            <div class = "register-container">
				<text class = "tt">*로그인</text>
                <input type = "text" placeholder = "아이디" id = "r_id" class = "account">
                <text  class = "tt">*비밀번호</text>
				<input type = "password" placeholder = "비밀번호" id = "r_password" class = "account">
				<text  class = "tt">*사용할 닉네임</text>
				<input type = "text" placeholder = "닉네임" id = "r_name" class = "account">
				<text  class = "tt">*이메일</text>
				<input type = "text" placeholder = "이메일" id = "r_email" class = "account">
                <button id = "login" class = "button">회원 생성</button>
            </div>
        </div>
    </div>    
</body>
</html>