# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $("#reports-datatable").DataTable({
    pagingType: "full_numbers",
    sPaginationType: "bootstrap"
    })


  $('#reports').collapse 'show'
  $("#reportsnav").addClass "active"

  $('#sandbox-container .input-daterange').datepicker
    format: 'dd-mm-yyyy'
    todayHighlight: true
