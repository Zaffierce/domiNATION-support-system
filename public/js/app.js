'use strict';

$(() => {


  var forms = document.getElementsByClassName('needs-validation');

  var validation = Array.prototype.filter.call(forms, function(form) {
    form.addEventListener('submit', function(event) {
      if (form.checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });

});


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