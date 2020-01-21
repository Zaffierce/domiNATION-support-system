'use strict';
//Implement a queue system for a Back button?
//https://www.geeksforgeeks.org/implementation-queue-javascript/


//js below provided by bootstrap's example guide for forms
// Example starter JavaScript for disabling form submissions if there are invalid fields
//
$(() => {
  validateForm();
    // var forms = document.getElementsByClassName('needs-validation');
    // var validation = Array.prototype.filter.call(forms, function(form) {
    //   form.addEventListener('submit', function(event) {
    //     if (form.checkValidity() === false) {
    //       event.preventDefault();
    //       event.stopPropagation();
    //     }
    //     form.classList.add('was-validated');
    //     event.preventDefault();
    //     // event.stopPropagation();

    //     // $('#genBtn').click(function(event) {
    //     //   const server = $('#generalServerSelect option:selected').text();
    //     //   const ticketType = $('#generalTicketSelect option:selected').val();
    //     //   $(`#${ticketType}`).css('display', 'flex');
    //     //   $('#genBtn').hide();
    //     // });

    //   }, false);
      $('#genBtn').click(function(event) {
        event.preventDefault();
        validateForm();
        console.log(validateForm());
        if (validateForm() === true) {
          console.log("true")
          $('#genBtn').hide();
        }
        console.log("button clicked");
      });


    });
    // $('#generalTicketSelect').on('change', function(event) {
    //   const server = $('#generalServerSelect option:selected').text();
    //   const ticketType = $('#generalTicketSelect option:selected').val();     
    //   $('#generalTicketSelect').attr('disabled', 'disabled');

      

    // });


    
// });

function validateForm() {
 let forms = $('.needs-validation');
 let validation = Array.prototype.filter.call(forms, function(form) {
  form.addEventListener('submit', function(event) {
    if (form.checkValidity() === false) {
      event.preventDefault();
      event.stopPropagation();
      return false;
    }
    form.classList.add('was-validated');
    event.preventDefault();
    return true;
    // event.stopPropagation();

    // $('#genBtn').click(function(event) {
    //   const server = $('#generalServerSelect option:selected').text();
    //   const ticketType = $('#generalTicketSelect option:selected').val();
    //   $(`#${ticketType}`).css('display', 'flex');
    //   $('#genBtn').hide();
    // });

  });
})
};

// $('#genBtn').click(function(event) {
//   // event.preventDefault();
//   const server = $('#generalServerSelect option:selected').text();
//   const ticketType = $('#generalTicketSelect option:selected').val();
  
//   $(`#${ticketType}`).show();

// });