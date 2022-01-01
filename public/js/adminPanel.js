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
    },
    form.addEventListener('submit', function(event) {
      let adminPanelObj = [
        { 
          form_name : "add-server-form",
          elements : ["#addServerModal-server_id", "#addServerModal-server_name", "#addServerModal-post_office_ccc", "#addServerModal-post_office_lat", "#addServerModal-post_office_lon"],
          tab : "serverTab",
          url : "/add",
          modal : "#addServerModal"
        },
        { 
          form_name : "edit-server-form",
          elements : ["#editServerModal-server_id", "#editServerModal-actual_server_id", "#editServerModal-server_name", "#editServerModal-post_office_ccc", "#editServerModal-post_office_lat", "#editServerModal-post_office_lon"],
          tab : "serverTab",
          url : "/edit",
          modal : "#editServerModal"
        },
        { 
          form_name : "add-dinosaur-form",
          elements : ["#addDinosaurModal-dino_name", "#addDinosaurModal-dino_spawn", "#addDinosaurModal-dino_lvl", "#addDinosaurModal-dino_imprint"],
          tab : "dinoTab",
          url : "/add",
          modal : "#addDinosaurModal"
        },
        { 
          form_name : "edit-dinosaur-form",
          elements : ["#editDinosaurModal-dino_name", "#editDinosaurModal-dino_spawn", "#editDinosaurModal-dino_lvl", "#editDinosaurModal-dino_imprint", '#editDinosaurModal-actual_dino_id'],
          tab : "dinoTab",
          url : "/edit",
          modal : "#editDinosaurModal"
        },
        { 
          form_name : "add-dinosaur-color-form",
          elements : ["#addDinosaurColorModal-dino_color_id", "#addDinosaurColorModal-dino_color_name", "#addDinosaurColorModal-dino_color_hex"],
          tab : "dinoColorTab",
          url : "/add",
          modal :"#addDinosaurColorModal"
        },
        { 
          form_name : "edit-dinosaur-color-form",
          elements : ["#editDinosaurColorModal-dino_color_id", "#editDinosaurColorModal-dino_color_name", "#editDinosaurColorModal-dino_color_hex", "#editDinosaurColorModal-actual_color_id"],
          tab : "dinoColorTab",
          url : "/edit",
          modal : "#editDinosaurColorModal"
        }
      ];
      if (form.checkValidity() === true) {
        let obj = {};
        let elem, val, tab, url, panelModal;
        for (let i in adminPanelObj) {
          if ($(this)[0].id === adminPanelObj[i].form_name) {
            tab = adminPanelObj[i].tab;
            url = adminPanelObj[i].url;
            panelModal = adminPanelObj[i].modal;
            for (let j in adminPanelObj[i].elements) {
              elem = adminPanelObj[i].elements[j].split('-')[1];
              val = $(adminPanelObj[i].elements[j]).val();
              obj[elem] = elem;
              obj[elem] = val;
            }
            break;
          }
        }
        if (tab) {
          event.preventDefault();
          $.ajax({
            url: url,
            method: 'POST',
            data: { data : obj },
            success: function(data) {
              $(panelModal).modal('hide');
              $('#successModal').modal('toggle')
              setTimeout(function() {
                $('#successModal').modal('hide');
              }, 2000);
              ajaxFetch(obj, tab);
            },
            error: function(e) {
              console.log(e); //TODO:  Pass this to proper error handling.
              $('#errorModal').modal('toggle')
              setTimeout(function() {
                $('#errorModal').modal('hide');
              }, 2000);
            }
          });
        }
      }
    }), 
    false);
  });

  $('#deleteModal').on('hidden.bs.modal', () => {
    $('#notes-delete-form').attr("action", "/notes-delete/");
  });

  $('.delete').on('click', () => {
    return confirmDeletion();
  });

  $('.edit-server').on('click', function() {
    $('#editServerModal-server_id').val($(this).data("serverid"));
    $('#editServerModal-actual_server_id').val($(this).data("actualserverid"));
    $('#editServerModal-server_name').val($(this).data("servername"));
    $('#editServerModal-post_office_ccc').val($(this).data("serverpoccc"));
    $('#editServerModal-post_office_lat').val($(this).data("serverpolat"));
    $('#editServerModal-post_office_lon').val($(this).data("serverpolon"));
    $('#editServerModal-remove_server_id').val($(this).data("serverid"));
  });

  $('.edit-dinosaur').on('click', function() {
    $('#editDinosaurModal-dino_name').val($(this).data("dinoname"));
    $('#editDinosaurModal-actual_dino_id').val($(this).data("dinoid"));
    $('#editDinosaurModal-dino_spawn').val($(this).data("dinospawn"));
    $('#editDinosaurModal-dino_lvl').val($(this).data("dinolvl"));
    $('#editDinosaurModal-remove_dino_id').val($(this).data("dinoid"));

    if ($(this).data("dinoimprint") === false) {
      $('#editDinosaurModal-dino_imprint option[value=false]').attr("selected", "selected");
      $('#editDinosaurModal-dino_imprint option[value=true]').removeAttr("selected");
    } else {
      $('#editDinosaurModal-dino_imprint option[value=true]').attr("selected", "selected");
      $('#editDinosaurModal-dino_imprint option[value=false]').removeAttr("selected");
    }
  });

  $('.edit-dinosaur-color').on('click', function() {
    $('#editDinosaurColorModal-actual_color_id').val($(this).data("colorid"));
    $('#editDinosaurColorModal-dino_color_id').val($(this).data("dinocolorid"));
    $('#editDinosaurColorModal-dino_color_name').val($(this).data("dinocolorname"));
    $('#editDinosaurColorModal-dino_color_hex').val($(this).data("dinocolorhex"));
    $('#editDinosaurColorModal-remove_dino_color_id').val($(this).data("colorid"));
  });

  
});

