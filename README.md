# domiNATION-support-system

How to setup:

Step 1:  Create .env with the following variables
```
PORT=
DATABASE_URL=postgres://
CLIENT_ID=
CLIENT_SECRET=
DISCORD_GUILD_ID=
DISCORD_BOT_ID=
DISCORD_ADMIN_GROUP_ID=
```

PORT is what port you want to run on.
DATABASE_URL is your POSTGRESQL database
CLIENT_ID, CLIENT_SECRET come from Discord Developer
DISCORD_GUILD_ID is your Discord's ID
DISCORD_BOT_ID is the ID of the bot in your Discord
DISCORD_ADMIN_GROUP_ID is the ID # of your Server Admin group


Step 2:  Run npm i

Step 3:  Run nodemon, open browser and go to localhost:PORT
Note* If you did not define a PORT in your .env, the default is 3000.