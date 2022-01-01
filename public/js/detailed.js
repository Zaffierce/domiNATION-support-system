'use strict';

$(() => {
  
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

  $('.cancel-ticket').on('click', function(event) {
    event.preventDefault();
  });

  $('#save-pat-dino-form').bootstrapValidator();

})