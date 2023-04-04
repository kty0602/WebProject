<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "Board.BoardSite"%>
<%@ page import = "Board.BoardSiteDAO"%>
<%@ page import = "java.util.ArrayList"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/market.css">
<title>중고나라</title>

<style type = "text/css">
	a, a:hover {
		color : #000000;
		text-decoration: none;
	}
</style>

</head>
<body>
	<%
		String UserId = null;
		
		if(session.getAttribute("userId") != null) {
			UserId = (String) session.getAttribute("userId");
		}
		
		int pageNumber = 1;
		
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
		<div class = "board-main">
		<h1 class = "h1">장터 게시판</h1>
			<Button class = "bt"><a href = "write.jsp">글쓰기</a></Button>
			<table class = "boardtable">
				<thead>
					<tr>
						<th style = "align-items: center;">번호</th>
						<th style = "align-items: center;">제목</th>
						<th style = "align-items: center;">작성자</th>
						<th style = "align-items: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
					BoardSiteDAO boardDao = new BoardSiteDAO();
					ArrayList<BoardSite> list = boardDao.getList(pageNumber);
					for(int i = 0; i<list.size(); i++) {
				%>
					<tr>
						<td><%= list.get(i).getBoardId() %></td>
						<td><a href="view.jsp?BoardId=<%=list.get(i).getBoardId()%>">
						<%=list.get(i).getBoardTitle()%></a></td>
						<td><%= list.get(i).getUserId() %></td>
						<td><%= list.get(i).getBoardDate().substring(0,11) +
						list.get(i).getBoardDate().substring(11,13) + ":" +
						list.get(i).getBoardDate().substring(14,16)%></td>
					</tr>
				<%
					}
				%>
				</tbody>	
			</table>	
			<%
				if(pageNumber != 1) {
			%>
			<Button class = "nextbt"><a href = "board.jsp?pageNumber=<%=pageNumber-1%>">이전</a></Button>	
			<%
				} if(boardDao.nextPage(pageNumber+1)){
			%>
			<Button class = "nextbt"><a href="board.jsp?pageNumber=<%=pageNumber+1%>">다음</a></Button>
			<%
			    }
			%>
		</div>
	</div>
</body>
</html>