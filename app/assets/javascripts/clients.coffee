# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $("#clientdatatable").DataTable({
  pagingType: "full_numbers",
  sPaginationType: "bootstrap",
  "aoColumnDefs": [
    { 'bSortable': false, 'aTargets': [ -1 ] }
    ]
  })

  $('#clients').collapse 'show'
