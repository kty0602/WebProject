<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Board.BoardSiteDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "Board.BoardSite"%>
<% 
request.setCharacterEncoding("UTF-8"); 
%>
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
			script.println("alert('로그인 이후 사용가능합니다.')");
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
		
		BoardSiteDAO boardDAO = new BoardSiteDAO();
	    BoardSite board = new BoardSite();
	    board = boardDAO.getBoard(boardID);
		
	    if(!UserId.equals(board.getUserId())) {
	    	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정권한이 없습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
	    } else {
	    	if(request.getParameter("boardTitle") == null ||
	    			request.getParameter("boardContent") == null ||
	    			request.getParameter("boardTitle").equals("") ||
	    			request.getParameter("boardContent").equals("")) {
	    		PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 칸을 입력해주세요.')");
				script.println("history.back()");
				script.println("</script>");
	    	} else {
	    		BoardSiteDAO boardDao = new BoardSiteDAO();
	    		int result = boardDao.modify(boardID,
	    				request.getParameter("boardTitle"), request.getParameter("boardContent"));
	    		
	    		if(result >= 0) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'board.jsp'");
					script.println("</script>");
				} else if(result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패하였습니다.')'");
					script.println("history.back()");
					script.println("</script>");
				}
	    	}
	    }
	%>
</body>
</html>