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

function showArea(){
	$(this).animate({height: 'hide'}, 500);
	$(".user-description-cell").animate({height: 'show'}, 500);
}

function cancelArea(){
	$(".user-description-cell").animate({height: 'hide'}, 500);
	$(".user-description-content").animate({height: 'show'}, 500);
	$(".user-description-area").val('');
}

function addDescription(){
	var description = $(".user-description-area").val();
	description = $.trim(description);
	if (description == ""){
		$(".user-description-cell").animate({height: 'hide'}, 500);
		$(".user-description-area").val('');
		$(".user-description-content").animate({height: 'show'}, 500);
		return;
	}
	$.ajax({
        url: 'addDescription',
        data: ({description : encodeURIComponent(description)}),
        success: function(data) {
        	if (data == "true"){
        		var content = $(".user-description-content").eq(0);
            	$(content).removeClass('user-description-content');
            	$(content).addClass('user-description-content2');
            	$(content).text(description);
            	$(".user-description-cell").animate({height: 'hide'}, 500);
        		$(".user-description-area").val('');
        		$(content).animate({height: 'show'}, 500);
        	}
        }
	});
}

$(function() {
   $('.user-hide-img-delete').on('click', deleteVideo);
   $('.user-description-content').on('click', showArea);
   $('.user-description-cancel').on('click', cancelArea);
   $('.user-description-save').on('click', addDescription);
})