'use strict';


$(() => {

  var forms = document.getElementsByClassName('needs-validation');

  var validation = Array.prototype.filter.call(forms, function(form) {
    form.addEventListener('submit', function(event) {
      if (form.checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
      } 
      form.classList.add("was-validated");
    });
  });

  $('.notes-edit').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.notes-desc').attr("hidden", "hidden");
    $(this).parent().parent().find('.notes-desc-form').removeAttr("hidden");
    $(this).parent().parent().find('.notes-edit-delete-buttons').attr("hidden", "hidden");
  });

  $('.notes-cancel').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().parent().parent().parent().parent().find('.notes-desc').removeAttr("hidden");
    $(this).parent().parent().parent().parent().parent().parent().find('.notes-desc-form').attr("hidden", "hidden");
    $(this).parent().parent().parent().parent().parent().parent().find('.notes-edit-delete-buttons').removeAttr("hidden");
  });

  $('.notes-delete').on('click', function(event) {
    let id = $(this).attr('data-note_id');
    let url = $('#notes-delete-form').attr("action");
    $('#notes-delete-form').attr("action", url+id);
  });

  $('.notes-save').on('click', function(event) {
    $(this).parent().parent().parent().parent().parent().find('.notes-edit-form').submit();
  });

  $('#ticketTab').on('click', () => {
    $('#notes').attr("hidden", "hidden");
    $('#notesTab').removeClass("active");
    $('#ticket').removeAttr("hidden");
    $('#ticketTab').addClass("active");
  }); 

  $('#notesTab').on('click', function(event) {
    $('#ticket').attr("hidden", "hidden");
    $('#ticketTab').removeClass("active");
    $('#notes').removeAttr("hidden");
    $('#notesTab').addClass("active");
  });

  $('.cancel-ticket').on('click', function(event) {
    event.preventDefault();
  });

  $('#dino_color').change(function(event) {
    if ($(this).val() === 'Yes') {
      $('.regions').removeAttr("hidden");
    } else if ($(this).val() === 'No') {
      $('.regions').attr("hidden", "hidden");
    }
  });

  $('.dinoColorPicker').change(function() {
    if ($(this).val() === 'na') {
    $(this).parent().find('.dinoColorBox').attr("hidden", "hidden");  
    } else {
      $(this).parent().find('.dinoColorBox').removeAttr("hidden");
      $(this).parent().find('.dinoColorBox').css("background-color", '#'+$(this).children('option:selected').attr("id"));
    }
  });

  $(function () {
    $('[data-toggle="popover"]').popover()
  });

  $('.popover-dismiss').popover({
    trigger: 'focus'
  });

  new ClipboardJS('.btn');

  $('#copy').on('click', function() {
    $(this).attr('aria-label', 'Command copied!');
    $(this).addClass('tooltipped')
    $(this).addClass('tooltipped-s')
  });

});

