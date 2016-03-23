// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// Adding js files in this folder is already enough, so don't add anymore lines here.
//
//= require jquery
//= require best_in_place
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require underscore
//= require json2
//= require judge
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require turbolinks
//= require toastr
//= require datatables-bootstrap
//= require datatables-buttons
//= require datatables
//= require material-bonus
//= require selectize
//= require bootstrap-datepicker
//= require twitter/bootstrap/rails/confirm
//= require maskedinput
//= require bootstrap-modal
//= require bootstrap-modalmanager

$(document).ready(function() {
  toastr.options = {
    "closeButton": false,
    "debug": false,
    "positionClass": "toast-bottom-left",
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  };
});

$(document).ready(function() {
  jQuery(".best_in_place").best_in_place();
});

$(document).ready(function () {
  $('[data-toggle="offcanvas"]').click(function () {
    $('.row-offcanvas').toggleClass('active');
  });
});

function remove_fields (link){
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".fields").hide();
}

<<<<<<< HEAD
$.rails.allowAction = function(link){
    if (link.data("confirm") == undefined){
        return true;
    }
    $.rails.showConfirmationDialog(link);
    return false;
}
//User click confirm button
$.rails.confirmed = function(link){
    link.data("confirm", null);
    link.trigger("click.rails");
}
//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
    var message = link.data("confirm");
    $.fn.SimpleModal({
        model: "modal",
        title: "Please confirm",
        contents: message
    }).addButton("Confirm", "button alert", function(){
        $.rails.confirmed(link);
        this.hideModal();
    }).addButton("Cancel", "button secondary").showModal();
}
=======
$.fn.twitter_bootstrap_confirmbox.defaults = {
    fade: true,
    title: "Confirmation", // if title equals null window.top.location.origin is used
    cancel: "Cancel",
    cancel_class: "btn cancel",
    proceed: "DELETE",
    proceed_class: "btn proceed btn-danger",
    modal_class: ""
};
>>>>>>> 8ef1bfbb9f06ba7d1dd611dcda951dbbc995f799
