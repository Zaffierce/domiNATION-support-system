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
    }, false);
  });

  $('#dino_color').change(function(event) {
    if ($(this).val() === 'yes') {
      $('.regions').removeAttr("hidden");
    } else if ($(this).val() === 'no') {
      $('.regions').attr("hidden", "hidden");
    }
  });

  $('.dinoColorPicker').change(function(event) {
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

  $('.delete-server').on('click', () => {
    return confirmDeletion();
  });

  $('.delete-dinosaur').on('click', () => {
    return confirmDeletion();
  });

  $('.delete-dinosaur-color').on('click', () => {
    return confirmDeletion();
  });

  $('.confirm-add-server').on('click', () => {
    return confirmAdd();
  });

  $('.confirm-add-dinosaur').on('click', () => {
    return confirmAdd();
  });

  $('.confirm-add-dinosaur-color').on('click', () => {
    return confirmAdd();
  });

  $('.add-server').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.add-server-form').removeAttr("hidden");
    $(this).parent().attr("hidden", "hidden");
  });

  $('.add-dinosaur').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.add-dinosaur-form').removeAttr("hidden");
    $(this).parent().attr("hidden", "hidden");
  });

  $('.add-dinosaur-color').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.add-dinosaur-color-form').removeAttr("hidden");
    $(this).parent().attr("hidden", "hidden");
  });

  $('.cancel-add-dinosaur-color').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.add-dinosaur-color-div').removeAttr("hidden");
    $(this).parent().attr("hidden", "hidden");
  });

  $('.cancel-add-dinosaur').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.add-dinosaur-div').removeAttr("hidden");
    $(this).parent().attr("hidden", "hidden");
  });

  $('.cancel-add-server').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.add-server-div').removeAttr("hidden");
    $(this).parent().attr("hidden", "hidden");
  });

  $('.edit-server').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.edit-server-form').removeAttr("hidden");
    $(this).parent().attr("hidden", "hidden");
  });

  $('.edit-dinosaur').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.edit-dinosaur-form').removeAttr("hidden");
    $(this).parent().attr("hidden", "hidden");
  });

  $('.edit-dinosaur-color').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.edit-dinosaur-color-form').removeAttr("hidden");
    $(this).parent().attr("hidden", "hidden");
  });

  $('.save-server').on('click', () => {
    return confirmSave();
  });

  $('.save-dinosaur').on('click', () => {
    return confirmSave();
  });

  $('.save-dinosaur-color').on('click', () => {
    return confirmSave();
  });

  $('.cancel-server').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.delete-server-form').removeAttr("hidden");
    $(this).parent().attr("hidden", "hidden");
  });

  $('.cancel-dinosaur').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.delete-dinosaur-form').removeAttr("hidden");
    $(this).parent().attr("hidden", "hidden");
  });
  
  $('.cancel-dinosaur-color').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.delete-dinosaur-color-form').removeAttr("hidden");
    $(this).parent().attr("hidden", "hidden");
  });

  $('#serverList').on('click', () => {
    $('#dinosaurListing').attr("hidden", "hidden");
    $('#dinosaurColorListing').attr("hidden", "hidden");
    $('#serverListing').removeAttr("hidden");
  });

  $('#dinosaurList').on('click', () => {
    $('#dinosaurListing').removeAttr("hidden");
    $('#dinosaurColorListing').attr("hidden", "hidden");
    $('#serverListing').attr("hidden", "hidden");
  });

  $('#dinosaurColors').on('click', () => {
    $('#dinosaurListing').attr("hidden", "hidden");
    $('#dinosaurColorListing').removeAttr("hidden");
    $('#serverListing').attr("hidden", "hidden");
  });
  
});

function confirmSave() {
  if (confirm("Are you sure you want to save this?\nThis will update across the entire website!")) {
    return true;
  } else {
    return false;
  }
}

function confirmAdd() {
  if (confirm("Are you sure you want to add this?\nThis will update across the entire website!")) {
    return true;
  } else {
    return false;
  }
}

function confirmDeletion() {
  if (confirm("Are you sure you want to remove this?\nThis will update across the entire website!")) {
    return true;
  } else {
    return false;
  }
}

