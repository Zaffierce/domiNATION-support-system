'use strict';

const express = require('express');
const cookieParser = require('cookie-parser');
const superagent = require('superagent');
const pg = require('pg');
const app = express();
app.use(cookieParser());
const Discord  = require('discord.js');
const { catchAsync } = require('./util/utils');
require('dotenv').config();

const DISCORD_STUDENT_ADMIN_GROUP_ID = process.env.DISCORD_STUDENT_ADMIN_GROUP_ID;
const DISCORD_ADMIN_GROUP_ID = process.env.DISCORD_ADMIN_GROUP_ID;
const DISCORD_PATREON_SUPPORTER = process.env.DISCORD_PATREON_SUPPORTER;
const DISCORD_PATREON_SUPPORTERPLUS = process.env.DISCORD_PATREON_SUPPORTERPLUS;
const DISCORD_PATREON_SUPPORTERPLUSPLUS = process.env.DISCORD_PATREON_SUPPORTERPLUSPLUS;
const DISCORD_PATREON_DOMINATOR = process.env.DISCORD_PATREON_DOMINATOR;
const PORT = process.env.PORT || 3002;
const TOKEN = process.env.TOKEN;

app.set('view engine', 'ejs');

const client = new pg.Client(process.env.DATABASE_URL);

app.use(express.urlencoded({extended: true}));
app.use(express.static('./public'));

app.get('/', catchAsync(async(req, res) => {
  if (req.cookies[TOKEN] == null) res.redirect('/login');
  let validateUser = await authenticateUser(req.cookies[TOKEN]);
  if (validateUser.principalId == null) res.redirect('/login');
  else if (validateUser.isFound === false) res.render('./pages/user_not_found', { user: validateUser }) 
  else {
    let myTickets = await queryDatabaseCustom(`SELECT * FROM tickets WHERE discord_id = '${validateUser.discordID}' ORDER BY submitted_on DESC;`);
    res.render('./pages/public/status', {
      user : validateUser,
      myTickets      
    });
  }
}));

app.post('/accept/:id', catchAsync(async(req, res) => {
  const validateUser = await authenticateUser(req.cookies[TOKEN]);
  let ticket_id = req.params.id;
  let timestamp = currentDateAndTime();
  let sqlQuery = 'UPDATE tickets SET status=$1, accepted_by=$2, accepted_on=$3 where id=$4;'
  let sqlArr = ["OPEN", validateUser.username, timestamp, ticket_id];
  createNote(ticket_id, 'OPEN', timestamp, validateUser.username);
  client.query(sqlQuery, sqlArr).then(res.redirect(`/details/${ticket_id}`));
}));

app.post('/add', catchAsync(async(req, res) => {
  let option = req.body;
  let sqlQuery;
  let sqlValues = [];
  //TODO:  Change to switch
  if (option.server_id) {
    sqlQuery = 'INSERT INTO servers (server_id, server_name) values ($1, $2);';
    sqlValues = [req.body.server_id, req.body.server_name];
  }
  if (option.dino_name) {
    sqlQuery = 'INSERT INTO dinosaurs (name, spawn, lvl, imprint) values ($1, $2, $3, $4);';
    sqlValues = [req.body.dino_name, req.body.dino_spawn, req.body.dino_lvl, req.body.dino_imprint];
  }
  if (option.dino_color_id) {
    sqlQuery = 'INSERT INTO dinocolors (color_id, color_name, color_hex) values ($1, $2, $3);';
    sqlValues = [req.body.dino_color_id, req.body.dino_color_name, req.body.dino_color_hex];
  }
  client.query(sqlQuery, sqlValues).then(res.redirect('/admin'));
}));

