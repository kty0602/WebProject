<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Board.BoardSite" %>
<%@ page import = "Board.BoardSiteDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "board" class="Board.BoardSite" scope = "page"/>
<jsp:setProperty name = "board" property = "boardTitle"/>
<jsp:setProperty name = "board" property = "boardContent"/>
<jsp:setProperty name = "board" property = "image"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				script.println("alert('로그인 이후 이용가능한 서비스 입니다.')'");
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
			} else {
				if(board.getBoardTitle()==null || board.getBoardContent()==null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('모든 칸을 입력해주십시오.')'");
					script.println("history.back()");
					script.println("</script>");
				} else {
					BoardSiteDAO boardDao = new BoardSiteDAO();
					int result = boardDao.write(board.getBoardTitle(), UserId, board.getBoardContent(), board.getImage());
					if(result >= 0) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href = 'board.jsp'");
						script.println("</script>");
					} else if(result == -1) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 등록에 실패하였습니다.')'");
						script.println("history.back()");
						script.println("</script>");
					}
				}
			}
		%>
</body>
</html>