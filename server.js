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
    let openTickets = 0;
    const validateUser = await authenticateUser(req.cookies['Token']);
    //Sad code makes me sad.
    //Database relations pls.
    checkDB('ticket_general', validateUser.id).then(count_gen => {
      openTickets += count_gen.rowCount;
      checkDB('element_event', validateUser.id).then(count_element => {
        openTickets += count_element.rowCount;
        checkDB('element_transfer', validateUser.id).then(count_transfer => {
          openTickets += count_transfer.rowCount;
          checkDB('patreon_dino_request', validateUser.id).then(count_dino_reqs => {
            openTickets += count_dino_reqs.rowCount;
            checkDB('patreon_dino_insurance', validateUser.id).then(count_insurance => {
              openTickets += count_insurance.rowCount;
              checkDB('ban_appeal', validateUser.id).then(count_ban_appeal => {
                openTickets += count_ban_appeal.rowCount;
                checkDB('bug_report', validateUser.id).then(count_bug_report => {
                  openTickets += count_bug_report.rowCount;
                  console.log(openTickets);
                  res.render('./pages/index', {user : validateUser, openTickets});
                })
              })
            })
          })
        })
      })
    });
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
    console.log("Ticket type is:",ticketType);
    console.log(validateUser);
    if (ticketType === "ticketGeneral") {
      res.render('./pages/forms/ticketGeneral', {user : validateUser, generalInfo: initialInfo, ticketType});
    }
    if (ticketType === "ticketElementChoice") {
      res.render('./pages/forms/elementRequestChoice', {user : validateUser, generalInfo: initialInfo, ticketType});
    }
    if (ticketType === "elementEvent") {
      res.render('./pages/forms/ticketElement', {user : validateUser, generalInfo: initialInfo, ticketType});
    }
    if (ticketType === "elementTransfer") {
      res.render('./pages/forms/ticketElementXfr', {user : validateUser, generalInfo: initialInfo, ticketType});
    }
    if (ticketType === "ticketPatreonChoice") {
      res.render('./pages/forms/patreonRequestChoice', {user : validateUser, generalInfo: initialInfo, ticketType});
    }
    if (ticketType === "patreonMonthlyDino") {
      client.query('select * from dinosaurs order by name asc;').then(sqlDinosaurs => {
        client.query('select * from dinocolors;').then(sqlDinoColors => {
          res.render('./pages/forms/ticketPatreonDinoRequest', 
          {user : validateUser, 
          generalInfo: initialInfo, 
          dino_names : sqlDinosaurs.rows,
          dino_colors: sqlDinoColors.rows,
          ticketType});
        });
      });
    }
    if (ticketType === "patreonDinoInsurance") {
      res.render('./pages/forms/ticketPatreonDinoInsurance', {user : validateUser, generalInfo: initialInfo, ticketType});
    }
    if (ticketType === "banAppeal") {
      res.render('./pages/forms/ticketBanAppeal', {user : validateUser, generalInfo: initialInfo, ticketType});
    }
    if (ticketType === "reportABug") {
      res.render('./pages/forms/ticketReportABug', {user : validateUser, generalInfo: initialInfo, ticketType});
    }    
  }   
}));

app.post('/form_submit', catchAsync(async(req, res) =>{
  if (req.cookies['Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Token']);
    let sqlQueryInsert;
    let sqlValueArr = [];

    // console.log("********TICKET SUBMITTED*******");
    // console.log(req.body);

    let ticketType = req.body.typeOfRequest;
    let ticket = req.body;
    if (ticketType === "ticketGeneral") {
      sqlQueryInsert = 'INSERT INTO ticket_general (ign, discord_name, discord_id, server_assistance, status, tribe_name, coordinates, issue, resolution) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.tribe_name, ticket.coordinates, ticket.issue, ticket.resolution];
    }
    if (ticketType === "elementEvent") {
      sqlQueryInsert = 'INSERT INTO element_event (ign, discord_name, discord_id, server_assistance, status, event_name, serverid_dropoff, patreon_status, element_dropoff_location) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.event_name, ticket.serverid_dropoff, ticket.patreon, ticket.element_dropoff_location];
    }
    if (ticketType === "elementTransfer") {
      sqlQueryInsert = 'INSERT INTO element_transfer (ign, discord_name, discord_id, server_assistance, status, transfer_amount, serverid_pickup, server_pickup_location, serverid_dropoff, server_dropoff_location) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.transfer_amount, ticket.serverid_pickup, ticket.server_pickup_location, ticket.serverid_dropff, ticket.server_dropoff_location];
    }
    if (ticketType === "patreonMonthlyDino") {
      sqlQueryInsert = 'INSERT INTO patreon_dino_request (ign, discord_name, discord_id, server_assistance, status, serverid_dropoff, dino_name, colored, region0, region1, region2, region3, region4, region5, sex, server_dropoff_location, email_address) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.serverid_dropoff, ticket.dino_choice, ticket.dino_color, ticket.region0, ticket.region1, ticket.region2, ticket.region3, ticket.region4, ticket.region5, ticket.sex, ticket.server_dropoff_location, ticket.email_address];
    }
    if (ticketType === "patreonDinoInsurance") {
      sqlQueryInsert = 'INSERT INTO patreon_dino_insurance (ign, discord_name, discord_id, server_assistance, status, dino_link, email_address, month_claimed, explanation) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.link, ticket.email_address, ticket.month_claimed, ticket.explanation];
    }
    if (ticketType === "banAppeal") {
      sqlQueryInsert = 'INSERT INTO ban_appeal (ign, discord_name, discord_id, server_assistance, status, steam_id, email_address, banned_reason, unban_reason) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.steam_id, ticket.email_address, ticket.reason, ticket.unbanned_explanation];
    }
    if (ticketType === "reportABug") {
      sqlQueryInsert = 'INSERT INTO bug_report (ign, discord_name, discord_id, server_assistance, status, issue, recreate, lost_items) VALUES ($1, $2, $3, $4, $5, $6, $7, $8);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.issue, ticket.recreate, ticket.lost_items];
    }
    client.query(sqlQueryInsert, sqlValueArr);
    res.redirect('/');
  }
}))

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

function checkDB(table, id) {
  return client.query(`SELECT * FROM ${table} where discord_id = '${id}';`);
}

app.listen(PORT, () => console.log(`Server is live on ${PORT}`));