app.get('/admin', catchAsync(async(req, res) => {
  if (req.cookies[TOKEN] == null) res.redirect('/login');
  else {
    const validatedUser = await authenticateUser(req.cookies[TOKEN]);
    if (validatedUser.isAdmin === true) {
      const servers = await queryServerList();
      const dinos = await queryDinosaurList();
      const dino_colors = await queryDinosaurColors();
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

app.get('/all', catchAsync(async(req, res) => {
  if (req.cookies[TOKEN] == null) res.redirect('/login');
  else {
    const validateUser = await authenticateUser(req.cookies[TOKEN]);
    if (validateUser.isAdmin === true || validateUser.isStudent) {

      let openTickets = await queryDatabaseCustom("SELECT * FROM tickets WHERE (status = 'NEW' OR status = 'OPEN') ORDER BY incrementer ASC;");
      let closedTickets = await queryDatabaseCustom("SELECT * FROM tickets WHERE (status = 'COMPLETE' OR status = 'CANCELLED') ORDER BY incrementer DESC;");

      res.render('./pages/admin/adminPage', {
        user : validateUser,
        openTickets : openTickets,
        closedTickets : closedTickets
      });
    } else {
      res.redirect('/');
    }
  }
}));

app.get('/anonymous', catchAsync(async(req,res) => {
  //TODO: Opt in functionality to tie ticket to user only for their SA only
  if (req.cookies[TOKEN] == null) {
    res.redirect('/login');
  } else {
    const validatedUser = await authenticateUser(req.cookies[TOKEN]);
    res.render('./pages/public/anonymous', {
      user : validatedUser
    });
  }
}));

app.post('/cancel/:id', catchAsync(async(req, res) => {
  const validateUser = await authenticateUser(req.cookies[TOKEN]);
  let ticket_id = req.params.id;
  let timestamp = currentDateAndTime();
  let sqlQuery = 'UPDATE tickets SET status=$1, closed_by=$2, closed_on=$3 where id=$4;'
  let sqlArr = ["CANCELLED", validateUser.username, timestamp, ticket_id];
  createNote(ticket_id, `Ticket cancelled for reason:  ${req.body.cancel_desc} - ${validateUser.username}`, timestamp, validateUser.username);
  client.query(sqlQuery, sqlArr).then(res.redirect(`/details/${ticket_id}`));
}));

app.post('/complete/:id', catchAsync(async(req, res) => {
  const validateUser = await authenticateUser(req.cookies[TOKEN]);
  let ticket_id = req.params.id;
  let timestamp = currentDateAndTime();
  let sqlQuery = 'UPDATE tickets SET status=$1, closed_by=$2, closed_on=$3 where id=$4;'
  let sqlArr = ["COMPLETE", validateUser.username, timestamp, ticket_id];
  createNote(ticket_id, `COMPLETE`, timestamp, validateUser.username);
  client.query(sqlQuery, sqlArr).then(res.redirect('/all'));
}));

app.post('/creating-ticket', catchAsync(async(req, res) => {
  const validateUser = await authenticateUser(req.cookies[TOKEN]);
  const servers = await queryServerList();
  if (validateUser.steamID){
    validateUser.servers = await fetchSteam(validateUser);
  }

  let ticketType = req.body.ticketType;
  let initialInfo = req.body;
  let characterID;
  let patreon;

  const selectedServerID = Number(initialInfo.serverAssistance.split(" ")[1].replace("#", ""));
  validateUser.servers.forEach(server => {
    if (server.serverID === selectedServerID) {
      characterID = `"${server.characterName}" ${server.characterID}`;
    } 
  });

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
      patreon = await fetchPatreon(validateUser, req.cookies[TOKEN]);
      res.render('./pages/forms/patreon_dino_request',
      {user : validateUser,
      generalInfo : initialInfo,
      characterID : characterID,
      email_address : patreon[0].email,
      patreonMemberId : patreon[0].patreonMemberId,
      dino_names : dinos.rows,
      dino_colors: dino_colors.rows,
      ticketType,
      servers : servers.rows});
      break;

    case 'Patreon Insurance Request':
      patreon = await fetchPatreon(validateUser, req.cookies[TOKEN]);
      res.render('./pages/forms/patreon_dino_insurance',
      {user : validateUser,
      generalInfo : initialInfo,
      email_address: patreon[0].email,
      patreonMemberId : patreon[0].patreonMemberId,
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
}));

app.get('/details/:id', catchAsync(async(req, res) => {
  if (req.cookies[TOKEN] == null) res.redirect('/login');
  else {
    const validateUser = await authenticateUser(req.cookies[TOKEN]);
    let ticket_id = req.params.id;
    const queryNotes = await client.query(`SELECT * FROM notes WHERE ticket_id = '${ticket_id}' ORDER BY date ASC;`);
    client.query(`SELECT * FROM tickets WHERE id ='${ticket_id}';`).then(sqlRes => {
      client.query(`SELECT * FROM dinosaurs WHERE name ='${sqlRes.rows[0].request_dino_name}';`).then(results => {
        res.render('./pages/public/detailed', {
          user : validateUser,
          ticket : sqlRes.rows[0],
          notes : queryNotes.rows,
          notesSize : queryNotes.rowCount,
          dino : results.rows[0]
        });
      })
    });   
  }
}));

app.post('/edit', catchAsync(async(req, res) => {
  let option = req.body;
  let sqlQuery;
  let sqlValues = [];
  //TODO:  Change to switch
  if (option.server_id) {
    sqlQuery = 'UPDATE servers SET server_id=$1, server_name=$2 where id=$3;';
    sqlValues = [req.body.server_id, req.body.server_name, req.body.id];
  }
  if (option.dino_id) {
    sqlQuery = 'UPDATE dinosaurs SET name=$1, spawn=$2, lvl=$3, imprint=$4 where id=$5;';
    sqlValues = [req.body.dino_name, req.body.dino_spawn, req.body.dino_lvl, req.body.dino_imprint, req.body.dino_id];
  }
  if (option.dino_color_id) {
    sqlQuery = 'UPDATE dinocolors SET color_id=$1, color_name=$2, color_hex=$3 where id=$4;';
    sqlValues = [req.body.dino_color_id, req.body.dino_color_name, req.body.dino_color_hex, req.body.id];
  }
  client.query(sqlQuery, sqlValues).then(res.redirect('/admin'));
}));

app.get('/login', (req, res) => {
  res.clearCookie(TOKEN, {domain: '.domination-gaming.com', path: '/'});
  res.redirect(`https://auth.domination-gaming.com/oauth/discord?redirect_uri=https://support.domination-gaming.com/`);
});

app.get('/logout', (req, res) => {
  res.clearCookie(TOKEN, {domain: '.domination-gaming.com', path: '/'});
  res.redirect('https://domination-gaming.com/');
});

app.get('/new', catchAsync(async(req, res) => {
  if (req.cookies[TOKEN] == null) res.redirect('/login');
  else {
    const validateUser = await authenticateUser(req.cookies[TOKEN]);
    const servers = await queryServerList();
    if (validateUser.steamID) {
      validateUser.servers = await fetchSteam(validateUser);
    }
    res.render('./pages/forms/new', {
      generalInfo : null,
      user : validateUser,
      servers : servers.rows
    });
  }
}));

app.post('/notes-add/:id', catchAsync(async(req, res) => {
  const validateUser = await authenticateUser(req.cookies[TOKEN]);
  let ticketID = req.params.id;
  let timestamp = currentDateAndTime();
  let sqlQuery = 'INSERT INTO notes (note_id, ticket_id, description, date, discord_name, discord_id) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5);';
  let sqlArr = [ticketID, req.body.description, timestamp, validateUser.username, validateUser.discordID];
  const originalUserID = await client.query(`SELECT discord_id FROM tickets where id = '${ticketID}';`);
  // sendNoteNotification(ticketID);
  if (validateUser.discordID != originalUserID.rows[0].discord_id) {
    if (originalUserID.rows[0].discord_id != null) {
      sendNoteNotification(ticketID);
    };
  }
  client.query(sqlQuery, sqlArr).then(res.redirect(`/details/${ticketID}`));
}));

app.post('/notes-delete/:note_id', catchAsync(async(req, res) => {
  let ticket_id = req.body.id;
  let notes_id = req.params.note_id;
  let sqlQuery = 'DELETE FROM notes WHERE note_id = $1;';
  let sqlArr = [notes_id];
  client.query(sqlQuery, sqlArr).then(res.redirect(`/details/${ticket_id}`));
}));

app.post('/notes-edit/:note_id', catchAsync(async(req, res) => {
  let ticket_id = req.body.id;
  let notes_id = req.params.note_id;
  let sqlQuery = 'UPDATE NOTES set description=$1, edited=$2 WHERE note_id=$3;';
  let sqlArr = [req.body.description, true, notes_id];
  client.query(sqlQuery, sqlArr).then(res.redirect(`/details/${ticket_id}`));
}));

app.post('/remove', catchAsync(async(req, res) => {
  let option = req.body;
  let sqlQuery;
  //TODO:  Change to switch
  if (option.server_id) {
    sqlQuery = `DELETE FROM servers WHERE server_id = '${option.server_id}';`;
  }
  if (option.dino_id) {
    sqlQuery = `DELETE FROM dinosaurs WHERE id = '${option.dino_id}';`;
  }
  if (option.dino_color_id) {
    sqlQuery = `DELETE FROM dinocolors WHERE id = '${option.dino_color_id}';`;
  }
  client.query(sqlQuery).then(res.redirect('/admin'));
}));

app.get('/submitted', catchAsync(async(req, res) => {
  if (req.cookies[TOKEN] == null) res.redirect('/login');
  else {
    const validateUser = await authenticateUser(req.cookies[TOKEN]);
    res.render('./pages/ticket_submitted', {user : validateUser});
  }
}));

app.post('/ticket-submit', catchAsync(async(req, res) =>{
  const validateUser = await authenticateUser(req.cookies[TOKEN]);
  let sqlQueryInsert;
  let sqlValueArr = [];
  let ticketType = req.body.typeOfRequest;
  let ticket = req.body;
  let timestamp = currentDateAndTime();

  switch(ticketType) {
    case 'General Support Ticket':
      sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, gen_tribe_name, gen_coordinates, gen_issue, gen_resolution) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.discordID, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.tribe_name, ticket.coordinates, ticket.issue, ticket.resolution];
      break;

    case 'Element from Event':
      sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, event_name, event_serverid_dropoff, event_patreon_status) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.discordID, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.event_name, ticket.serverid_dropoff, ticket.patreon];
      break;

    case 'Transfer Element':
      sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, transfer_amount, transfer_serverid_pickup, transfer_server_pickup_location, transfer_serverid_dropoff) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.discordID, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.transfer_amount, ticket.serverid_pickup, ticket.server_pickup_location, ticket.serverid_dropoff];
      break;

    case 'Patreon Monthly Dino':
      sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, request_serverid_dropoff, request_dino_name, request_colored, request_region0, request_region1, request_region2, request_region3, request_region4, request_region5, request_sex, request_email_address, request_character_id, request_patreon_member_id) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.discordID, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.serverid_dropoff, ticket.dino_choice, ticket.dino_color, ticket.region0, ticket.region1, ticket.region2, ticket.region3, ticket.region4, ticket.region5, ticket.sex, ticket.email_address, ticket.character_id, ticket.patreonMemberID];
      break;

    case 'Patreon Insurance Request':
      sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, insurance_dino_link, insurance_email_address, insurance_month_claimed, insurance_explanation, request_patreon_member_id) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.discordID, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.link, ticket.email_address, ticket.month_claimed, ticket.explanation, ticket.patreonMemberID];
      break;

    case 'Ban Appeal':
      sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, ban_steam_id, ban_email_address, ban_banned_reason, ban_unban_reason) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.discordID, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.steam_id, ticket.email_address, ticket.banned_reason, ticket.unbanned_explanation];
      break;

    case 'Bug Report':
      sqlQueryInsert = 'INSERT INTO tickets (id, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, bug_issue, bug_recreate, bug_lost_items) VALUES (uuid_generate_v4(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.discordID, ticket.serverAssistance, "NEW", ticket.timeToContact, ticket.typeOfRequest, timestamp, ticket.issue, ticket.recreate, ticket.lost_items];
      break;

    case 'Anonymous':
      sqlQueryInsert = 'INSERT INTO tickets (id, status, type_of_ticket, submitted_on, anonymous_description) VALUES (uuid_generate_v4(), $1, $2, $3, $4);';
      sqlValueArr = ["NEW", ticket.typeOfRequest, timestamp, ticket.description];
  }
  client.query(sqlQueryInsert, sqlValueArr).then(() => {
    client.query('SELECT id from tickets ORDER BY incrementer DESC LIMIT 1;').then(sqlRes => {
      sendNotification(sqlRes.rows);
      if (ticketType === 'Anonymous') {
        createNote(sqlRes.rows[0].id, 'NEW', timestamp, 'ANON');
      } else {
        createNote(sqlRes.rows[0].id, 'NEW', timestamp, validateUser.username);
      }
      res.redirect('/submitted');
    });
  });
}));

