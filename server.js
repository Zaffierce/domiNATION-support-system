'use strict';

const express = require('express');
const superagent = require('superagent');
const pg = require('pg');
const app = express();
const methodOverride = require('method-override');
// const apiRouter = require('./my-app/src/auth/authenticateUser');
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
const DISCORD_ADMIN_GROUP_ID = String(process.env.DISCORD_ADMIN_GROUP_ID);
const PORT = process.env.PORT || 3002;
const redirect = encodeURIComponent(`http://localhost:${PORT}/api/discord/callback`);

const cookieParser = require('cookie-parser');
const session = require('express-session');


app.set('view engine', 'ejs');

const client = new pg.Client(process.env.DATABASE_URL);
client.connect();
client.on('error', (error) => console.log(error));

app.use(express.urlencoded({extended: true}));
app.use(express.static('./public'));

app.use(cookieParser());
app.use(session({
  key: 'user_sid',
  secret: 'somerandonstuffs',
  resave: false,
  saveUninitialized: false,
  cookie: {
      expires: 600000
  }
}));
app.use((req, res, next) => {
  if (req.cookies.user_sid && !req.session.user) {
      res.clearCookie('user_sid');        
  }
  next();
});
var sessionChecker = (req, res, next) => {
  console.log("In sessionChecker")
  if (req.session.user && req.cookies.user_sid) {
      res.redirect('/dashboard');
  } else {
      next();
  }    
};

app.use(methodOverride((request, response) => {
  if (request.body && typeof request.body === 'object' && '_method' in request.body) {
    let method = request.body._method;
    delete request.body._method;
    return method;
  }
}));

app.get('/', sessionChecker, (req, res) => {
  res.redirect('/login');
});

app.get('/login', (req, res) => {
  res.redirect(`https://discordapp.com/api/oauth2/authorize?client_id=${CLIENT_ID}&scope=identify&response_type=code&redirect_uri=${redirect}`);
});

// app.get('/api/discord/callback', catchAsync(async (req, res) => {
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
  //Store the token somewhere
  const checkAdminPermissions = await authenticateUser(json.access_token);

  res.cookie('Token', json.access_token, {maxAge: 900000, httpOnly: true});
  req.session.secret = json.access_token;

  console.log("checkAdminPermissions", checkAdminPermissions);
  console.log("current session", req.session);
  res.redirect('/loggedIn');
}));

app.get('/loggedIn', (req, res) => {
  console.log("loggedIn", req.session);
  console.log("cookie", req.cookies['Token']);
  // console.log(req.cookies);
  res.render('./pages/loggedIn', {t: "banananananananana"});
  // res.render('./pages/loggedIn',{t : json.access_token});
})

async function authenticateUser(token) {
  if (token === undefined) {
    return false;
  } else {
    let result = false;
    try {
      let userResponse = await superagent.get('https://discordapp.com/api/users/@me').set('Authorization', `Bearer ${token}`);
      let user = userResponse.body;
      let rolesResponse = await superagent.get(`https://discordapp.com/api/guilds/${DISCORD_GUILD_ID}/members/${user.id}`).set('Authorization', `Bot ${DISCORD_BOT_ID}`);
      let roles = rolesResponse.body.roles;
      if (roles == null) {
        return result;
      } else {
        roles.forEach(r => {
          if (r == DISCORD_ADMIN_GROUP_ID) 
            return result = true;
        });
        return result;
      }
    } catch (e) {
      return e;
    }
  }
}


// app.route('/login')
//   .get(sessionChecker, (req, res) => {
//     res.render('./pages/index');
  // });
  // .post((req, res) => {
  //   let 
  // })

// app.get('/loggedIn', loggedIn)
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

// app.use('/loggedIn', loggedIn);

app.get('*', (req, res) => {res.status(404).render('pages/error')});

async function index(req, res){
let auth = await apiRouter.authenticateUser(req.t);

// console.log("auth", auth);
  res.render('./pages/index');
}

// function loggedIn(req, res) {
//   let auth = await apiRouter.authenticateUser(req.t);
//   // res.render('./pages/loggedIn');
// }




app.listen(PORT, () => console.log(`Server is live on ${PORT}`));