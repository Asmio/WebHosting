function addComment(){
	var idVideo = $(this).val();
	var parentDiv = $(this).parent().eq(0);
	var comment = $(parentDiv).find("textarea").val();
	$.ajax({
        url: 'addComment',
        data: ({comment : encodeURIComponent(comment), id : idVideo}),
        success: function(data) {
        	console.log(data);
        }
	});
}

$(function() {
	   $('.send-comment').on('click', addComment);
})