<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>Main Page</h3>
<img alt="" src="${pageContext.request.contextPath }/resources/images/cat.jpg"><br><br>
<a href = "${pageContext.request.contextPath }/member/joinForm.do">ȸ�������ϱ�</a>
<!-- ��ۿ��� �� �����߿� �ϳ��� ��۸���Ʈ���� ��µȴ�-->
<c:choose>
<c:when test="${sessionScope.id eq board.writer }">
���� �� �� �̹Ƿ� ��д�۵� �ѷ��ִ� �������� ���
</c:when>
<c:otherwise>
���� �� ���� �ƴϹǷ� ��д���� �����ϴ� ������ ���
</c:otherwise>
</c:choose>
<!-- ��ۿ��� -->
</body>
</html>