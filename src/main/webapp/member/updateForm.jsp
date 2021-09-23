<%@page import="member.memberdao.MemberDAO"%>
<%@page import="member.memberdto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function check(){
		if(document.update.email.value == ""){
			alert("이메일을 입력하십시오!");
		}else if(document.update.tel1.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.update.tel2.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.update.tel3.value == ""){
			alert("전화번호를 입력하십시오!");
		}else{
			document.update.submit();
		}
	}
</script>
<%@include file = "/layout/header.jsp" %>
<div align="center">
	<form action="/MyHome/member/checkUpdate.me" method="post" name="update">
		<table style="width: 300px;">
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
				<td><input type="text" name = "email" value="${login.email }"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<select name = "tel1">
						<option value="010" selected="selected">010</option>
						<option value="010">011</option>
						<option value="010">016</option>
						<option value="010">019</option>
					</select>
					-<input type="text" size = "5" maxlength="4" value="${login.tel2 }" name = "tel2">
					-<input type="text" size = "5" maxlength="4" value="${login.tel3 }" name = "tel3">
				</td>
			</tr>
		</table>
		<div style="width: 300px; padding-top: 20px;">
			<span style="float: right;">
				<input type="button" value = "수정" onclick="javascript:check()">
				<input type="button" value = "돌아가기" onclick="history.back()">
			</span>
		</div>			
	</form>
</div>
<%@include file = "/layout/footer.jsp" %>