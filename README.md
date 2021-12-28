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

See [CHANGELOG.md](CHANGELOG.md) for detailed changes!