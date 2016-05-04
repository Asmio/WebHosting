var firstResult = 30;
var maxResults = 18;
$(function() {
   $(".home-button-addContent").click(function(){
   $.ajax({
          url: "getVideoContent",
          type: "GET",
          data: {firstResult: firstResult, maxResults: maxResults},
          cache: false,
          dataType:"json",
          success: function(data){
              if(data == 0){
                 $(".home-button-addContent").hide();
              }else{
            	  var count = 0;
            	  $.each(data, function(){
            		  var last = $('.home-content-cell').last();
            		  $(last).after('<div class="col-md-2 col-sm-4 col-xs-4 cols-xs-offset-4 home-content-cell" style="display: none;"><div class="home-content-cell-a"><a href="video/' + this.id + '"><img class="home-content-img" src="download/image?fileId=' + this.id + '"><img class="hide-img" src="resources/img/play.png"></a></div><a href="video/' + this.id + '" title="' + this.name + '" class="linkvideo-name">' + this.name + '</a><a href="user/' + this.username + '" title="' + this.username + '">' + this.username + '</a></div>');
            		  firstResult = firstResult + 1;
            		  count = count + 1;
            	  });
            	  if (count < maxResults){
            		  $(".home-button-addContent").hide();
            	  }
            	  $('.linkvideo-name').liTextLength({
            		    length: 35,
            		    afterLength: '...', 
            		    fullText:false
            	  });
            	  $('.home-content-cell').animate({height: 'show'}, 500);
              }
           }
        });
    });
});