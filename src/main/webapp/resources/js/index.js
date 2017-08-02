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
		
	//----------------------------------------------------------------------댓글 삭제 비동기
	$('.delete_rep').click(function() {
		
		var div_id = $(this).closest("div").attr("id");
//		$('#'+div_id).remove();
//		$("#"+div_id).trigger('click');
//		alert("div_id");
		
		$("#"+div_id).on('click', '.delete_rep', function() {
			alert("추가가 되나");
			var board_num = $(this).siblings(".board_num").val();
			var rep_num = $(this).siblings(".rep_num").val();
			var id = $(this).siblings(".member_id").val();
			alert(board_num+" "+rep_num+" "+id);
			data = {};
			data["rep_num"] = rep_num;
			data["board_num"] = board_num;
			
//			alert(board_num);

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
							repStr+="<li><input type='button' class='delete_rep' value='delete' /><input type='hidden' class='rep_num' value='";
							repStr+=value.num;
							repStr+="'/><input type='hidden' class='board_num' value='";
							repStr+=value.board_num;
							repStr+="'/><input type='hidden' class='member_id' value='";
							repStr+=id;
							repStr+="'/></li>";
						}//if
						
						console.log(repStr);
					});//each
					repStr+="</ul>";	
					$('#'+div_id).html(repStr);
				}//success
					
				
		});//ajax

					
					
				
			});//on 'click'
	});//click

	//--------------------------------------------------------------댓글 수정 비동기
	$('.update_rep').click(function() {
		alert("update");
	});

});


//---------------------------------------------------------------------댓글 등록 비동기
function write_rep(board_num, id, content) {
//testing
//	var form_id = $(this).closest("form").attr("id");
	
//	$("#"+form_id).one('click', '.write_rep', function() {
//		$("#"+form_id).off('click', '.write_rep');
		var rep_type ="";
		if($('input:checkbox[name="checkbox"]').is(":checked")) {
			rep_type = 1;
		} else {
			rep_type = 0;
		}
		
		data = {};
//		var board_num = $(this).siblings(".board_num").val();
		data["board_num"] =  board_num;
		data["content"] =  content;
		data["rep_type"] = rep_type;
//	 	alert("board_num : "+board_num+" content : "+content+" rep_type :"+rep_type);

			$.ajax({
				url: '/sns/boardRep/writeRep.do',
				data: JSON.stringify(data),
				dataType: 'JSON',
			    contentType: 'application/json;charset=UTF-8',
				type: 'POST',
				success: function(response) {
					console.log(response);
					var body="";
					body+="<li>"+response.writer+" : "+response.content+"</li>";
					
					if(id == response.writer) {
						body+="<li><input type='button' class='delete_rep' value='delete' /><input type='hidden' class='rep_num' value='";
						body+=response.num;
						body+="'/><input type='hidden' class='board_num' value='";
						body+=response.board_num;
						body+="'/><input type='hidden' class='member_id' value='";
						body+=id;
						body+="'/></li>";
		            
					}
//					console.log(body);
					$("#rep_view_"+board_num).append(body);
				}//success
			});
			
//	});//on click
//});//click
}
	


