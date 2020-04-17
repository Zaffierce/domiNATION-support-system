'use strict';

const express = require('express');
const superagent = require('superagent');
const pg = require('pg');
const app = express();
const methodOverride = require('method-override');
const fetch = require('node-fetch');
const btoa = require('btoa');
const Discord  = require('discord.js');
const { catchAsync } = require('./util/utils');
const router = express.Router();
// const log = require('simple-node-logger').createSimpleLogger('./logs/project.log');

//Configurable variables//
require('dotenv').config();
const CLIENT_ID = process.env.CLIENT_ID;
const CLIENT_SECRET = process.env.CLIENT_SECRET;
const DISCORD_BOT_ID = process.env.DISCORD_BOT_ID;
const DISCORD_GUILD_ID = process.env.DISCORD_GUILD_ID;
const DISCORD_ADMIN_GROUP_ID = process.env.DISCORD_ADMIN_GROUP_ID;
const DISCORD_PATREON_SUPPORTER = process.env.DISCORD_PATREON_SUPPORTER;
const DISCORD_PATREON_SUPPORTERPLUS = process.env.DISCORD_PATREON_SUPPORTERPLUS;
const DISCORD_PATREON_SUPPORTERPLUSPLUS = process.env.DISCORD_PATREON_SUPPORTERPLUSPLUS;
const DISCORD_PATREON_DOMINATOR = process.env.DISCORD_PATREON_DOMINATOR;
const PORT = process.env.PORT || 3002;
const CALLBACK = process.env.CALLBACK_URL;

const redirect = encodeURIComponent(`${CALLBACK}`);

const cookieParser = require('cookie-parser');

app.set('view engine', 'ejs');

const client = new pg.Client(process.env.DATABASE_URL);

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
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    if (validateUser.status === 404) {
      res.render('./pages/user_not_found', {
        user : validateUser
      });
    } else {
      //TODO:  Make status the home page, and clean the routes up.
      res.redirect('/status');
    }
  }
}));

app.get('/submitted', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    res.render('./pages/ticket_submitted', {user : validateUser});
    }
}));

app.get('/login', (req, res) => {
  res.redirect(`https://discordapp.com/api/oauth2/authorize?client_id=${CLIENT_ID}&scope=identify&response_type=code&redirect_uri=${redirect}`);
});

app.get('/logout', (req, res) => {
  res.clearCookie('Domi-Support-Token');
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
  const cookieExpirationInMS = 604800000; // 7 days, since that's when the Discord Token expires
  res.cookie('Domi-Support-Token', json.access_token, {maxAge: cookieExpirationInMS, httpOnly: false});
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

app.get('/all', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    if (validateUser.isAdmin === true) {

      let allTickets = [];
      const status = ['NEW', 'OPEN', 'COMPLETE', 'CANCELLED'];

      for (const i in status) {
        let ticket = await queryDatabaseByStatus(status[i]);
        ticket.forEach(ticket => allTickets.push(ticket));
      }
        res.render('./pages/admin/adminPage', {
          user : validateUser,
          tickets : allTickets
        });
    } else {
      res.redirect('/');
    }
  }
}));

app.get('/admin', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validatedUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    const servers = await queryServerList();
    const dinos = await queryDinosaurList();
    const dino_colors = await queryDinosaurColors();
    if (validatedUser.isAdmin === true) {
      res.render('./pages/admin/adminPanel', {
        user : validatedUser,
        servers : servers.rows,
        dino_names : dinos.rows,
        dino_colors : dino_colors.rows
      });
    } else {
      res.redirect('/');
    }
  }
}));

app.get('/anonymous', catchAsync(async(req,res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validatedUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    res.render('./pages/public/anonymous', {
      user : validatedUser
    });
  }
}));

