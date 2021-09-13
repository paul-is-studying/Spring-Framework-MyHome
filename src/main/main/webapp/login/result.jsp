<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/layout/header.jsp"%>
<div align="center">
	${msg }<br>
	<c:choose>
		<c:when test="${check }">
			MyPage | 회원탈퇴
		</c:when>
		<c:otherwise>
			ID찾기 | PW찾기
		</c:otherwise>
	</c:choose>
</div>
<%@include file="/layout/footer.jsp"%>