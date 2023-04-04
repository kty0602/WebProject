<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "Board.BoardSite"%>
<%@ page import = "Board.BoardSiteDAO"%>
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
		
		BoardSiteDAO boardDAO = new BoardSiteDAO();
	    BoardSite board = new BoardSite();
	    board = boardDAO.getBoard(boardID);
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
		
		<!-- 게시판 글이 보이는 부분 -->
		<div class = "view-main">
		  
			<table class = "viewtable">
				<thead>
				    <tr><th colspan ="3">게시판 글</th></tr>
				</thead>
				<tbody>
					<tr> <!-- 글 제목 -->
					    <td style = "width:200px">글 제목</td>
						<td colspan="2">
						<%=
						board.getBoardTitle().replaceAll(" ","&nbsp;").replaceAll("<",
								"&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")
						%>
						</td>
					</tr>

					<tr> <!-- 글 작성자 -->
						<td>작성자</td>
						<td colspan="2">
						<%=board.getUserId()%>
						</td>
					</tr>
					
					<tr> <!-- 글 내용 -->
						<td colspan="3">
						<%=
						board.getBoardContent().replaceAll(" ","&nbsp;").replaceAll("<",
								"&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")
						%>
						</td>
					</tr>
				</tbody>
			</table>	
			<div class = "butt">
				<Button class = "viewcustombut"><a href="board.jsp">목록</a></Button>
				<%
					if(UserId != null && UserId.equals(board.getUserId())) {
				%>
				<Button class = "viewcustombut"><a href = "modify.jsp?BoardId=<%=boardID%>">수정</a></Button>
				<Button class = "viewcustombut"><a onclick = "return confirm('삭제하시겠습니까?')" href = "deleteAction.jsp?BoardId=<%=boardID%>">삭제</a></Button>
				<%		
					}
				%>
		    </div>
	</div>	
</body>
</html>