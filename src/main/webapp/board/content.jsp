<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	
	function deleteAction() {
		var check = confirm("삭제 하시겠습니까?");
		
		if(!check){
			return;
		}
		
		location.href = '/MyHome/board/delete.brd?seq=${dto.seq}';
	}
	
</script>
<%@include file="/layout/header.jsp"%>
<div align="center">
	<table class="table">
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
			<th>조회수</th>
			<td>${dto.hit }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.name }</td>
			<th>작성일</th>
			<td>${dto.logtime }</td>
		</tr>
		<tr>
			<td colspan="4">
				${dto.content }
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="3">
				<a href="/MyHome/board/fileDownload.brd?seq=${dto.seq }&filename=${dto.filename }">${dto.filename }</a>
				<!-- <a href="${pageContext.request.contextPath }/storage/${dto.filename}" download>${dto.filename }</a> -->
			</td>
		</tr>
	</table>
	<div class="button">
		<c:if test="${login == dto.id }">
			<input type="button" value="수정" onclick="location.href='/MyHome/board/update.brd?seq=${dto.seq}'">
			<input type="button" value="삭제" onclick="deleteAction()">
		</c:if>
		<input type="button" value="목록" onclick="location.href='/MyHome/board/list.brd'">
	</div>
</div>
<%@include file="/layout/footer.jsp"%>
















