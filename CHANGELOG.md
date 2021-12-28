# DomiNATION Change Log

12/28/2021
- Huge Rework on Admin Panel
  - AP is now rendered into a Table and displays additional data for each section
  - Additions & Edits are now handled via AJAX, making calls to a /fetch route on the backend after being submitted.
  - Implemented adminPanel.js
    - Migrated the Admin Panel specific code from app.js into here and removed from app.js
- Cleaned up app.js
- Cleaned up Forms once again and slightly tweaked layout.
- Implemented bootstrap-overwrites.css
- Adjusted Auto-Filled Form data
  - If a user has no characters, there will be an empty text-box for them to fill in
  - If a user only has 1 character, it will default to that instead of displaying the drop down "Please choose a character"
  - If a user has more than 1 character, a drop down box will be displayed listing all available characters.
- Implemented validation handling on multiple forms with detailed feedback for each section


12/21/2021
- Adjusted permission checks when viewing a form
  - Student Admin's should be able to see all tickets, but not have visibility to any buttons unless it's their own ticket.

12/07/2021
- Corrected Incorrect Ticket closed_on value
- Cleaned up Forms on website
- Corrected Invalid Cookie validation and redirects (forgot a return)
- Corrected accidental set limit on closed-tickets (was set for testing purposes)

11/22/2021
- Implemented Dino Imprinting Boolean logic
- Cleaned up forms, removing unused / unnecessary data

11/06/2021
- Auth error handling improvements

09/18/2021
- Auth redirect tweaks based on API return

09/17/2021
- Huge Rework and Implementation of DomiNATION API's
  - Backend API functionality implemented
  - Patreon API functionality implemented

04/04/2021
- Another bug fix for DTG on closed_on

03/18/2021
- Bug fix for DTG on closed_on

03/03/2021
- Changed DATE submission on tickets to actual JS new Date
- Implemented dataTable sorts for tickets
- Removed Search Form on All Tickets page
- Removed /search functionality
- Removed Spay/Neutered message on Dino Request form

11/02/2020
- Corrected a minor bug that allowed $5 Patreon Members to submit Dino Requests
  - This feature isn't actually available to them, it's only available to those who pledge $10 or more.

10/26/2020
- Implemented ClipboardJS feature onto Element tickets

09/30/2020
- Implemented Notes notification feature
  - When a new note is submitted (aside from SYSTEM notifications), a DM will be sent to the user notifying them.

09/25/2020
- Implemented ClipboardJS to easily copy a selection
- Implemented Dinosaur Wild Level & Spawn Codes
- Implemented Logic check for Tek Skiff
  - If Tek Skiff, display different spawn command.

09/03/2020
- CCC drop off location removed from forms

07/14/2020
- Corrected slight bug with ANONYMOUS ticket submissions

07/08/2020
- Big push, basically small things that I've tinkered / corrected over the past few months.
- Swapped oAuth process
- Corrected /logout bug
- Completely revamped the Admin Panel
  - Things are all handled via modals now and is much cleaner!  Kind of a pain to do... but glad I did it so now I understand them better!
- Added in datatables and natural sorting
  - This allows me to remove the old method of sorting
  - natural sorting also corrects the alpha numeric sorting bug
- Some cleanup in the routes
- Adjusted logic on new ticket page to allow Admins who aren't Patreon to submit tickets (for debug purposes) 

04/19/2020
  - Implemented search functionality to admin panel
    - Able to search for the following types:
      - Discord ID
      - Username
      - Completed Before
      - Completed After
      - Completed By

04/05/2020
- Made changes to README

04/04/2020
- Removed react files
- Implemented Notes system
  - Implemented EDIT & DELETE ability for notes
  - Users can edit & delete their own comment
  - Administrators can delete others comments
- Corrected bug with datatype request_sex
- Corrected bug with event listener on patreon form

03/25/2020
- Tickets are now displayed on the screen based on the following order
  - NEW -> Date Submitted DESC
  - OPEN -> Date Submitted DESC
  - COMPLETE -> Date Submitted DESC
  - CANCELLED -> Date Submitted DESC
- Added Date Completed onto All Tickets
- Renamed 'All Open Tickets' to 'All Tickets'
- Implemented cancel ticket modal
  - User is able to submit a reason why they are cancelling ticket
- Changed various inputs on the following pages to textareas
  - Cancel modal
  - Bug Report
  - Ban Appeal
  - Patreon Insurance Request
- Removed unused detailed pages

03/23/2020 - 03/24/2020
- Basically rewrote the entire site
- Completely rewrote database structure
- Implemented switches
- Cleaned up styling
- Lots of backend cleaning

03/17/2020
- Altered the value of the servers to reference the full name vice the server number
  - Slight tweaks to the data types inside the database

03/04/2020 - 03/16/2020
- Started progress on Admin Panel
  - Ability to Add/Update/Remove Servers, Dinosaurs, and Dinosaur Colors
- Restructured some database parts
  - Added id to servers and dinosaurs colors
- Changed formatting of how some text is displayed across the site

02/29/2020
- Changed formatting on Manage page
  - NEW, OPEN, and CLOSED tickets are now separate
- Renamed nav links
- Created Admin Panel
  - Adjusted backend routes
- Implemented error checking for tickets that do not exist within the DB
- Implemented logic to query DB for server list
- Implemented logic to validate if a user is not found in the Discord
  - Currently only on index route, may implement to other routes?

02/27/2020
- Mass style and verbiage changes
  - Corrected spacing between buttons on individual ticket pages
  - Changed status to the appropriate status on Status page
    - Status:  Completed or Closed 
  - Changed wording on individual ticket pages based on status
    - Completed tickets will say Completed by XXX on XXX.
    - Closed tickets will say Closed by XXX on XXX.
  - Changed verbiage on Index
  - Changed verbiage on Manage page
- Added form submitted page informing user that it was successfully submitted
  - Implemented a 5 second redirect to home page
- Added "OPEN" status to tickets
  - Changed render for Index, Status, Admin pages
  - Changed much backend logic.  :(

02/26/2020
- Added more informational boxes
  - Element from an Event:
  - Element transfer
  - Patreon Dino Request
- Started work on Manage tab
  - All tickets are queried to page
- Behind the scenes
  - Added columns of closed_on and closed_by to database to keep track of data.
  - Swapped auth tokens so Kakoen can remove the test version.
  - Changed Cookies to httpOnly: false
- Deployed to the new URL! [https://support.domination-gaming.com/]
- Built out "Status of a ticket" page, which contains both OPEN, CLOSED and CANCELLED tickets.
- Implemented Cancel Ticket and Complete ticket buttons
  - Buttons render based on permissions and status of ticket
    - Non-admin's will only see 'Cancel ticket', while Admins will see both buttons
- Created route logic for cancelling tickets
  - Increased data_type 'status' to 20 characters long on all tables
  - Stores username of individual whom closed ticket and current date/time
    - ^ Uses will be implemented soon
- Created route logic for closing a ticket
  - Stores username of individual whom closed ticket and current date/time

02/24/2020
- The logic to check Discord roles has been swapped to DomiNATION, so you may notice a slight change depending on what roles you previously had in here.
- Routes & logic established to pull detailed information about each task.
- Each ticket has it's own detailed page now
  - Dino request form will render additional details based on if they want the dinosaur colored or not

02/22/2020
- Added information box to General Request - will add it to the others soon.
- Corrected issue with not being able to save Bug Requests
- Databases implemented for Patreon Requests
- Established Event Log
  - Built out a Node/Express server with many .ejs pages