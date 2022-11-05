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
		<div class = "write-main">
			<form>
			<div class = "headtext">
				<textarea name="title" class="htitle" rows="1" cols="55" 
				placeholder="제목" maxlength="27" required></textarea> 
				<!-- required: 필수 작성 요소 -->
			</div>
			<div class = "bodytext">
				<textarea name = "content" class = "bcontent" placeholder = "내용"
				required></textarea>
			</div>
			<input type="file" name="SelectFile" class = "select"/></br>
			<div class = "butt">
			<button type="submit" class = "custombut"><a href = "board.jsp">작성</a></button>
			<button type="submit" class = "custombut"><a href = "board.jsp">취소</a></button>
			</div>
			</form>
		</div>
	</div>
</body>
</html>