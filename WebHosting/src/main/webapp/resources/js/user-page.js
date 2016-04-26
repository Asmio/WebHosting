function deleteVideo(){
	var $childs=$(this).children('.idVideo');
	var spanId=$childs.eq(0).val();
	var parentTag = $(this).parent();
	var tagDiv = '<div class="col-md-12 col-sm-12 col-xs-12 user-hide-block"></div>';
	$(parentTag).append(tagDiv);
	var hg = $(parentTag).outerHeight();
	$(".user-hide-block").height(hg);
	$(this).hide();
	$(parentTag).fadeTo(500, 0.4);
	$.ajax({
        url: 'deleteVideo',
        data: ({idVideo : spanId}),
        success: function(data) {
        	$("#test").text(data);
        	$(parentTag).animate({height: 'hide', width: 'hide'}, 500);
        	var contentParent = $(parentTag).parent(); 
        	var $childCount = $(contentParent).children('.video-list-title');
        	var str = $childCount.eq(0).text();
        	var newCount = parseInt(str.match(/\d+/ig), 10) - 1;
        	var newStr = str.split('(')[0] + '(' + newCount + ')';
        	$childCount.eq(0).text(newStr);
        }
	});
}

$(function() {
   $('.user-hide-img-delete').on('click', deleteVideo);
})