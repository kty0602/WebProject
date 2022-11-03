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
		<div class = "board-main">
		<h1 class = "h1">장터 게시판</h1>
			<Button class = "bt"><a href = "write.jsp">글쓰기</a></Button>	
			<table>
				<thead>
					<tr>
						<th style = "align-items: center;">번호</th>
						<th style = "align-items: center;">제목</th>
						<th style = "align-items: center;">작성자</th>
						<th style = "align-items: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>안녕하세요</td>
						<td>kty</td>
						<td>2022-11-01</td>
					</tr>
				</tbody>	
			</table>
		</div>
	</div>
</body>
</html>