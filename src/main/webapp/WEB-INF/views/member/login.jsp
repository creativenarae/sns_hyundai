<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>sns</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/index.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/resources/js/member.js"></script>
</head>

<body>
	<!--��ܹ� ����-->
	<header>
		<h1>�α���</h1>
		
	</header>
	<!--��ܹ� ��-->
	
	
	<section>
        <form method="post" action="${pageContext.request.contextPath }/member/login.do" class="login_wrap">
        	<fieldset class="id">
               		<legend>ID</legend>
                	<input type="text" placeholder="���̵�" id="id_field" required autocomplete="on" name = "id">
			</fieldset>
			<fieldset class="pw">
                <legend>PW</legend>
                <input type="password" placeholder="��й�ȣ" name = "pwd">
			</fieldset>
           	<fieldset class="checkbox">
            <input type="checkbox" value="���̵�����"><p id="id_save">���̵�����</p>
			<input type="checkbox" value="��й�ȣ����"><p>��й�ȣ����</p>
           </fieldset>            
			<fieldset class="join_btn">
                	<input type="submit" value="�α���" class="ok">
                	<input type="button" value="ȸ������" class="cancel" onclick = "joinFormGo('${pageContext.request.contextPath}/member/joinForm.do')">
			</fieldset>            
        </form>
        <a><p>���̵�/��й�ȣ ã��</p></a>
	</section>
	
	<footer>
		
	</footer>
</body>
</html>
