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

  $('#identifygame').change(function() {
    $(this).parent().parent().find('.ticketDetails').empty();
    let identifyValue = $(this).val();
    console.log(`DEBUG: #identifygame on change, identifyValue is`, identifyValue);

    if (identifyValue == "na") return;

    let genericOptions = `
    <div class="form-group ticketDetails">
      <label for="ticketType">What do you need help with?</label>
      <select name="ticketType" class="form-control mx-auto" id="ticketType" >
        <option value="na">Please choose...</option>
        <option value="General Support Ticket">General assistance</option>
        <option value="Ban Appeal">Ban Appeal</option>
        <option value="Bug Report">Report a Bug</option>
      </select>
      <div class="invalid-feedback">Please choose a ticket type.</div>
    </div>
    `;

    let additionalOptions;

    $(this).parent().parent().parent().find('.ticket').append(genericOptions);

  //TODO: AJAX fetch to validate user permissions
    switch(identifyValue) {
      case 'ARK: Survival Evolved': 
        additionalOptions = `
          <option value="Element from Event">Element from Event</option>
          <% if (user.isSupPlus === true || user.isAdmin === true) { %>
            <!-- TODO: Find references of "Patreon Request" -->
            <option value="ARK Patreon Request">Patreon Request</option>
          <% } %>
        `
      break;

      case 'Conan: Exiles': 
        additionalOptions = `
          <% if (user.isSupPlus === true || user.isAdmin === true) { %>
            <option value="Conan Patreon Request">Patreon Request</option>
          <% } %>
        `
      break;
        
    }

    return $(this).parent().parent().find('#ticketType').append(additionalOptions);
  });

  $('.ticket').on('change', '#ticketType', function() {
    // $(this).parent().parent().find('.ticketDetails').empty();
    console.log("ticketDetails hit")
    let identifyValue = $(this).val();
    console.log(`DEBUG: .ticketDetails on change, identifyValue is`, identifyValue);
    console.log($(this).parent().parent())

    if (identifyValue == "na") return;
    let ticketTypeSelect;

    let additionalOptions;

    switch(identifyValue) {
      case 'General Support Ticket':
        additionalOptions = `
          <div class="form-group">
            <label for="tribe_name">What is your tribe name?</label>
            <input type="text" name="tribe_name" class="form-control mx-auto" required>
            <div class="invalid-feedback">Please enter your Tribe name.</div>
          </div>
          <div class="form-group">
            <label for="coordinates">Please provide the CCC location:
              <a tabindex="0" 
              data-toggle="popover" 
              data-trigger="focus"
              data-html="true" 
              title="What is CCC?" 
              data-content="CCC is a command that you run in the Ark terminal, which will copy your current position to your clipboard.  This can be utilized to allow us to teleport directly to where you ran this command, allowing us to complete your ticket sooner.<br />
              <br />
              1.  In Ark, press the TAB button on your keyboard to open the ingame console.<br />
              <br />
              2.  Type CCC into the console and press enter<br />
              <br />
              3.  Return to this page and paste the coordinates by pressing CTRL+V into the box below!">
              <i class="fas fa-info-circle"></i>
              </a>
            </label>
            <input type="text" name="coordinates" class="form-control mx-auto" required>
            <div class="invalid-feedback">Please enter a CCC location, if you require additional help click the <i class="fas fa-info-circle"></i> icon.</div>
          </div>
          <div class="form-group">
            <label for="issue">Please describe your issue:</label>
            <textarea type="text" name="issue" class="form-control mx-auto" rows="3" required></textarea>
            <div class="invalid-feedback">Please describe your issue.</div>
          </div>
          <div class="form-group">
            <label for="resolution">What have you done to resolve this issue?</label>
            <textarea type="text" name="resolution" class="form-control mx-auto" rows="3" required></textarea>
            <div class="invalid-feedback">Please tell us what you've done in attempts to resolve this on your own.</div>
          </div>
          <div class="text-center">
            <input type="submit" value="Submit Ticket">
          </div>
        `
        break;

      case 'Ban Appeal':
        break;

      case 'Bug Report':
        break;

      case 'Element from Event':
        break;

      case 'Patreon Request':
        break;
    }
    $(this).parent().parent().parent().parent().find('.ticketDetails').append(additionalOptions);
    // $(this).parent().parent().find('#ticketType').append(additionalOptions);




    //General Support Ticket
    //Ban Appeal
    //Bug Report
    //Element from Event
    //Patreon Request


    

  //   let genericTicketType = `
  //   <div class="form-group ticketType">
  //     <label for="ticketType">What do you need help with?</label>
  //     <select name="ticketType" class="form-control mx-auto" id="generalTicketSelect" >
  //       <option value="">Please choose...</option>
  //       <option value="General Support Ticket">General assistance</option>
  //       <option value="Ban Appeal">Ban Appeal</option>
  //       <option value="Bug Report">Report a Bug</option>
  //     </select>
  //     <div class="invalid-feedback">Please choose a ticket type.</div>
  //   </div>
  //   `;

  //   $(this).parent().parent().find('.ticketDetails').append(genericTicketType);

  // //TODO: AJAX fetch to validate user permissions
  //   switch(identifyValue) {
  //     case 'ark': 
  //       ticketTypeSelect = `
  //         <option value="Element from Event">Element from Event</option>
  //         <% if (user.isSupPlus === true || user.isAdmin === true) { %>
  //           <option value="Patreon Request">Patreon Request</option>
  //         <% } %>
  //       `
  //     break;

  //     case 'conan': 
  //       ticketTypeSelect = `
  //         <% if (user.isSupPlus === true || user.isAdmin === true) { %>
  //           <option value="Patreon Request">Patreon Request</option>
  //         <% } %>
  //       `
  //     break;
        
  //   }

  //   $(this).parent().parent().find('#generalTicketSelect').append(ticketTypeSelect);
  });


});

