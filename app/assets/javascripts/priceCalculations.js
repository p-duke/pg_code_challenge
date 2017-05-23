// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {

  // Post new calculation
  $('.container').on('submit','#calculation-form', function(event){
    event.preventDefault();

    $('#total-cost-list').remove();

    $.ajax({
      method: "POST",
      url: window.location.origin + "/price_calculations",
      data: $(event.target).find('textarea').serialize()
    }).done(function(response){
      $('.container .calculation-total').append(response);
    });
  });
});
