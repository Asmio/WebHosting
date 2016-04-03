function doAjax() {
    $.ajax({
        url: 'checkStrength',
        data: ({password : $('#password').val()}),
        success: function(data) {
          $('#strengthValue').html(data);
        }
      });
}

