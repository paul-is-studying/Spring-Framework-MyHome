<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	boolean check = false;

	if(id == null){
		id = "";
		
		Cookie[] cks = request.getCookies();
		
		
		
		if(cks != null){
			for(Cookie ck : cks){
				if(ck.getName().equals("ckid")){
					id = ck.getValue();
					check = true;
					break;
				}
			}
		}
	}
	
	request.setAttribute("id", id);
	request.setAttribute("check", check);
	
	pageContext.forward("/login/form.jsp");
	
%>