const express = require('express');
const fetch = require('node-fetch');
const btoa = require('btoa');
const { catchAsync } = require('../utils');
const superagent = require('superagent');

const router = express.Router();

const CLIENT_ID = process.env.CLIENT_ID;
const CLIENT_SECRET = process.env.CLIENT_SECRET;
const PORT = process.env.PORT || 3001;
const redirect = encodeURIComponent(`http://localhost:${PORT}/api/discord/callback`);

router.get('/login', (req, res) => {
  res.redirect(`https://discordapp.com/api/oauth2/authorize?client_id=${CLIENT_ID}&scope=identify&response_type=code&redirect_uri=${redirect}`);
});

//store token in state

router.get('/callback', catchAsync(async (req, res) => {
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
      .then(responseFromSuper => {
        //check here if the token is valid or not. check status code

        //if its 200
        //if react... create react app, serve react app from public folder ... requires own port
        //react front end listening on a path using ajax
        //server listening to backend
        //when it hears something come in thats valid, it'll login and send user ID
        //can compile and build it and then store it staticly in public folder
        res.render('pages/loggedIn', {userID: responseFromSuper.body.id});
        //
      }).catch(error => console.log(error));
  // res.redirect(`/?token=${json.access_token}`);
}));

module.exports = router;