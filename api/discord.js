require('dotenv').config();
const express = require('express');
const fetch = require('node-fetch');
const btoa = require('btoa');
const { catchAsync } = require('../my-app/src/util/utils');
const superagent = require('superagent');

const router = express.Router();

const CLIENT_ID = process.env.CLIENT_ID;
const CLIENT_SECRET = process.env.CLIENT_SECRET;
const DISCORD_BOT_ID = process.env.DISCORD_BOT_ID;
const DISCORD_GUILD_ID = process.env.DISCORD_GUILD_ID;
const DISCORD_ADMIN_GROUP_ID = process.env.DISCORD_ADMIN_GROUP_ID;
const PORT = process.env.PORT;
const redirect = encodeURIComponent(`http://localhost:${PORT}/api/discord/callback`);

router.get('/login', (req, res) => {
  res.redirect(`https://discordapp.com/api/oauth2/authorize?client_id=${CLIENT_ID}&scope=identify&response_type=code&redirect_uri=${redirect}`);
});

//store token in state?

router.get('/callback', catchAsync(async (req, res)=> {
  if (!req.query.code) throw new Error('NoCodeProvided');
  const code = req.query.code;
  const creds = btoa(`${CLIENT_ID}:${CLIENT_SECRET}`);
  const response = await fetch(`https://discordapp.com/api/oauth2/token?grant_type=authorization_code&code=${code}&redirect_uri=${redirect}`,
    {
      method: 'POST',
      headers: {
        Authorization: `Basic ${creds}`,
      },
    });
  const json = await response.json();
  superagent.get('https://discordapp.com/api/users/@me')
      .set('Authorization', `Bearer ${json.access_token}`)
      .then(queryUser => {
        //480355364613783564 - Test Server
        //264114888346042368 - DomiNATION
        superagent.get(`https://discordapp.com/api/guilds/${DISCORD_GUILD_ID}/members/${queryUser.body.id}`)
          .set('Authorization', `Bot ${DISCORD_BOT_ID}`)
          .then(queryGuildForUser => {
            let isAdmin = false;
            if (queryGuildForUser.body.roles == null) {
              console.log("No roles exist for this user");
            } else {
              for (userGroup in queryGuildForUser.body.roles) {
                if (queryGuildForUser.body.roles[userGroup] === DISCORD_ADMIN_GROUP_ID) {
                  isAdmin = true;
                } 
              }
              if (isAdmin === true) {
                res.render('pages/adminPage', {response : queryUser.body});
              } else {
                res.render('pages/loggedIn', {response: queryUser.body});
              }
            }
          });
      }).catch(error => console.log(error));
}));

module.exports = router;