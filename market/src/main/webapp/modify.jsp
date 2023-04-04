<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Board.BoardSite" %>
<%@ page import = "Board.BoardSiteDAO" %>
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
		if(UserId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}

	    int boardID = 0;
	    if(request.getParameter("BoardId") != null) {
	    	boardID = Integer.parseInt(request.getParameter("BoardId"));
	    }
		if(boardID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		
		BoardSite board = new BoardSiteDAO().getBoard(boardID);
	    
	    if(!UserId.equals(board.getUserId())) {
	    	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정권한이 없습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
	    }
	%>
	<div style="overflow:auto;">	
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
			<form method = "post" action = "modifyAction.jsp?BoardId=<%=board.getBoardId()%>">
			<div class = "headtext">
				<textarea name="boardTitle" class="htitle" rows="1" cols="55" 
				placeholder="제목" maxlength="27" required></textarea> 
				<!-- required: 필수 작성 요소 -->
			</div>
			<div class = "bodytext">
				<textarea name = "boardContent" class = "bcontent" placeholder = "내용"
				required></textarea>
			</div>
			<div class = "butt">
			<button id="submit" class = "custombut">수정하기</button>
			</div>
			</form>
		</div>	
	</div>
</body>
</html>