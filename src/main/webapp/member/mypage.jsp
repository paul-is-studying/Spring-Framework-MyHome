<%@page import="member.memberdao.MemberDAO"%>
<%@page import="member.memberdto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "/layout/header.jsp" %>
<div align="center">
	<table style="width: 250px;">
		<tr>
			<td>번호</td>
			<td>${login.no }</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${login.id }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${login.name }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${login.email }</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${login.tel1 }-${login.tel2 }-${login.tel3 }</td>
		</tr>
	</table>
	<div style="width: 250px; padding-top: 20px;">
		<span style="float: right;">
			<input type="button" value = "수정" onclick="location.href = '/MyHome/member/updateForm.me'">
			<input type="button" value = "회원탈퇴" onclick="location.href = '/MyHome/member/deleteForm.me'">
		</span>
	</div>
</div>
<%@include file = "/layout/footer.jsp" %>