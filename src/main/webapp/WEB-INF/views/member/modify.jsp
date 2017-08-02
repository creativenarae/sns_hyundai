<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>sns</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/modify_reset.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/modify.css?ver=4">
<script src="${pageContext.request.contextPath }/resources/js/index.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/resources/js/upload.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		$('.ok').click(function() {
			var src = $('#image').val();
			if(src == null) {
				alert("�����");
			}
			
		});
	});

</script>
</head>
<body>
   <!--��ܹ� ����-->
   <header>
      <h1>ȸ������</h1>
      
   </header>
   <!--��ܹ� ��-->
   
   
   <section>
      <h2 class="modify_text">ȸ������ ������ ����<br><strong>�����ϰ� �������ּ���!</strong></h2>
        <form class="modify_wrap" action="${pageContext.request.contextPath }/member/modify.do" method = "post" enctype="multipart/form-data">
        
           <fieldset>
               <div id="modify_img">
                  <span id="imagePreview" style="background:url('/sns/resources/images/member_img/${member.img }'); background-size:235px 235px">
                  </span>
               <span>
               <input id="image" type="file" class="profile" name="file" onchange="InputImage();">
               </span>
                </div>

           	
          
                 <div class="modify_field">
                <fieldset class="id">
                    <legend>ID</legend> 
                    <input type="text" name="id"  value="${member.id }" readOnly><br>
                 </fieldset>
                 
                 <fieldset class="pwd">
                 	<legend>PWD</legend>
                 	<input type="text" name="pwd" value="${member.pwd }"><br>
                 </fieldset>
                 
                 <fieldset class="name">
                 	<legend>NAME</legend>
                 	<input type="text" name="name" value="${member.name }" readOnly><br>
                 </fieldset>
                 
                 <fieldset class="email">
                 	<legend>EMAIL</legend>
                 	<input type="text" name="email" value="${member.email }">
                 </fieldset>

<%--                     <input type="hidden" name="img" value="${member.img }"/> --%>
                    <input type="hidden" name="isban" value="${member.isban }"/>
                </div>
                
                <div class="modify_btn">
                <input type="submit" value="�����Ϸ�" class="ok">
                <input type="button" value="Ż���ϱ�" class="cancel" onclick="location.href='${pageContext.request.contextPath}/member/out.do'">
                </div>
            </fieldset>
        </form>
   </section>
   
   <footer>
      
   </footer>
</body>
</html>