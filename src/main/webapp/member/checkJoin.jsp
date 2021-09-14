<%@page import="member.memberdao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//MemberDTO dto = new MemberDTO();
	//dto.setId(request.getParameter("id"));
	//dto.setPassword(request.getParameter("password"));
	//dto.setName(request.getParameter("name"));
	//dto.setEmail(request.getParameter("email"));
	//dto.setTel1(request.getParameter("tel1"));
	//dto.setTel2(request.getParameter("tel2"));
	//dto.setTel3(request.getParameter("tel3")); 	
%>

<!-- 
	jsp액션 태그
	 - JAVA코드를 대신 적을수 있게 만드는 태그
	useBean - 클래스의 객체를 생성해주는 태그
		- id - 객체명
		- class - 사용할 클래스의 완전한 경로
		- scope - 사용할 범위 ... page,request,session,application
		
	setProperty - 객체의 멤버변수의 값을 파라미터값으로 넘어온 데이터를 셋팅해주는 태그
		- 자동으로 DTO의 setter와 연결되어 자동으로 데이터를 넣어준다..
		- property - 셋팅할 property명
		- name - 사용할객체명
-->
<jsp:useBean id="dto" class="member.memberdto.MemberDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<%
	MemberDAO dao = MemberDAO.getInstance();
	
	boolean check = dao.insert(dto);
	out.write("<script>");
	if(check){
		out.write("alert('회원 가입에 성공하셧습니다..로그인페이지로..');");
		out.write("location.href='/MyHome/login/login.jsp?id=" + dto.getId() + "';");
	}else{
		out.write("alert('회원가입에 실패하셨습니다...이전페이지로..');");
		out.write("history.back();");
	}
	out.write("</script>");	
%>













