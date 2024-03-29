<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/market.css">
<title>중고나라</title>
</head>
<body>
	<%
		String UserId = null;
		
		if(session.getAttribute("userId") != null) {
			UserId = (String) session.getAttribute("userId");
		}
	%>
	<div style="overflow: auto;">
		<nav>
			<ul class = "nav-container">
				<li class = "nav-item"><a href ="main.jsp">메인</a></li>
				<li class = "nav-item"><a href ="board.jsp">게시판</a></li>
                <%
					if(UserId == null) {
				%>
				<li class = "nav-item"><a href ="login.jsp">로그인</a></li>
                <li class = "nav-item"><a href ="register.jsp">회원가입</a></li>
				<%
					} else {
				%>
				<li class = "nav-item"><a href ="logout.jsp">로그아웃</a></li>
				<%
					}
				%>
			</ul>
		</nav>
		<div class = "write-main">
			<form method = "post" action = "writeAction.jsp">
			<div class = "headtext">
				<textarea name="boardTitle" class="htitle" rows="1" cols="55" 
				placeholder="제목" maxlength="27" required></textarea> 
				<!-- required: 필수 작성 요소 -->
			</div>
			<div class = "bodytext">
				<textarea name = "boardContent" class = "bcontent" placeholder = "내용"
				required></textarea>
			</div>
			<input type="file" name="image" class = "select"/></br>
			<div class = "butt">
			<button id="submit" class = "custombut">작성</button>
			</form>
			<button id="nonsubmit" class = "custombut"><a href = "board.jsp">취소</a></button>
			</div>
		</div>
	</div>
</body>
</html>