app.post('/creating-ticket', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    const servers = await queryServerList();
    let ticketType = req.body.ticketType;
    let initialInfo = req.body;

    switch(ticketType) {
      case 'General Support Ticket':
        res.render('./pages/forms/general_ticket', 
        {user : validateUser,
        generalInfo : initialInfo,
        ticketType});
        break;

      case 'Element Request':
        res.render('./pages/forms/element_choice',
        {user : validateUser,
        generalInfo : initialInfo,
        ticketType});
        break;

      case 'Element from Event':
        res.render('./pages/forms/element_event',
        {user : validateUser,
        generalInfo : initialInfo,
        ticketType,
        servers : servers.rows});
        break;

      case 'Transfer Element':
        res.render('./pages/forms/element_transfer',
        {user : validateUser,
        generalInfo : initialInfo,
        ticketType,
        servers : servers.rows});
        break;

      case 'Patreon Request':
        res.render('./pages/forms/patreon_choice',
        {user : validateUser,
        generalInfo : initialInfo,
        ticketType});
        break;

      case 'Patreon Monthly Dino':
        const dinos = await queryDinosaurList();
        const dino_colors = await queryDinosaurColors();
        res.render('./pages/forms/patreon_dino_request',
        {user : validateUser,
        generalInfo : initialInfo,
        dino_names : dinos.rows,
        dino_colors: dino_colors.rows,
        ticketType,
        servers : servers.rows});
        break;

      case 'Patreon Insurance Request':
        res.render('./pages/forms/patreon_dino_insurance',
        {user : validateUser,
        generalInfo : initialInfo,
        ticketType});
        break;

      case 'Ban Appeal':
        res.render('./pages/forms/ban_appeal',
        {user : validateUser,
        generalInfo : initialInfo,
        ticketType});
        break;

      case 'Bug Report':
        res.render('./pages/forms/bug_report',
        {user : validateUser,
        generalInfo : initialInfo,
        ticketType});
        break;
    }  
  }   
}));

app.post('/ticket-submit', catchAsync(async(req, res) =>{
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    let sqlQueryInsert;
    let sqlValueArr = [];
    let ticketType = req.body.typeOfRequest;
    let ticket = req.body;
    let timestamp = currentDateAndTime();

    switch(ticketType) {
      case 'General Support Ticket':
        sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, gen_tribe_name, gen_coordinates, gen_issue, gen_resolution) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12);';
        sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.tribe_name, ticket.coordinates, ticket.issue, ticket.resolution];
        break;

      case 'Element from Event':
        sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, event_name, event_serverid_dropoff, event_patreon_status, event_element_dropoff_location) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12);';
        sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.event_name, ticket.serverid_dropoff, ticket.patreon, ticket.element_dropoff_location];
        break;

      case 'Transfer Element':
        sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, transfer_amount, transfer_serverid_pickup, transfer_server_pickup_location, transfer_serverid_dropoff, transfer_server_dropoff_location) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13);';
        sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.transfer_amount, ticket.serverid_pickup, ticket.server_pickup_location, ticket.serverid_dropoff, ticket.server_dropoff_location];
        break;

      case 'Patreon Monthly Dino':
        sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, request_serverid_dropoff, request_dino_name, request_colored, request_region0, request_region1, request_region2, request_region3, request_region4, request_region5, request_sex, request_server_dropoff_location, request_email_address) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20);';
        sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.serverid_dropoff, ticket.dino_choice, ticket.dino_color, ticket.region0, ticket.region1, ticket.region2, ticket.region3, ticket.region4, ticket.region5, ticket.sex, ticket.server_dropoff_location, ticket.email_address];
        break;

      case 'Patreon Insurance Request':
        sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, insurance_dino_link, insurance_email_address, insurance_month_claimed, insurance_explanation) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12);';
        sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.link, ticket.email_address, ticket.month_claimed, ticket.explanation];
        break;

      case 'Ban Appeal':
        sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, ban_steam_id, ban_email_address, ban_banned_reason, ban_unban_reason) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12);';
        sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.steam_id, ticket.email_address, ticket.banned_reason, ticket.unbanned_explanation];
        break;

      case 'Bug Report':
        sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, bug_issue, bug_recreate, bug_lost_items) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);';
        sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.issue, ticket.recreate, ticket.lost_items];
        break;

      case 'Anonymous':
        sqlQueryInsert = 'INSERT INTO tickets (id, status, type_of_ticket, submitted_on, anonymous_description) VALUES (uuid_generate_v4(), $1, $2, $3, $4);';
        sqlValueArr = ["NEW", ticket.typeOfRequest, timestamp, ticket.description];
    }
    client.query(sqlQueryInsert, sqlValueArr).then(() => {
      client.query('SELECT id from tickets ORDER BY incrementer DESC LIMIT 1;').then(sqlRes => {
        sendNotification(sqlRes.rows);
        createNote(sqlRes.rows[0].id, 'NEW', timestamp, validateUser.username);
        res.redirect('/submitted');
      });
    });
  }
}));

app.post('/accept/:id', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    let ticket_id = req.params.id;
    let timestamp = currentDateAndTime();
    let sqlQuery = 'UPDATE tickets SET status=$1, accepted_by=$2, accepted_on=$3 where id=$4;'
    let sqlArr = ["OPEN", validateUser.username, timestamp, ticket_id];
    createNote(ticket_id, 'OPEN', timestamp, validateUser.username);
    client.query(sqlQuery, sqlArr).then(res.redirect(`/details/${ticket_id}`));
  }
}));