function ajaxFetch(obj, tab) {
  $.ajax({
    url: '/fetch',
    method: 'GET',
    data: { data : obj },
    success: function(data) {      
      let ticketheader, ticketnew, ticketrow;
      if (tab === "serverTab") { 
        ticketheader = `<tr class="ng-scope"> 
                          <th>Full Name</th> 
                          <th>Server Name</th> 
                          <th>Server Number</th> 
                          <th>Post Office CCC</th>
                          <th>Post Office LAT</th>
                          <th>Post Office LON</th>
                        </tr>`
        ticketnew = `<tr class="ng-scope"> 
                      <td> 
                        <a class="add-server fas fa-plus h4" 
                          href="#" 
                          tabindex="-1" 
                          role="button" 
                          data-toggle="modal" 
                          data-target="#addServerModal">
                          Add a new server 
                        </a> 
                      </td> 
                    </tr>`
      }
      if (tab === "dinoTab") {
        ticketheader = `<tr class="ng-scope"> 
                          <th>Dino Name</th> 
                          <th>Spawn Code</th> 
                          <th>Max Wild Level</th> 
                          <th>Imprint Status</th> 
                        </tr>`
        ticketnew = `<tr class="ng-scope"> 
                      <td> 
                        <a class="add-dinosaur fas fa-plus h4" 
                          href="#" 
                          tabindex="-1" 
                          role="button" 
                          data-toggle="modal" 
                          data-target="#addDinosaurModal">
                          Add a new Dinosaur
                        </a> 
                      </td> 
                    </tr>`
      }
      if (tab === "dinoColorTab") {
        ticketheader = `<tr class="ng-scope"> 
                          <th>Color Name</th> 
                          <th>Ark Color ID</th> 
                          <th>HEX Code</th> 
                        </tr>`
        ticketnew = `<tr class="ng-scope"> 
                      <td> 
                        <a class="add-dino-color fas fa-plus h4" 
                          href="#" 
                          tabindex="-1" 
                          role="button" 
                          data-toggle="modal" 
                          data-target="#addDinosaurColorModal">
                          Add a new color
                        </a> 
                      </td> 
                    </tr>`
      }
      $(`#${tab}`).find('.table-body').empty();
      $(`#${tab}`).find('.table-body').append(ticketheader);
      $(`#${tab}`).find('.table-body').append(ticketnew);
      for (let i = 0; i < data.length; i++) {
        if (tab === "serverTab") { 
          console.log(data);
          ticketrow = `<tr class="ng-scope"> 
                        <td>
                          <a class="edit-server" 
                            href="#" 
                            tabindex="-1" 
                            role="button" 
                            data-toggle="modal" 
                            data-target="#editServerModal" 
                            data-serverid="${data[i].server_id}"
                            data-actualserverid="${data[i].id}"
                            data-servername="${data[i].server_name}"
                            data-serverpoccc="${data[i].po_ccc}"
                            data-serverpolat="${data[i].po_lat}"
                            data-serverpolon="${data[i].po_lon}"
                            onclick="onServerFormClick($(this));">
                            DomiNATION #${data[i].server_id} - ${data[i].server_name} 
                          </a>
                        </td>
                        <td>${data[i].server_name}</td>
                        <td>${data[i].server_id}</td>
                        <td>${data[i].po_ccc ? data[i].po_ccc : '-'}</td>
                        <td>${data[i].po_lat ? data[i].po_lat : '-'}</td>
                        <td>${data[i].po_lon ? data[i].po_lon : '-'}</td>
                      </tr>`
          $(`#${tab}`).find('.table-body').append(ticketrow);
        }
        if (tab === "dinoTab") {
          ticketrow = `<tr class="ng-scope"> 
                        <td>
                          <a class="edit-dinosaur" 
                            href="#" 
                            tabindex="-1" 
                            role="button" 
                            data-toggle="modal" 
                            data-target="#editDinosaurModal" 
                            data-dinoid="${data[i].id}"
                            data-dinospawn="${data[i].spawn}"
                            data-dinolvl="${data[i].lvl}"
                            data-dinoname="${data[i].name}"
                            data-dinoimprint="${data[i].imprint}"
                            onclick="onDinosaurFormClick($(this));">
                            ${data[i].name}
                          </a>
                        </td>
                        <td>${data[i].spawn}</td>
                        <td>${data[i].lvl}</td>
                        <td>${data[i].imprint}</td>
                      </tr>`
        $(`#${tab}`).find('.table-body').append(ticketrow);
        }
        if (tab === "dinoColorTab") {
          ticketrow = `<tr class="ng-scope"> 
                        <td>
                          <a class="edit-dinosaur-color" 
                            href="#" 
                            tabindex="-1" 
                            role="button" 
                            data-toggle="modal" 
                            data-target="#editDinosaurColorModal" 
                            data-colorid="${data[i].id}"
                            data-dinocolorid="${data[i].color_id}"
                            data-dinocolorname="${data[i].color_name}"
                            data-dinocolorhex="${data[i].color_hex}"
                            onclick="onDinosaurColorFormClick($(this));">
                            ${data[i].color_name}
                          </a>
                        </td>
                        <td>${data[i].color_id}</td>
                        <td>${data[i].color_hex}</td>
                      </tr>`
        $(`#${tab}`).find('.table-body').append(ticketrow);
        }
      }
    }
  });
}

