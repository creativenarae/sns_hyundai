<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
<c:forEach var="list" items="${block_List }" varStatus="loop">
{num:'${list.num }', target:'${list.target }', img:'${list.member.img }'} 
<c:if test="${loop.index != 0 }">,</c:if>
</c:forEach>
]