app.post('/cancel/:id', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    let ticket_id = req.params.id;
    let timestamp = currentDateAndTime();
    let sqlQuery = 'UPDATE tickets SET status=$1, closed_by=$2, closed_on=$3 where id=$4;'
    let sqlArr = ["CANCELLED", validateUser.username, timestamp, ticket_id];
    createNote(ticket_id, `Ticket cancelled for reason:  ${req.body.cancel_desc} - ${validateUser.username}`, timestamp, validateUser.username);
    client.query(sqlQuery, sqlArr).then(res.redirect(`/details/${ticket_id}`));
  }
}));

app.post('/complete/:id', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    let ticket_id = req.params.id;
    let timestamp = currentDateAndTime();
    let sqlQuery = 'UPDATE tickets SET status=$1, closed_by=$2, closed_on=$3 where id=$4;'
    let sqlArr = ["COMPLETE", validateUser.username, timestamp, ticket_id];
    createNote(ticket_id, `COMPLETE`, timestamp, validateUser.username);
    client.query(sqlQuery, sqlArr).then(res.redirect('/all'));
  }
}));

app.post('/notes-add/:id', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    let ticket_id = req.params.id;
    let timestamp = currentDateAndTime();
    let sqlQuery = 'INSERT INTO notes (note_id, ticket_id, description, date, discord_name, discord_id) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5);';
    let sqlArr = [ticket_id, req.body.description, timestamp, validateUser.username, validateUser.id];
    client.query(sqlQuery, sqlArr).then(res.redirect(`/details/${ticket_id}`));
  }
}));

app.post('/notes-delete/:note_id', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    let ticket_id = req.body.id;
    let notes_id = req.params.note_id;
    let sqlQuery = 'DELETE FROM notes WHERE note_id = $1;';
    let sqlArr = [notes_id];
    client.query(sqlQuery, sqlArr).then(res.redirect(`/details/${ticket_id}`));
  }
}));

app.post('/notes-edit/:note_id', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    let ticket_id = req.body.id;
    let notes_id = req.params.note_id;
    let sqlQuery = 'UPDATE NOTES set description=$1, edited=$2 WHERE note_id=$3;';
    let sqlArr = [req.body.description, true, notes_id];
    client.query(sqlQuery, sqlArr).then(res.redirect(`/details/${ticket_id}`));
  }
}));

app.get('/details/:id', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    let ticket_id = req.params.id;
    const queryNotes = await client.query(`SELECT * FROM notes WHERE ticket_id = '${ticket_id}' ORDER BY date ASC;`);
    client.query(`SELECT * FROM tickets WHERE id ='${ticket_id}';`).then(sqlRes => {
      res.render('./pages/public/detailed', {
        user : validateUser,
        ticket : sqlRes.rows[0],
        notes : queryNotes.rows,
        notesSize : queryNotes.rowCount
      });
    });   
  }
}));

app.get('/new', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    const servers = await queryServerList();
    res.render('./pages/forms/new', {
      user : validateUser,
      servers : servers.rows
    });
  }
}));

app.get('/status', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    let myTickets = [];
    const status = ['NEW', 'OPEN', 'COMPLETE', 'CANCELLED'];

    for (const i in status) {
      let ticket = await queryDatabaseByStatusAndUserID(status[i], validateUser.id);
      ticket.forEach(ticket => myTickets.push(ticket));
    }
    res.render('./pages/public/status', {
      user : validateUser,
      myTickets      
    });
  }
}));

app.post('/remove', catchAsync(async(req, res) => {
  let option = req.body;
  let sqlQuery;
  if (option.server_id) {
    sqlQuery = `DELETE FROM servers WHERE server_id = '${option.server_id}';`;
  }
  if (option.dino_id) {
    sqlQuery = `DELETE FROM dinosaurs WHERE id = '${option.dino_id}';`;
  }
  if (option.color_id) {
    sqlQuery = `DELETE FROM dinocolors WHERE id = '${option.color_id}';`;
  }
  client.query(sqlQuery).then(res.redirect('/admin'));
}));

