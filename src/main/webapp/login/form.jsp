<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function check(f) {
		if(f.id.value == ""){
			alert("ID를 입력하십시오!");
			f.id.focus();
		}else if(f.password.value == ""){
			alert("PW를 입력하십시오!");
			f.password.focus();
		}else{
			f.submit();
		}
	}
</script>
<%@include file="/layout/header.jsp"%>
<div align="center">
	<form action="/MyHome/login/check.do" method="post" name="input">
		<table style="background-color: lightblue;">
			<tr>
				<th style="background-color: lightblue;">ID</th>
				<td><input type="text" name="id" value="${id }"></td>
			</tr>
			<tr>
				<th style="background-color: lightblue;">PW</th>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<th style="background-color: lightblue;" colspan="2">
					<span class="ckid">
						<c:choose>
							<c:when test="${check }">
								<input type="checkbox" name="ckid" value="x" checked="checked">
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="ckid" value="x">
							</c:otherwise>
						</c:choose>
						<font class="ckid_text">ID기억하기</font>	
					</span>
					
					<input type="button" value="Login" onclick="javascript:check(input)" style="float: right; margin:3px; background-color: white; font-style: italic; font-weight: bold;">
				</th>
			</tr>
		</table>
	</form>
</div>
<%@include file="/layout/footer.jsp"%>


















