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
	<div style="overflow:auto;">	
		<nav>
			<ul class = "nav-container">
				<li class = "nav-item"><a href ="main.jsp">메인</a></li>
				<li class = "nav-item"><a href ="board.jsp">게시판</a></li>
				<li class = "nav-item"><a href ="login.jsp">로그인</a></li>
                <li class = "nav-item"><a href ="register.jsp">회원가입</a></li>
			</ul>
		</nav>
		<div class = "con1" onClick="location.href='main.jsp'">
			<p class ="p">중고나라</p>  <!-- 배너 있으면 교체 -->
		</div>		
	</div>
</body>
</html>