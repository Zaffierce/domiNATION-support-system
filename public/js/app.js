'use strict';

$(() => {
  var v = jQuery("#basicform").validate({
      rules: {
        ign: {
          required: true,
          minlength: 1,
        },
        discordName: {
          required: true,
          minlength: 5,
        },
        upass1: {
          required: true,
          minlength: 6,
          maxlength: 15,
        },
        upass2: {
          required: true,
          minlength: 6,
          equalTo: "#upass1",
        }
  
      },
      errorElement: "span",
      errorClass: "help-inline",
    });

    $("#sf2").hide();
    $("#sf3").hide();

    // Binding next button on first step
  $(".open1").click(function() {
    if (v.form()) {
      $(".frm").hide("fast");
      $("#sf2").show("slow");
    }
 });

 // Binding next button on second step
 $(".open2").click(function() {
    if (v.form()) {
      $(".frm").hide("fast");
      $("#sf3").show("slow");
    }
  });

   // Binding back button on second step
  $(".back2").click(function() {
    $(".frm").hide("fast");
    $("#sf1").show("slow");
  });

   // Binding back button on third step
   $(".back3").click(function() {
    $(".frm").hide("fast");
    $("#sf2").show("slow");
  });

  $(".open3").click(function() {
    if (v.form()) {
      // optional
      // used delay form submission for a seccond and show a loader image
      $("#loader").show();
       setTimeout(function(){
         $("#basicform").html('<h2>Thanks for your time.</h2>');
       }, 1000);
      // Remove this if you are not using ajax method for submitting values
      return false;
    }
  });
});

  

//Implement a queue system for a Back button?
//https://www.geeksforgeeks.org/implementation-queue-javascript/


//js below provided by bootstrap's example guide for forms
// Example starter JavaScript for disabling form submissions if there are invalid fields

// $(() => {

//   $('#genBtn').click(function() {
//     console.log("Clicked")
//     let forms = $('.needs-validation'); 
//     let validation = Array.prototype.filter.call(forms, function(form) {
//       form.addEventListener('click', function(event) {
//         if (form.checkValidity() === false) {
//           console.log(validation);
//           console.log("Invalid form");
//           event.preventDefault();
//           event.stopPropagation();
//         }
//         form.classList.add('was-validated');
//         if (form.checkValidity() === true) {
//           const server = $('#generalServerSelect option:selected').text();
//           const ticketType = $('#generalTicketSelect option:selected').val();
//           console.log(ticketType);
//           $(`#${ticketType}`).css('display', 'flex');
//           // $('#genBtn').hide();
//         }
//       }, false);
//     });
//   });

// });