<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function checkWrite() {
		if(document.write.title.value == ""){
			alert("제목을 입력하십시오!");
		}else if(document.write.content.value == ""){
			alert("내용을 입력하십시오!")
		}else{
			document.write.submit();
		}
	}
</script>
<%@include file = "/layout/header.jsp" %>
<div align="center">
	<form action="/MyHome/board/checkUpdate.brd" method="post" name = "write" >
		<input type="hidden" name="seq" value="${dto.seq }">
		<table class = "table">
			<tr>
				<th width="60">제목</th>
				<td><input type="text" value="${dto.title }" name = "title" size = "53"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="15" cols="65" name = "content">${dto.content }</textarea>
				</td>
			</tr>
		</table>
		<div class = "button">
			<input type="button" value="수정" onclick="javascript:checkWrite()">
		</div>
	</form>
</div>
<%@include file = "/layout/footer.jsp" %>