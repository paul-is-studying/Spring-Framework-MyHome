<%@page import="member.memberdao.MemberDAO"%>
<%@page import="member.memberdto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	MemberDTO dto = (MemberDTO)session.getAttribute("login");
	String password = request.getParameter("password");
	
	if(!dto.getPassword().equals(password)){
		out.write("<script>");
		out.write("alert('비밀번호가 틀렸습니다.!!이전페이지로....');");
		out.write("history.back();");
		out.write("</script>");
	}else{
		MemberDAO dao = MemberDAO.getInstance();
		boolean check = dao.deleteMember(dto.getNo());
		if(check){
			session.invalidate();
			out.write("<script>");
			out.write("alert('탈퇴성공!!!인덱스페이지로...');");
			out.write("location.href = '/MyHome/';");
			out.write("</script>");
		}else{
			out.write("<script>");
			out.write("alert('탈퇴실패!!잠시후에 다시 시도하십시오..이전페이지로....');");
			out.write("history.back();");
			out.write("</script>");
		}
		
	}
	
%>












