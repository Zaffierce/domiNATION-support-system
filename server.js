'use strict';

const express = require('express');
const superagent = require('superagent');
const pg = require('pg');
const app = express();
const methodOverride = require('method-override');
const fetch = require('node-fetch');
const btoa = require('btoa');
const { catchAsync } = require('./my-app/src/util/utils');
const router = express.Router();

//Configurable variables//
require('dotenv').config();
const CLIENT_ID = process.env.CLIENT_ID;
const CLIENT_SECRET = process.env.CLIENT_SECRET;
const DISCORD_BOT_ID = process.env.DISCORD_BOT_ID;
const DISCORD_GUILD_ID = process.env.DISCORD_GUILD_ID;
const DISCORD_ADMIN_GROUP_ID = process.env.DISCORD_ADMIN_GROUP_ID;
const DISCORD_PATREON_SUPPORTER = process.env.DISCORD_PATREON_SUPPORTER;
//Domi ID = 305656646250790912;
const DISCORD_PATREON_SUPPORTERPLUS = process.env.DISCORD_PATREON_SUPPORTERPLUS;
const DISCORD_PATREON_SUPPORTERPLUSPLUS = process.env.DISCORD_PATREON_SUPPORTERPLUSPLUS;
const DISCORD_PATREON_DOMINATOR = process.env.DISCORD_PATREON_DOMINATOR;
//DISCORD_PATREON_SUPPORTER || r === DISCORD_PATREON_SUPPORTERPLUS || r === DISCORD_PATREON_SUPPORTERPLUSPLUS 
//|| r === DISCORD_PATREON_DOMINATOR) {
const PORT = process.env.PORT || 3002;
const redirect = encodeURIComponent(`http://localhost:${PORT}/api/discord/callback`);

const cookieParser = require('cookie-parser');
// const session = require('express-session');


app.set('view engine', 'ejs');

const client = new pg.Client(process.env.DATABASE_URL);
client.connect();
client.on('error', (error) => console.log(error));

app.use(express.urlencoded({extended: true}));
app.use(express.static('./public'));

app.use(cookieParser());

app.use(methodOverride((request, response) => {
  if (request.body && typeof request.body === 'object' && '_method' in request.body) {
    let method = request.body._method;
    delete request.body._method;
    return method;
  }
}));

app.get('/', catchAsync(async(req, res) => {
  if (req.cookies['Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Token']);
      res.render('./pages/index', {user : validateUser});
    }
  }
));

app.get('/login', (req, res) => {
  res.redirect(`https://discordapp.com/api/oauth2/authorize?client_id=${CLIENT_ID}&scope=identify&response_type=code&redirect_uri=${redirect}`);
});

app.get('/logout', (req, res) => {
  res.clearCookie('Token');
  res.redirect('/');
});

app.get('/api/discord/callback', catchAsync(async (req, res) => {
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
  const cookieExpirationInMS = 2592000000; // 30 days 
  res.cookie('Token', json.access_token, {maxAge: cookieExpirationInMS, httpOnly: true});
  res.redirect('/');
}));

async function authenticateUser(token) {
  let result = {
    isAdmin: false,
    isPatreon: false,
    username: null,
    discriminator: null,
    id: null,
    picture: null
  }
  if (token === undefined) {
    return result = {
      isAdmin: false
    }
  } else {
    try {
      let userResponse = await superagent.get('https://discordapp.com/api/users/@me').set('Authorization', `Bearer ${token}`);
      let user = userResponse.body;
      let rolesResponse = await superagent.get(`https://discordapp.com/api/guilds/${DISCORD_GUILD_ID}/members/${user.id}`).set('Authorization', `Bot ${DISCORD_BOT_ID}`);
      let roles = rolesResponse.body.roles;
      let userAvatar = `https://cdn.discordapp.com/avatars/${user.id}/${user.avatar}`;
      if (roles == null) {
        return result = {
          isAdmin: false,
          isPatreon: false,
          username: user.username,
          discriminator: user.discriminator,
          id: user.id,
          picture: userAvatar
        };
      } else {
        roles.forEach(role => {
        if (role === DISCORD_ADMIN_GROUP_ID) {
            result.isAdmin = true;
        }
        if (role === DISCORD_PATREON_SUPPORTER || role === DISCORD_PATREON_SUPPORTERPLUS || 
            role === DISCORD_PATREON_SUPPORTERPLUSPLUS || role === DISCORD_PATREON_DOMINATOR) {
          result.isPatreon = true;
        }
        });
        return result = {
          isAdmin: result.isAdmin,
          isPatreon: result.isPatreon,
          username: user.username,
          discriminator: user.discriminator,
          id: user.id,
          picture: userAvatar
        };
      }
    } catch (e) {
      return e;
    }
  }
}

app.use('/api/discord', router);
app.use((err, req, res, next) => {
  switch (err.message) {
    case 'NoCodeProvided':
      return res.status(400).send({
        status: 'PLEASE LOG IN',
        error: err.message,
      });
    case 'InvalidCode':
      return res.status(401).send({
        status: 'REVOKED TOKEN',
        error: err.message,
      });  
    default:
      return res.status(500).send({
        status: 'ERROR',
        error: err.message,
      });
  }
});

app.get('/admin', catchAsync(async(req, res) => {
  if (req.cookies['Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Token']);
    if (validateUser.isAdmin === true) {
      res.render('./pages/adminPage', {user : validateUser});  
    } else {
      res.render('./pages/unauthorized');
    }
  }
}));

app.post('/form_initial', catchAsync(async(req, res) => {
  if (req.cookies['Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Token']);
    let ticketType = req.body.ticketType;
    let initialInfo = req.body;
    if (ticketType === "ticketGeneral") {
      
    }
    if (ticketType === "ticketElementChoice") {
      res.redirect('/new/element');
    }
    if (ticketType === "ticketPatreonChoice") {
      res.redirect('/new/patreon');
    }
    if (ticketType === "banAppeal") {
      console.log(initialInfo);
      res.render('./pages/forms/ticketBanAppeal', {user : validateUser, generalInfo: initialInfo});
    }
    if (ticketType === "reportABug") {
      res.redirect('/new/bug');
    }    
  }   
}));

//Just pass validatedUser.isAdmin and do something based off of that.
app.get('/new', catchAsync(async(req, res) => {
  if (req.cookies['Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Token']);
      res.render('./pages/forms/newTicket', {user : validateUser});
    }
  }
));

app.get('/status', catchAsync(async(req, res) => {
  if (req.cookies['Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Token']);
      res.render('./pages/status', {user : validateUser});
    }
  }
));

app.get('*', (req, res) => {res.status(404).render('pages/error')});

app.listen(PORT, () => console.log(`Server is live on ${PORT}`));