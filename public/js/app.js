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

  $('.notes-edit').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.notes-desc').attr("hidden", "hidden");
    $(this).parent().parent().find('.notes-desc-form').removeAttr("hidden");
    $(this).parent().parent().find('.notes-edit-delete-buttons').attr("hidden", "hidden");
  });

  $('.notes-cancel').on('click', function(event) {
    event.preventDefault();
    console.log("Clicked")
    $(this).parent().parent().parent().parent().parent().parent().find('.notes-desc').removeAttr("hidden");
    $(this).parent().parent().parent().parent().parent().parent().find('.notes-desc-form').attr("hidden", "hidden");
    $(this).parent().parent().parent().parent().parent().parent().find('.notes-edit-delete-buttons').removeAttr("hidden");
  });

  $('.notes-delete').on('click', function(event) {
    event.preventDefault();
    let id = $(this).attr('data-note_id');
    let url = $('#notes-delete-form').attr("action");
    $('#notes-delete-form').attr("action", url+id);
    console.log(url);
  });

  $('.notes-save').on('click', function(event) {
    console.log("clicked")
    $(this).parent().parent().parent().parent().parent().find('.notes-edit-form').submit();
  });

  $('#deleteModal').on('hidden.bs.modal', () => {
    $('#notes-delete-form').attr("action", "/notes-delete/");
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
    console.log("Changed")
    if ($(this).val() === 'Yes') {
      $('.regions').removeAttr("hidden");
    } else if ($(this).val() === 'No') {
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

  $('.search').on('keyup', delay(function() {
    let queryOpt = $(this)[0].id;
    let searchQuery = $(this).val().toLowerCase();
    let html = '<tr> <th class="ng-scope">Date Submitted</th> <th class="ng-scope">Ticket Type</th> <th class="ng-scope">User</th> <th class="ng-scope">Discord ID</th> <th class="ng-scope">Status</th> <th class="ng-scope">Date Completed</th> <th class="ng-scope">ID</th> </tr>'
    $.ajax({
      url: `https://support.domination-gaming.com/search`,
      method: 'GET',
      data: { data : searchQuery,
              type : queryOpt },
      success: function(data) {
        $('.tickets-table').empty();
        $('.tickets-table').append(html);
        if (data.length === 0) {
          $('.tickets-table').append('<tr class="ng-scope tickets"><td class="ng-scope">No data found</td></tr>');
        } else {
        for (let i = 0; i < data.length; i++) {
          let submitted = `<tr class="ng-scope tickets"> <td class="ng-scope">${data[i].submitted_on}</td>`;
          let type = `<td class="ng-scope">${data[i].type_of_ticket}</td>`;
          let ign = `<td class="ng-scope">${data[i].ign}</td>`;
          let discord = `<td class="ng-scope">${data[i].discord_name}</td>`;
          let status = `<td class="ng-scope">${data[i].status}</td>`;
          let closed = `<td class="ng-scope">${data[i].closed_on}</td>`;
          let id = `<td class="ng-scope"><a href="/details/${data[i].id}">View ticket</a></td></tr>`;
          $('.tickets-table').append(submitted+type+ign+discord+status+closed+id);
        }
      }
    }
    });
  }, 500));

  $('.search_date').on('change', delay(function() {
    let queryOpt = $(this)[0].id;
    let searchQuery = $(this).val().toLowerCase();
    let html = '<tr> <th class="ng-scope">Date Submitted</th> <th class="ng-scope">Ticket Type</th> <th class="ng-scope">User</th> <th class="ng-scope">Discord ID</th> <th class="ng-scope">Status</th> <th class="ng-scope">Date Completed</th> <th class="ng-scope">ID</th> </tr>'
    $.ajax({
      url: `http://localhost:3001/search`,
      method: 'GET',
      data: { data : searchQuery,
              type : queryOpt },
      success: function(data) {
        $('.tickets-table').empty();
        $('.tickets-table').append(html);
        if (data.length === 0) {
          $('.tickets-table').append('<tr class="ng-scope tickets"><td class="ng-scope">No data found</td></tr>');
        } else {
        for (let i = 0; i < data.length; i++) {
          let submitted = `<tr class="ng-scope tickets"> <td class="ng-scope">${data[i].submitted_on}</td>`;
          let type = `<td class="ng-scope">${data[i].type_of_ticket}</td>`;
          let ign = `<td class="ng-scope">${data[i].ign}</td>`;
          let discord = `<td class="ng-scope">${data[i].discord_name}</td>`;
          let status = `<td class="ng-scope">${data[i].status}</td>`;
          let closed = `<td class="ng-scope">${data[i].closed_on}</td>`;
          let id = `<td class="ng-scope"><a href="/details/${data[i].id}">View ticket</a></td></tr>`;
          $('.tickets-table').append(submitted+type+ign+discord+status+closed+id);
        }
      }
    }
    });
  }, 500));

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

function delay(callback, ms) {
  let timer = 0;
  return function() {
    let context = this, args = arguments;
    clearTimeout(timer);
    timer = setTimeout(function() {
      callback.apply(context, args);
    }, ms || 0);
  };
}