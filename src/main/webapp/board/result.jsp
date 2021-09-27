<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var = "msg">
	<c:choose>
		<c:when test="${status == 'write' }">글쓰기</c:when>
		<c:when test="${status == 'delete' }">글삭제</c:when>
		<c:when test="${status == 'update' }">글수정</c:when>
	</c:choose>
</c:set>

<c:choose>
	<c:when test="${check }">
		<script>
			alert('${msg } 완료');
			location.href = '${url }';
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('${msg } 실패');
			history.back();
		</script>
	</c:otherwise>
</c:choose>