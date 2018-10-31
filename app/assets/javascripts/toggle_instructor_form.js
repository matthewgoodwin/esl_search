$( document ).ready(function() {
  $('input[type=radio]').on('change',function() {
    $('input[name=name_of_your_radiobutton]:checked').val();
  });
});
