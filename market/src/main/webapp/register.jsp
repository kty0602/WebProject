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
            <form method = "post" action = "RegisterAction.jsp">
				<text class = "tt">*아이디</text>
                <input type = "text" placeholder = "아이디" name = "userId" class = "account">
                <text  class = "tt">*비밀번호</text>
				<input type = "password" placeholder = "비밀번호" name = "userPw" class = "account">
				<text  class = "tt">*사용할 닉네임</text>
				<input type = "text" placeholder = "닉네임" name = "userName" class = "account">
				<text  class = "tt">*이메일</text>
				<input type = "text" placeholder = "이메일" name = "userEmail" class = "account">
                <button id = "login" class = "button">회원 생성</button>
            </form>
            </div>
        </div>
    </div>    
</body>
</html>