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
    $(this).parent().parent().parent().parent().parent().parent().find('.notes-desc').removeAttr("hidden");
    $(this).parent().parent().parent().parent().parent().parent().find('.notes-desc-form').attr("hidden", "hidden");
    $(this).parent().parent().parent().parent().parent().parent().find('.notes-edit-delete-buttons').removeAttr("hidden");
  });

  $('.notes-delete').on('click', function(event) {
    let id = $(this).attr('data-note_id');
    let url = $('#notes-delete-form').attr("action");
    $('#notes-delete-form').attr("action", url+id);
    console.log(url);
  });

  $('.notes-save').on('click', function(event) {
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

  $('.delete').on('click', () => {
    return confirmDeletion();
  });

  new ClipboardJS('.btn');

  $('#copy').on('click', function() {
    $(this).attr('aria-label', 'Command copied!');
    $(this).addClass('tooltipped')
    $(this).addClass('tooltipped-s')
  })

  // $('#copyText').on('click', function() {
  //   $('#spawnCode').text().focus();
  //   $('#spawnCode').text().select();
  //   document.execCommand('copy');
  //   console.log('Clicked')
  // });

  $('.edit-server').on('click', function() {
    $('#editServerModal-server_id').val($(this).data("serverid"));
    $('#editServerModal-id').val($(this).data("id"));
    $('#editServerModal-server_name').val($(this).data("servername"));
    $('#editServerModal-remove_server_id').val($(this).data("serverid"));
  });

  $('.edit-dinosaur').on('click', function() {
    $('#editDinosaurModal-dino_name').val($(this).data("dinoname"));
    $('#editDinosaurModal-dino_id').val($(this).data("dinoid"));
    $('#editDinosaurModal-dino_spawn').val($(this).data("dinospawn"));
    $('#editDinosaurModal-dino_lvl').val($(this).data("dinolvl"));
    $('#editDinosaurModal-remove_dino_id').val($(this).data("dinoid"));
  });

  $('.edit-dinosaur-color').on('click', function() {
    $('#editDinosaurColorModal-actual_id').val($(this).data("colorid"));
    $('#editDinosaurColorModal-color_id').val($(this).data("dinocolorid"));
    $('#editDinosaurColorModal-color_name').val($(this).data("dinocolorname"));
    $('#editDinosaurColorModal-color_hex').val($(this).data("dinocolorhex"));
    $('#editDinosaurColorModal-remove_id').val($(this).data("colorid"));
  })

  $('#serverTab').on('click', () => {
    $('#dinosaurListing').attr("hidden", "hidden");
    $('#dinosaurColorListing').attr("hidden", "hidden");
    $('#serverListing').removeAttr("hidden");
    $('#serverTab').addClass("active");
    $('#dinoTab').removeClass("active");
    $('#dinoColorTab').removeClass("active");
  });

  $('#dinoTab').on('click', () => {
    $('#dinosaurListing').removeAttr("hidden");
    $('#dinosaurColorListing').attr("hidden", "hidden");
    $('#serverListing').attr("hidden", "hidden");
    $('#dinoTab').addClass("active");
    $('#serverTab').removeClass("active");
    $('#dinoColorTab').removeClass("active");
  });

  $('#dinoColorTab').on('click', () => {
    $('#dinosaurListing').attr("hidden", "hidden");
    $('#dinosaurColorListing').removeAttr("hidden");
    $('#serverListing').attr("hidden", "hidden");
    $('#dinoColorTab').addClass("active");
    $('#dinoTab').removeClass("active");
    $('#serverTab').removeClass("active");
  });

  // $('.search').on('keyup', delay(function() {
  //   let queryOpt = $(this)[0].id;
  //   let searchQuery = $(this).val().toLowerCase();
  //   let html = '<tr> <th class="ng-scope">Date Submitted</th> <th class="ng-scope">Ticket Type</th> <th class="ng-scope">User</th> <th class="ng-scope">Discord ID</th> <th class="ng-scope">Status</th> <th class="ng-scope">Date Completed</th> <th class="ng-scope">ID</th> </tr>'
  //   $.ajax({
  //     url: `https://support.domination-gaming.com/search`,
  //     method: 'GET',
  //     data: { data : searchQuery,
  //             type : queryOpt },
  //     success: function(data) {
  //       $('.tickets-table').empty();
  //       $('.tickets-table').append(html);
  //       if (data.length === 0) {
  //         $('.tickets-table').append('<tr class="ng-scope tickets"><td class="ng-scope">No data found</td></tr>');
  //       } else {
  //       for (let i = 0; i < data.length; i++) {
  //         let submitted = `<tr class="ng-scope tickets"> <td class="ng-scope">${data[i].submitted_on}</td>`;
  //         let type = `<td class="ng-scope">${data[i].type_of_ticket}</td>`;
  //         let ign = `<td class="ng-scope">${data[i].ign}</td>`;
  //         let discord = `<td class="ng-scope">${data[i].discord_name}</td>`;
  //         let status = `<td class="ng-scope">${data[i].status}</td>`;
  //         let closed = `<td class="ng-scope">${data[i].closed_on}</td>`;
  //         let id = `<td class="ng-scope"><a href="/details/${data[i].id}">View ticket</a></td></tr>`;
  //         $('.tickets-table').append(submitted+type+ign+discord+status+closed+id);
  //       }
  //     }
  //   }
  //   });
  // }, 500));

  // $('.search_date').on('change', delay(function() {
  //   let queryOpt = $(this)[0].id;
  //   let searchQuery = $(this).val().toLowerCase();
  //   let html = '<tr> <th class="ng-scope">Date Submitted</th> <th class="ng-scope">Ticket Type</th> <th class="ng-scope">User</th> <th class="ng-scope">Discord ID</th> <th class="ng-scope">Status</th> <th class="ng-scope">Date Completed</th> <th class="ng-scope">ID</th> </tr>'
  //   $.ajax({
  //     url: `http://localhost:3001/search`,
  //     method: 'GET',
  //     data: { data : searchQuery,
  //             type : queryOpt },
  //     success: function(data) {
  //       $('.tickets-table').empty();
  //       $('.tickets-table').append(html);
  //       if (data.length === 0) {
  //         $('.tickets-table').append('<tr class="ng-scope tickets"><td class="ng-scope">No data found</td></tr>');
  //       } else {
  //       for (let i = 0; i < data.length; i++) {
  //         let submitted = `<tr class="ng-scope tickets"> <td class="ng-scope">${data[i].submitted_on}</td>`;
  //         let type = `<td class="ng-scope">${data[i].type_of_ticket}</td>`;
  //         let ign = `<td class="ng-scope">${data[i].ign}</td>`;
  //         let discord = `<td class="ng-scope">${data[i].discord_name}</td>`;
  //         let status = `<td class="ng-scope">${data[i].status}</td>`;
  //         let closed = `<td class="ng-scope">${data[i].closed_on}</td>`;
  //         let id = `<td class="ng-scope"><a href="/details/${data[i].id}">View ticket</a></td></tr>`;
  //         $('.tickets-table').append(submitted+type+ign+discord+status+closed+id);
  //       }
  //     }
  //   }
  //   });
  // }, 500));

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

// function delay(callback, ms) {
//   let timer = 0;
//   return function() {
//     let context = this, args = arguments;
//     clearTimeout(timer);
//     timer = setTimeout(function() {
//       callback.apply(context, args);
//     }, ms || 0);
//   };
// }