app.post('/edit', catchAsync(async(req, res) => {
  let option = req.body;
  let sqlQuery;
  let sqlValues = [];
  if (option.server_id) {
    sqlQuery = 'UPDATE servers SET server_id=$1, server_name=$2 where id=$3;';
    sqlValues = [req.body.server_id, req.body.server_name, req.body.id];
  }
  if (option.dino_id) {
    sqlQuery = 'UPDATE dinosaurs SET name=$1 where id=$2;';
    sqlValues = [req.body.dino_name, req.body.dino_id];
  }
  if (option.dino_color_id) {
    sqlQuery = 'UPDATE dinocolors SET color_id=$1, color_name=$2, color_hex=$3 where id=$4;';
    sqlValues = [req.body.dino_color_id, req.body.dino_color_name, req.body.dino_color_hex, req.body.id];
  }
  client.query(sqlQuery, sqlValues).then(res.redirect('/admin'));
}));

app.post('/add', catchAsync(async(req, res) => {
  let option = req.body;
  let sqlQuery;
  let sqlValues = [];
  if (option.server_id) {
    sqlQuery = 'INSERT INTO servers (server_id, server_name) values ($1, $2);';
    sqlValues = [req.body.server_id, req.body.server_name];
  }
  if (option.dino_name) {
    sqlQuery = 'INSERT INTO dinosaurs (name) values ($1);';
    sqlValues = [req.body.dino_name];
  }
  if (option.dino_color_id) {
    sqlQuery = 'INSERT INTO dinocolors (color_id, color_name, color_hex) values ($1, $2, $3);';
    sqlValues = [req.body.dino_color_id, req.body.dino_color_name, req.body.dino_color_hex];
  }
  client.query(sqlQuery, sqlValues).then(res.redirect('/admin'));
  
}));

app.get('*', (req, res) => {res.status(404).render('pages/error')});

async function queryServerList() {
  return client.query('SELECT * FROM servers ORDER BY server_id ASC;');
};

async function queryDinosaurList() {
  return client.query('SELECT * FROM dinosaurs ORDER BY name ASC;');
};

async function queryDinosaurColors() {
  return client.query('SELECT * FROM dinocolors ORDER BY id ASC');
};

async function queryDatabaseByStatus(status) {
  return client.query(`SELECT * FROM tickets WHERE status = '${status}' ORDER BY submitted_on DESC;`).then(sqlRes => sqlRes.rows.map(ticket => { return new Ticket(ticket)}));
};

async function queryDatabaseByStatusAndUserID(status, userID) {
  return client.query(`SELECT * FROM tickets WHERE status = '${status}' AND discord_id = '${userID}' ORDER BY submitted_on DESC;`).then(sqlRes => sqlRes.rows.map(ticket => { return new Ticket(ticket)}));
};

async function createNote(ticket_id, status, timestamp, user_name) {
  switch(status) {
    case 'NEW' :
      status = `Ticket submitted - ${user_name}`;
      break;
    
    case 'OPEN' :
      status = `Ticket approved - ${user_name}`;
      break;

    case 'COMPLETE' :
      status = `Ticket completed - ${user_name}`;
      break;
  }

  let sqlQuery = 'INSERT INTO notes (note_id, ticket_id, description, date, discord_name, discord_id) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5);'
  let sqlArr = [ticket_id, status, timestamp, 'SYSTEM', null];
  client.query(sqlQuery, sqlArr);
}

async function sendNotification(ticketID) {

  const Webhook = new Discord.WebhookClient(process.env.WEBHOOK_ID, process.env.WEBHOOK_TOKEN);
  let content;
  let id = ticketID[0].id
  content = `<https://support.domination-gaming.com/details/${id}>`;
  Webhook.send('```**A new ticket has been submitted!**```\n'+content).then(() => {
  }).catch(e => {
    console.log("An error has occured while sending to the webhook!!!", e);
  })
};

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
};

function currentDateAndTime() {
    let date = new Date();
    return ("00" + (date.getMonth() + 1)).slice(-2) 
    + "/" + ("00" + date.getDate()).slice(-2) 
    + "/" + date.getFullYear() + " " 
    + ("00" + date.getHours()).slice(-2) + ":" 
    + ("00" + date.getMinutes()).slice(-2) 
};

function Ticket(ticket) {
  this.id = ticket.id;
  this.status = ticket.status;
  this.ign = ticket.ign;
  this.type_of_ticket = ticket.type_of_ticket;
  this.submitted_on = ticket.submitted_on;
  this.closed_on = ticket.closed_on ? ticket.closed_on : '-';
};

client.connect((err) => {
  if (err) {console.log(err) 
  } else {
    app.listen(PORT, () => console.log(`Server is live on port ${PORT}`));
  }
});