<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join.css?ver=1">
<script type="text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/resources/js/member.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/resources/js/upload.js"></script>


</head>
<body>
<spring:hasBindErrors name="member" /> 
<form:errors path="member" />
	<!--��ܹ� ����-->
	<header>
		<h1>ȸ�������ϱ�</h1>
	</header>
	<!--��ܹ� ��-->
	
	<section>
		<h2 class="join_text">�ȳ��ϼ���?<br>
		<strong>���� �ٷ� SNS�� �����غ�����!</strong>
		</h2>
        <form class="join_wrap" action = "${pageContext.request.contextPath }/member/join.do" 
        method = "post" enctype="multipart/form-data">
        
        	<fieldset>
            	<div id="img">
            		<span id="imagePreview"></span>
            		<label for="image">
            			<span>
            				<input id="image" type="file" class="profile" name="file" onchange="InputImage();">
            			</span>
            		</label>
					
                </div>
                
                <div class="join_field">
                 
<!-- 					<span id="join_dup"> -->
<!-- 						<input type="button" value="�ߺ�üũ" id="dup"  -->
<%-- 						onclick = "idCheck(this.form.id.value, '${pageContext.request.contextPath}/member/idCheck.do')"> --%>
<!-- 					</span> -->
                
	                <span id="join1">	
	                    <input type="text" placeholder="  ���̵�" id="id" name = "id">
	                    					<span id="join_dup">
						<input type="button" value="�ߺ�üũ" id="dup" 
						onclick = "idCheck(this.form.id.value, '${pageContext.request.contextPath}/member/idCheck.do')">
					</span><br>
	                    
	                  
<!-- 	                    <div class="id_check" id = "id_check">        -->
	<%--                     <form:errors path = "member.id"/> --%>
<!-- 	                    </div> -->
	                    
	                    <input type="password" placeholder="   ��й�ȣ" name = "pwd" id = "pwd">
	                    <br><br><br><form:errors path = "member.pwd"/><br>
	                    
	                    <input type="text" placeholder="   �̸�" name = "name" id = "name">
	                    <br><form:errors path = "member.name"/><br>
	                    
	                    <input type="text" placeholder="   �̸���" name = "email" id = "email">
	                    <br><br><form:errors path = "member.email"/><br>
	                </span>
                    
                    <input type = "hidden" name = "isban" value = "f">
                </div>
                
                <div class="join_btn">
                <input type="submit" value="ȸ������" class="ok">
                <input type="button" value="���" class="cancel">
                </div>
            </fieldset>
        </form>
	</section>
	
	<footer>
		
	</footer>
</body>
</html>