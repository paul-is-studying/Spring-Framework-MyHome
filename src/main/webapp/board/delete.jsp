<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function checkDelete() {
		
	}
</script>
<%@ include file="/layout/header.jsp" %>
<div align="center">
	<form action="/MyHome/board/checkWrite.brd" method="post" name = "write"
						enctype="multipart/form-data"> <!-- 데이터까지 전송 -->
		<table class = "table">
			<tr>
				<th width="60">제목</th>
				<td><input type="text" name = "title" size = "53"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="15" cols="65" name = "content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="file" name = "filename" size = "400">
				</td>
			</tr>
		</table>
		<div class = "button">
			<input type="button" value="쓰기" onclick="javascript:checkWrite()">
		</div>
	</form>
</div>
<%@ include file="/layout/footer.jsp" %>
