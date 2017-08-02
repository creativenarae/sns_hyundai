$('.btn_1').click(function() {
	
	$('#block_List').empty();
	
	var index = $('#num').val();
	$.ajax({
		url: '${pageContext.request.contextPath }/member/unblock.do?num=${list.num}',
		type: 'POST',
		dataType:'JSON',
		data: {num:index},
		success: function(data) {
			var str="";
			str+="<ul>";
			var jdata=JSON.parse(data);
			console.log(jdata);
			
			$.each(jdata, function(key, value) {
				str+="<li class='user'><img src='/sns/resources/images/member_img/'";
				str+=value.img;
				str+="'></li><li><a href='#'>";
				str+=value.target;
				str+="</a></li><a></a><li class='btn_1'>해제</li><input type='hidden' name='num' id='num' value='";
				str+=value.num;
				str+="></a>";
			});
			
			str+="</ul>";
			$('#block_List').append(str);
		
		}
		
	});
});