app.get('*', (req, res) => {res.status(404).render('pages/error')});

async function queryServerList() {
  return client.query('SELECT * FROM servers ORDER BY server_id ASC;');
};

async function queryDinosaurList() {
  return client.query('SELECT * FROM dinosaurs ORDER BY name ASC;');
};

async function queryDinosaurColors() {
  return client.query('SELECT * FROM dinocolors ORDER BY color_id ASC');
};

async function queryDatabaseCustom(query) {
  return client.query(query).then(sqlRes => sqlRes.rows.map(ticket => { return new Ticket(ticket)}));
}

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

async function sendNoteNotification(ticketID) {
  const Webhook = new Discord.WebhookClient(process.env.WEBHOOK_NOTE_ID, process.env.WEBHOOK_NOTE_TOKEN);
  client.query(`SELECT discord_id from tickets where id = '${ticketID}';`).then(sqlRes => {
    let userID = sqlRes.rows[0].discord_id;
    Webhook.send(`<@${userID}>,  https://support.domination-gaming.com/details/${ticketID}`);
  });
};

async function authenticateUser(token) {
  let result = {
    isStudent: false,
    isAdmin: false,
    isPatreon: false,
    isSupPlus: false,
    username: null,
    discriminator: null,
    discordID: null,
    steamID: null,
    patronID: null,
    email: null,
    servers: [],
    picture: null,
    isFound: false,
    principalId: null
  }
  return superagent.get('https://auth.domination-gaming.com/user').set('X-Auth-Token', token).then(res => {
    if (res.body.principalId === null) {
      return result = {
        principalId: res.body.principalId
      }
    } else if (res.body.discordGuildMember === null) {
      return result = {
        userID: res.body.discordUserOnLogin.discordId,
        username: res.body.discordUserOnLogin.username,
        discriminator: res.body.discordUserOnLogin.discriminator,
        principalId: res.body.principalId,
        isFound: false
      }
    } else {
      let user = res.body.discordGuildMember;
      if (user.roles.length != 0) {
        try {
          user.roles.forEach(role => {
            if (role === DISCORD_ADMIN_GROUP_ID) {
              result.isAdmin = true;
            }
            if (role === DISCORD_PATREON_SUPPORTER || role === DISCORD_PATREON_SUPPORTERPLUS || 
                role === DISCORD_PATREON_SUPPORTERPLUSPLUS || role === DISCORD_PATREON_DOMINATOR) {
              result.isPatreon = true;
            }
            if (role === DISCORD_PATREON_SUPPORTERPLUS || role === DISCORD_PATREON_SUPPORTERPLUSPLUS || role === DISCORD_PATREON_DOMINATOR) {
              result.isSupPlus = true;
            }
            if (role === DISCORD_STUDENT_ADMIN_GROUP_ID) {
              result.isStudent = true;
            }               
          });
          return result = {
            isStudent: result.isStudent,
            isAdmin: result.isAdmin,
            isPatreon: result.isPatreon,
            isSupPlus: result.isSupPlus,
            username: user.user.username,
            discriminator: user.user.discriminator,
            discordID: user.user.id,
            steamID: res.body.steamId,
            patronID: null,
            email: null,
            servers: result.servers,
            picture: user.user.avatar,
            isFound: true,
            principalId: res.body.principalId
          };
        } catch (e) {
          console.log(e);
          return e;
        }
      } else { 
        return result = {
          isStudent: false,
          isAdmin: false,
          isPatreon: false,
          isSupPlus: false,
          username: user.user.username,
          discriminator: user.user.discriminator,
          discordID: user.user.id,
          steamID: res.body.steamId,
          patronID: null,
          email: null,
          servers: [],
          picture: user.user.avatar,
          isFound: true,
          principalId: res.body.principalId
        };
      }
    }
  });
}