function onServerFormClick(d) {
  $('#edit-server-form').removeClass('was-validated');
  $('#editServerModal-server_id').val(d.data("serverid"));
  $('#editServerModal-actual_server_id').val(d.data("actualserverid"));
  $('#editServerModal-server_name').val(d.data("servername"));
  $('#editServerModal-remove_server_id').val(d.data("serverid"));
  $('#editServerModal-post_office_ccc').val(d.data("serverpoccc"));
  $('#editServerModal-post_office_lat').val(d.data("serverpolat"));
  $('#editServerModal-post_office_lon').val(d.data("serverpolon"));
}

function onDinosaurFormClick(d) {
  $('#edit-dinosaur-form').removeClass('was-validated');
  $('#editDinosaurModal-dino_name').val(d.data("dinoname"));
  $('#editDinosaurModal-actual_dino_id').val(d.data("dinoid"));
  $('#editDinosaurModal-dino_spawn').val(d.data("dinospawn"));
  $('#editDinosaurModal-dino_lvl').val(d.data("dinolvl"));
  $('#editDinosaurModal-remove_dino_id').val(d.data("dinoid"));
  
  if (d.data("dinoimprint") === false) {
    $('#editDinosaurModal-dino_imprint option[value=false]').attr("selected", "selected");
    $('#editDinosaurModal-dino_imprint option[value=true]').removeAttr("selected");
  } else {
    $('#editDinosaurModal-dino_imprint option[value=true]').attr("selected", "selected");
    $('#editDinosaurModal-dino_imprint option[value=false]').removeAttr("selected");
  }
}

function onDinosaurColorFormClick(d) {
  $('#edit-dinosaur-color-form').removeClass('was-validated');
  $('#editDinosaurColorModal-actual_color_id').val(d.data("colorid"));
  $('#editDinosaurColorModal-dino_color_id').val(d.data("dinocolorid"));
  $('#editDinosaurColorModal-dino_color_name').val(d.data("dinocolorname"));
  $('#editDinosaurColorModal-dino_color_hex').val(d.data("dinocolorhex"));
  $('#editDinosaurColorModal-remove_dino_color_id').val(d.data("colorid"));
}

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