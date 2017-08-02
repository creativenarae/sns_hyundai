<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>sns</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/block_list.css?ver=5">
<script type="text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#block_List').on('click' ,'li.btn', function() {
		
		var index = $(this).children('.num').val(); 
	 	
// 	 	$('#block_List').empty();
		
	 	$.ajax({
	 		url: '${pageContext.request.contextPath }/member/unblock.do',
	 		type: 'POST',
	 		dataType:'JSON',
	 		data: {num:index},
	 		success: function(response) {
	 			var str="";
	 			str+="<ul>";
// 	 			var jdata=JSON.parse(data);
// 	 			console.log(jdata);
	 			$.each(response, function(index, value)  {
	 				str+="<img src='/sns/resources/images/member_img/";
	 				str+=value.img;
	 				str+="'><li><a href='#'>";
	 				str+=value.target;
	 				str+="</a></li><li class='btn'>����<input type='hidden' name='num' class='num' value='";
	 				str+=value.num;
	 				str+="'></li>";
	 				console.log(str);
	 			});
				
	 			str+="</ul>";
	 			$('#block_List').html(str);
			
	 		}
			
	 	});
	});
});


</script>
</head>

<body>
	<!--��ܹ� ����-->
	<header>
		<h1>�Ű���</h1>
		
	</header>
	<!--��ܹ� ��-->
	
	
	<section>
       <div class="frends_wrap">
			<div class="frends">
				 <p class="p">���ܳ���</p>
					 <div id="block_List">
						 <ul>
						  <c:forEach var="list" items="${blockList }">
						 	<img src="/sns/resources/images/member_img/${list.member.img }">
						 	<li><a href="#">${list.target }</a></li>
						 	<li class="btn">����
						 	<input type="hidden" class="num" value="${list.num }"/></li>
						 </c:forEach>
						 </ul>
					 </div>
			</div>
        </div>
       
	</section>
	
	
	
	
	<footer>
		
	</footer>
</body>
</html>