async function fetchSteam(validateUser) {
  if (validateUser.steamID) {
    try {
      return superagent.get(`https://ark-stats-backend.domination-gaming.com/player?filter=steam.id==${validateUser.steamID}`).then(resPlayer => {
        const arkData = resPlayer.body.data;
        arkData.sort(function(a, b) {
          return parseFloat(a.serverId) - parseFloat(b.serverId);
        });
        for (const server in arkData) {
          validateUser.servers.push({
            serverID: arkData[server].serverId,
            characterID: arkData[server].character.id,
            characterName: arkData[server].character.name,
            characterLevel: arkData[server].character.level ? arkData[server].character.level : 1
          });
        }
      return validateUser.servers;
      });
    } catch(e) {
      console.log(e);
    }
  } else {
    return "No character found"
  }
}

async function fetchPatreon(validateUser, token) {
  return superagent.get(`https://rewards-backend.domination-gaming.com/patreon/patrons?filter=discordId==${validateUser.discordID}`).set('X-Auth-Token', token).then(res => {
    return res.body.data;
  });
}

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
  this.discord_name = ticket.discord_name;
  this.type_of_ticket = ticket.type_of_ticket;
  this.submitted_on = new Date(ticket.submitted_on).toLocaleString();
  this.closed_on = ticket.closed_on ? new Date(ticket.submitted_on).toLocaleString() : '-'
  this.server_assistance = ticket.server_assistance ? ticket.server_assistance.split('#').splice(1) : '-';
};

client.connect((err) => {
  if (err) console.log(err) 
  else app.listen(PORT, () => console.log(`Server is live on port ${PORT}`));
});