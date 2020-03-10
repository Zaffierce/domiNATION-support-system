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
  })

  $('.popover-dismiss').popover({
    trigger: 'focus'
  });

  $('.delete-server').on('click', (event) => {
    return confirmDeletion();
  });

  $('.edit-server').on('click', function(event) {
    event.preventDefault();
    console.log($(this).parent().parent().find('.edit-server-form').removeAttr("hidden"));
    // $('.edit-server-form').removeAttr("hidden");
    $($(this).parent().attr("hidden", "hidden"));
    // $('.edit-server').attr("hidden", "hidden");
    // $('.delete-server').attr("hidden", "hidden");
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

function confirmDeletion() {
  if (confirm("Are you sure you want to remove this?")) {
    return true;
  } else {
    return false;
  }
}





// //Implement a queue system for a Back button?
// //https://www.geeksforgeeks.org/implementation-queue-javascript/


// //js below provided by bootstrap's example guide for forms
// // Example starter JavaScript for disabling form submissions if there are invalid fields
// //
// $(() => {
//     var forms = document.getElementsByClassName('needs-validation');
//     var validation = Array.prototype.filter.call(forms, function(form) {
//       form.addEventListener('submit', function(event) {
//         if (form.checkValidity() === false) {
//           event.preventDefault();
//           event.stopPropagation();
//         }
//         form.classList.add('was-validated');
//         event.preventDefault();
//         // event.stopPropagation();

//         // $('#genBtn').click(function(event) {
//         //   const server = $('#generalServerSelect option:selected').text();
//         //   const ticketType = $('#generalTicketSelect option:selected').val();
//         //   $(`#${ticketType}`).css('display', 'flex');
//         //   $('#genBtn').hide();
//         // });

//       }, false);
//       $('#genBtn').click(function(event) {
//         console.log("button clicked");
//         event.preventDefault();
//         if (form.checkValidity() === true) {
//           $('#genBtn').hide();
//         }
//       });


//     });
//     // $('#generalTicketSelect').on('change', function(event) {
//     //   const server = $('#generalServerSelect option:selected').text();
//     //   const ticketType = $('#generalTicketSelect option:selected').val();     
//     //   $('#generalTicketSelect').attr('disabled', 'disabled');

      

//     // });


    
// });


// // $('#genBtn').click(function(event) {
// //   // event.preventDefault();
// //   const server = $('#generalServerSelect option:selected').text();
// //   const ticketType = $('#generalTicketSelect option:selected').val();
  
// //   $(`#${ticketType}`).show();

// // });