<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class="User.User" scope = "page"/>
<jsp:setProperty name = "user" property = "userId"/>
<jsp:setProperty name = "user" property = "userPw"/>
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
		
		if(UserId != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있는 사용자입니다.'+userId+')'");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		
		UserDAO userDao = new UserDAO();
		int result = userDao.login(user.getUserId(), user.getUserPw());
		
		if(result == 1) {
			session.setAttribute("userId", user.getUserId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}else if(result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 일치하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류 발생.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>