<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";

	Cookie[] cks = request.getCookies();
	
	boolean check = false;
	
	if(cks != null){
		for(Cookie ck : cks){
			if(ck.getName().equals("ckid")){
				id = ck.getValue();
				check = true;
				break;
			}
		}
	}
	
	request.setAttribute("id", id);
	request.setAttribute("check", check);
	
	pageContext.forward("/login/form.jsp");
	
%>