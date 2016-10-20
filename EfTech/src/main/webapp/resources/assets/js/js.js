function chg(id){
    	var el = document.getElementById("foto_product");
    	el.src = id.src;
}

$('.input-number').bind("change keyup input click", function() {
    if (this.value.match(/[^0-9]/g)) {
        this.value = this.value.replace(/[^0-9]/g, '');
    }
});

function initPage(){
	$("#thicknessSlider").slider({});
	$("#lengthSlider").slider({});
	$("#weightSlider").slider({});
	$("#laminatedSlider").slider({});
	$("#priceSlider").slider({});
}

function updateCompareList(product, id){
	$.ajax({
        url: window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)) + '/updateCompareList',
        data: ({product : product, id : id}),
        success: function(data) {
        	if (data == null){
        		return;
        	} else {
        		if(data == "0"){
        			$('.compare-list-size').text("");
        		} else {
            		$('.compare-list-size').text(data);	
        		}
        	}	
        }
	});
}

function changeTheNumberOf(element, operation, product, id){
	$.ajax({
        url: window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)) + '/cart/changeTheNumberOf',
        data: ({operation : operation, product : product, id : id}),
        success: function(data) {
        	if (data == null){
        		return;
        	} else {
        		$(element).parents('.cart-item').find('.price').text(data[1] + ' * ' + data[0] + ' = ' + (data[1] * data[0]) + '$ ');
        		$('body').find('.the-whole-order').text(data[3] + '$');
        		$('body').find('.basket-item-count').find('.count').text(data[2]);
        		$('body').find('.total-price-basket').find('.total-price').find('.value').text(data[3]);
        		if(operation == "plus"){
        			if(data[0] == 2){
        				$(element).siblings(".minus").removeClass('noLink');
        			}
        		}
        		if(operation == "minus"){
        			if(data[0] == 1){
        				$(element).addClass('noLink');
        			}
        		}
        	}	
        }
	});
}

function updateCart(){
	$.ajax({
        url: window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)) + '/cart/updateCart',
        success: function(data) {
        	if (data == null){
        		return;
        	} else {
        		$('.total-price-basket').append('<span class="total-price"><span class="value">' + data[1] + '</span><span class="sign">$</span></span>');
        		$('.count').text(data[0]);
        		$('.img-update-cart').remove();
        	}	
        }
	});
}

function addToCart(product, id){
	$.ajax({
        url: window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)) + '/cart/addToCart',
        data: ({product : product, id : id}),
        success: function(data) {
        	if (data == null){
        		return;
        	} else {
        		$('.total-price').children('.value').text(data[1]);
        		$('.count').text(data[0]);
        	}	
        }
	});
}

$(document).ready(initPage());
