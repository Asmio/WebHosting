function deleteVideo(){
	var $childs=$(this).find('.idVideo').eq(0);
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
        	var $childCount = $(contentParent).find('.video-list-title').eq(0);
        	var str = $childCount.eq(0).text();
        	var newCount = parseInt(str.match(/\d+/ig), 10) - 1;
        	var newStr = str.split('(')[0] + '(' + newCount + ')';
        	$childCount.eq(0).text(newStr);
        }
	});
}

function showUserArea(){
	var str = $(".user-description-area").attr("placeholder");
	var text = $(this).text();
	if (str != text){
		$(".user-description-area").val(text);
	}
	$(this).animate({height: 'hide'}, 500);
	$(".user-description-cell").animate({height: 'show'}, 500);
}

function showVideoArea(){
	var descCell = $(this).siblings('.user-videodescription-cell').eq(0);
	var descArea = $(descCell).find('.user-videodescription-area').eq(0);
	var str = $(descArea).attr("placeholder");
	var text = $(this).text();
	if (str != text){
		$(descArea).val(text);
	}
	$(this).hide();
	$(descCell).animate({opacity: 'show'}, 500);
}

function showVideoNameArea(){
	var parent = $(this).parent().eq(0);
	var linkName = $(parent).find('.linkvideo-name').eq(0);
	$(linkName).hide();
	var nameCell = $(parent).find('.user-videoname-cell').eq(0);
	var nameArea = $(parent).find('.user-videoname-area').eq(0);
	$(nameArea).val($(linkName).text());
	$(nameCell).animate({opacity: 'show'}, 500);
}

function cancelUserArea(){
	$(".user-description-cell").animate({height: 'hide'}, 500);
	$(".user-description-content").animate({height: 'show'}, 500);
	$(".user-description-area").val('');
}

function cancelVideoArea(){
	var descCell = $(this).parent();
	var descContent = $(descCell).parent().find('.user-videodescription-content').eq(0);
	$(descCell).animate({opacity: 'hide'}, 500);
	$(descContent).show(1000);
	$(descCell).find('.user-videodescription-area').eq(0).val('');
}

function cancelVideoNameArea(){
	var nameCell = $(this).parent();
	$(nameCell).animate({opacity: 'hide'}, 500);
	var nameLink = $(this).parent().parent().find('.linkvideo-name').eq(0);
	$(nameLink).show(1000);
}

function addUserDescription(){
	var description = $(".user-description-area").val();
	description = $.trim(description);
	$.ajax({
        url: 'addUserDescription',
        data: ({description : encodeURIComponent(description)}),
        success: function(data) {
        	if (data == "true"){
        		var content = $(".user-description-content").eq(0);
            	$(content).text(description);
            	$(".user-description-cell").animate({height: 'hide'}, 500);
        		$(".user-description-area").val('');
        		$(content).animate({height: 'show'}, 500);
        	}
        }
	});
}

function blockUser(username,enabled){
	$.ajax({
        url: 'blockUser',
        data: ({username : encodeURIComponent(username), enabled : enabled}),
        success: function(data) {
        	if (data != null){
        		$(".block-button").text(data);
        	}
        }
	});
}

function addVideoDescription(){
	var description = $(this).parent().find('.user-videodescription-area').eq(0).val();
	description = $.trim(description);
	var parent = $(this).parents('.user-content-cell').eq(0);
	var child = $(parent).find('.user-hide-img-delete').eq(0);
	var id = $(child).find('.idVideo').eq(0).val();
	$.ajax({
        url: 'addVideoDescription',
        data: ({description : encodeURIComponent(description), id : id}),
        success: function(data) {
        	if (data == "true"){
        		var content = $(parent).find('.user-videodescription-content').eq(0);
        		if (description == ''){
        			$(content).text('...');
        		} else {
                	$(content).text(description);        			
        		}
            	$(parent).find('.user-videodescription-cell').eq(0).animate({opacity: 'hide'}, 500);
            	$(parent).find('.user-videodescription-area').eq(0).val('');
        		$(content).show(1000);
        	}
        }
	});
}

function addVideoName(){
	var nameVideo = $(this).parent().find('.user-videoname-area').eq(0).val();
	nameVideo = $.trim(nameVideo);
	var nameCell = $(this).parent().eq(0);
	var parentCell = $(nameCell).parent().eq(0);
	var nameLink = $(parentCell).find('.linkvideo-name').eq(0);
	if(nameVideo == ""){
		$(nameCell).animate({opacity: 'hide'}, 500);
		$(nameLink).show(1000);
		return;
	}
	var contentCell = $(parentCell).parent().eq(0);
	var id = $(contentCell).find('.idVideo').eq(0).val();
	$.ajax({
        url: 'setVideoName',
        data: ({nameVideo : encodeURIComponent(nameVideo), id : id}),
        success: function(data) {
        	if (data == "true"){
        		$(nameLink).text(nameVideo);
        		$(this).parent().find('.user-videoname-area').eq(0).val('');
        		$(nameCell).animate({opacity: 'hide'}, 500);
        		$(nameLink).animate({height: 'show'}, 500);
        	}
        }
	});
}

function isNotMax(e){
    e = e || window.event;
    var target = e.target || e.srcElement;
    var code=e.keyCode?e.keyCode:(e.which?e.which:e.charCode)

    switch (code){
        case 13:
        case 8:
        case 9:
        case 46:
        case 37:
        case 38:
        case 39:
        case 40:
        return true;
    }
    return target.value.length <= target.getAttribute('maxlength');
}

$(function() {
   $('.user-hide-img-delete').on('click', deleteVideo);
   $('.user-description-content').on('click', showUserArea);
   $('.user-description-cancel').on('click', cancelUserArea);
   $('.user-description-save').on('click', addUserDescription);
   $('.user-hide-img-settings').on('click', showVideoNameArea);
   $('.user-videoname-cancel').on('click', cancelVideoNameArea);
   $('.user-videoname-save').on('click', addVideoName);
   $('.user-videodescription-content').on('click', showVideoArea);
   $('.user-videodescription-cancel').on('click', cancelVideoArea);
   $('.user-videodescription-save').on('click', addVideoDescription);
})

