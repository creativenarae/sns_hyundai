$(function(){
	$(".like").click(function(){
                 $(this).toggleClass('like_c')
   });
	
    $('#id_field').keyup(function(e) {
        var inputlength= $(this).val().length;
		var remain=6 - inputlength;
		if(remain<=0){
			$('.id_check').css('background','url(img/check.png)')
			}else{
			$('.id_check').css('background','url(img/none.png)')
				}
    });
    
	$(".more").click(function(){
                 $(this).toggleClass('more_c')
                 var index = $('.more').index(this);
				 $('.sub').eq(index).slideToggle(200)
   });
	
	//---------------------------------------------------------------------댓글 등록 비동기
	$(".submit").click(function() {
//		var board_num = $(this).siblings(".board_num").val();
		var form_id = $(this).closest("form").attr("id");
		
//		var rep_type ="";
//		if($('input:checkbox[name="checkbox"]').is(":checked")) {
//			rep_type = 1;
//		} else {
//			rep_type = 0;
//		}

		$("#"+form_id).on("click", ".submit", function(event) {
			var writer = $("input[name=writer]");
			alert(writer);
			event.preventDefault();
//			alert(params);
			$.ajax({
				url: '/sns/boardRep/writeRep.do',
				type: 'POST',
				data: params,
				success: function(response) {
					console.log(response);
				}
				
			});
		});
//		alert(form_id);
		
	});
	
	
	//----------------------------------------------------------------------댓글 삭제 비동기
	$(".delete_rep").click(function() {
		
		var div_id = $(this).closest("div").attr("id");
//		alert(div_id);

		$("#"+div_id).on('click', ".delete_rep", function() {
//			alert("추가가 되나");
			data = {};
			data["rep_num"] = $(this).parent().children('.rep_num').val();
			var board_num = $(this).parent().children('.board_num').val();
			data["board_num"] = board_num;
			var id = $(this).parent().children('.member_id').val();
			alert(board_num);
	
			$.ajax({
				url: '/sns/boardRep/deleteRep.do',
				data: JSON.stringify(data),
				dataType: 'JSON',
			    contentType: 'application/json;charset=UTF-8',
				type: 'POST',
				success: function(response) {
					
					console.log(response);
					
					repStr="<ul>";
			
					$.each(response, function(index, value) {
						repStr+="<li>"+value.writer+" : "+value.content+"</li>";
						
						if(id == value.writer) {
							repStr+="<li><input type='button' class='delete_rep' value='delete' /><input type='hidden' class='rep_num' value='"+value.num+"'/><input type='hidden' class='board_num' value='"+value.board_num+"'/><input type='hidden' class='member_id' value='"+id+"'/></li>";
			            
						}
						
						console.log(repStr);
					});
					
					repStr+="</ul>";	
					$('#rep_view_'+board_num).html(repStr);
					
				}
	
			
			});

		});
		
	});
	
	
	//--------------------------------------------------------------댓글 수정 비동기
	$('.update_rep').click(function() {
		alert("update");
	});

});

