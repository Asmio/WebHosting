function addComment(){
	var idVideo = $(this).val();
	var parentDiv = $(this).parent().eq(0);
	var comment = $(parentDiv).find("textarea").val();
	$.ajax({
        url: 'addComment',
        data: ({comment : encodeURIComponent(comment), id : idVideo}),
        dataType:"json",
        success: function(data) {
        	if (data == null){
        		return;
        	} else {
        		$(parentDiv).find("textarea").val('');
        		$('.comments').empty();
        		$.each(data, function(){		
        			$('.comments').append('<div class="comment-div col-md-8 col-sm-8 col-xs-8"><img class="col-md-2 col-sm-2 col-xs-2" src="/hosting/resources/img/comment.png"><a class="comment-name col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-4 col-xs-offset-6" href="/hosting/user/' + this.userName + '" title="' + this.userName + '">' + this.userName + '</a><div class="col-md-10 col-sm-10 col-xs-10">' + this.value + '</div><div class="comment-div-time col-md-10 col-sm-10 col-xs-10">' + this.datePublication + '</div></div>');
          	  	});
        	}	
        }
	});
}

function deleteComment(){
	var idInput = $(this).find('.idVideo').eq(0);
	var idComment = $(idInput).val();
	var parentDiv = $(this).parent().eq(0);
	$.ajax({
        url: 'deleteComment',
        data: ({id : idComment}),
        success: function(data) {
        	if (data){
        		$(parentDiv).animate({height: 'hide'}, 500);
        	}	
        }
	});
}

$(function() {
	   $('.send-comment').on('click', addComment);
	   $('.comment-img-delete').on('click', deleteComment);
})