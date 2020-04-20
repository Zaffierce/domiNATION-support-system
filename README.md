# DomiNATION Support System

This is the support system for the DomiNATION Gaming Community.

# How it works
- All users are required to sign into the website using Discord's oAuth.
- After signing in, we now check what user groups are assigned to your account in the DomiNATION Discord.
  - This is performed by making an API call using the token we just obtained to grab your users specific ID
  - A second API call is made after we have your ID, which reads off what user groups you have assigned
- Once we have the response from Discord, things are now rendered to the screen based on your access.


# Setup
You may use this project how you see fit, but keep in mind that this was created specifically for the DomiNATION Gaming Community.  Here are the steps for setting this project up.

  - PostgreSQL Database
    - Use the `schema.sql` file for the Database
  - Node
    - npm -i
  - .env (see .env example)

# .env example
This is the example for the .env file, most of this you must obtain yourself.
```
PORT=3001
DATABASE_URL=postgres://username:password@localhost:5432/domi_support

CLIENT_ID=[Obtain via Discord Developer Portal]
CLIENT_SECRET=[Obtain via Discord Developer Portal]
DISCORD_BOT_ID=[Obtain via Discord Developer Portal]

CALLBACK_URL=http://localhost:3001/api/discord/callback

DISCORD_GUILD_ID=[ID of Discord Channel]
DISCORD_ADMIN_GROUP_ID=[ID of Administrator Group]
DISCORD_PATREON_SUPPORTER=[ID of Supporter]
DISCORD_PATREON_SUPPORTERPLUS=[ID of Supporter+]
DISCORD_PATREON_SUPPORTERPLUSPLUS=[ID of Supporter++]
DISCORD_PATREON_DOMINATOR=[ID of DomiNATOR]

WEBHOOK_ID=[ID of Webhook]
WEBHOOK_TOKEN=[Token]
```


# Current Features

### General
- Login via Discord oAuth
- Permission based content
  - Patreon & Administrative locked content
- Webhook message to Discord informing Admins when a ticket was submitted

### Users
- Able to submit tickets
  - General
  - Element from event
  - Element transfer
  - Patreon dino request
  - Patreon insurance request
  - Ban appeal
  - Bug report
  - Anonymous reports
- View all tickets on their home page
- View detailed information about a ticket
- Able to cancel their own ticket
- Able to leave notes on their own tickets
  - Able to edit & delete their own notes

### Administrators
- Able to see all tickets
- Able to change the status of a ticket
  - Approve, Complete, or Cancel
- Able to leave notes on any users tickets
  - Able to delete anyones notes
- Able to leave a comment as to why the ticket was cancelled
- Able to update Servers, Dinosaurs & Dinosaurs colors

# Upcoming Features

- Allowing an admin to re-open a ticket

# Change Log
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