<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>sns</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/write.css?ver=22">
<script type="text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/index.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/write_upload.js?ver=2"></script>
<style type="text/css">
     
   
  </style>

</head>

<body>
	<!--��ܹ� ����-->
	<header>
		<h1>�۾���</h1>
		
	</header>
	<!--��ܹ� ��-->
	
	
	<div class="wrap">
        <form method="post" action="${pageContext.request.contextPath }/board/write.do"  enctype="multipart/form-data">
           	<div class="clearFix"><!-- form ��ü --> 
           		 <div class="sideL"> <!-- ���� �κ� : select 2��, �̹��� ����, �̹��� input -->
					<input type="hidden" name="writer" value="${member.id }" />
				
					<select name="type">
						<option value="">�� ��������</option>
						<option value="0">��������</option>
						<option value="1">ģ��������</option>
						<option value="2">��ü����</option>
					</select>
					
					<select name="category">
						<option value="">������</option>
						<option value="0">��ġ</option>
						<option value="1">��ȸ</option>
						<option value="2">������</option>
					</select>
					
					<div class="box1"><!-- sideL div�ȿ� �ִ� box(div) -->
						<span id="imagePreview" style="background-color:#fcfcfc; size:250px 320px"></span>
						<input id="image" type="file" class="profile" name="file" onchange="InputImage();"/>
                 	 </div>
                 	 
                 </div><!-- col1 sideL -->
                 
                 <div class="box2 sideR">
                 	<textarea name="content" placeholder="���� �ۼ��ϼ���..." required></textarea>
                 </div>
                 
		   </div><!-- clearFix -->
		   <div class="write_btn"><input type="submit" value="Ȯ��"/></div>      
        </form>
	</div><!-- wrap -->

	<footer>
		
	</footer>
	
</body>
</html>