<%@page import="member.memberdao.MemberDAO"%>
<%@page import="member.memberdto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	MemberDTO dto = (MemberDTO)session.getAttribute("login");
	dto.setEmail(request.getParameter("email"));
	dto.setTel1(request.getParameter("tel1"));
	dto.setTel2(request.getParameter("tel2"));
	dto.setTel3(request.getParameter("tel3"));
	
	boolean check = MemberDAO.getInstance().updateMember(MemberDTO);
	
	
	out.write("<script>");
	if(check){
		session.setAttribute("login", dto);
		out.write("alert('수정완료!!MyPage로...');");
		out.write("location.href = '/MyHome/member/mypage.jsp';");
	}else{
		out.write("alert('수정실패!!이전페이지로...');");
		out.write("location.href = '/MyHome/member/updateForm.jsp';");
	}
	out.write("</script>");
	
%>