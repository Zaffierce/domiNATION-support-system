'use strict';

const express = require('express');
const superagent = require('superagent');
const pg = require('pg');
const app = express();
const methodOverride = require('method-override');
const fetch = require('node-fetch');
const btoa = require('btoa');
const Discord  = require('discord.js');
const { catchAsync } = require('./my-app/src/util/utils');
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
    const usersNewTickets = await findUserTickets(validateUser.id, "NEW");
    const usersOpenTickets = await findUserTickets(validateUser.id, "OPEN");
    if (validateUser.status === 404) {
      res.render('./pages/user_not_found', {
        user : validateUser
      });
    } else {
      res.render('./pages/index', {
        user : validateUser, 
        newTickets : usersNewTickets,
        openTickets : usersOpenTickets
      });
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
  const cookieExpirationInMS = 2592000000; // 30 days 
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

app.get('/alltickets', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    if (validateUser.isAdmin === true) {
      const newTickets = await findOpenTickets("NEW");
      const openTickets = await findOpenTickets("OPEN");
      res.render('./pages//admin/adminPage', {
        user : validateUser,
        newTickets : newTickets,
        openTickets : openTickets});  
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
  const dino_colors = await client.query('SELECT * FROM dinocolors;');
  if (validatedUser.isAdmin === true) {
    res.render('./pages/admin/adminPanel', {
      user: validatedUser,
      servers : servers.rows,
      dino_names : dinos.rows,
      dino_colors : dino_colors.rows
    });
  } else {
    res.redirect('/');
  }
}
}));

app.post('/form_initial', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    let ticketType = req.body.ticketType;
    let initialInfo = req.body;
    //Change to switch
    if (ticketType === "ticketGeneral") {
      res.render('./pages/forms/ticketGeneral', {user : validateUser, generalInfo: initialInfo, ticketType});
    }
    if (ticketType === "ticketElementChoice") {
      const servers = await queryServerList();
        res.render('./pages/forms/elementRequestChoice', {
          user : validateUser, 
          generalInfo: initialInfo, 
          ticketType,
          servers : servers.rows});
    }
    if (ticketType === "elementEvent") {
      const servers = await queryServerList();
        res.render('./pages/forms/ticketElement', {
          user : validateUser, 
          generalInfo: initialInfo, 
          ticketType, 
          servers : servers.rows});
    }
    if (ticketType === "elementTransfer") {
      const servers = await queryServerList();
        res.render('./pages/forms/ticketElementXfr', {
          user : validateUser, 
          generalInfo: initialInfo, 
          ticketType,
          servers : servers.rows});
    }
    if (ticketType === "ticketPatreonChoice") {
      res.render('./pages/forms/patreonRequestChoice', {user : validateUser, generalInfo: initialInfo, ticketType});
    }
    if (ticketType === "patreonMonthlyDino") {
      const dinos = await queryDinosaurList();
      const dino_colors = await client.query('SELECT * FROM dinocolors;');
      const servers = await queryServerList();
      res.render('./pages/forms/ticketPatreonDinoRequest', 
      {user : validateUser, 
      generalInfo: initialInfo, 
      dino_names : dinos.rows,
      dino_colors: dino_colors.rows,
      ticketType,
      servers : servers.rows});
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
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    let sqlQueryInsert;
    let sqlValueArr = [];

    // console.log("********TICKET SUBMITTED*******");
    // console.log(req.body);
  

    let ticketType = req.body.typeOfRequest;
    let ticket = req.body;
    let table = null;

    let date = new Date();
    let timestamp = ("00" + (date.getMonth() + 1)).slice(-2) 
    + "/" + ("00" + date.getDate()).slice(-2) 
    + "/" + date.getFullYear() + " " 
    + ("00" + date.getHours()).slice(-2) + ":" 
    + ("00" + date.getMinutes()).slice(-2) 
    + ":" + ("00" + date.getSeconds()).slice(-2);

    //Change to switch
    if (ticketType === "ticketGeneral") {
      table = 'ticket_general';
      sqlQueryInsert = 'INSERT INTO ticket_general (ign, discord_name, discord_id, server_assistance, status, tribe_name, coordinates, issue, resolution, submitted_on) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.tribe_name, ticket.coordinates, ticket.issue, ticket.resolution, timestamp];
    }
    if (ticketType === "elementEvent") {
      table = 'element_event';
      sqlQueryInsert = 'INSERT INTO element_event (ign, discord_name, discord_id, server_assistance, status, event_name, serverid_dropoff, patreon_status, element_dropoff_location, submitted_on) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.event_name, ticket.serverid_dropoff, ticket.patreon, ticket.element_dropoff_location, timestamp];
    }
    if (ticketType === "elementTransfer") {
      table = 'element_transfer';
      sqlQueryInsert = 'INSERT INTO element_transfer (ign, discord_name, discord_id, server_assistance, status, transfer_amount, serverid_pickup, server_pickup_location, serverid_dropoff, server_dropoff_location, submitted_on) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.transfer_amount, ticket.serverid_pickup, ticket.server_pickup_location, ticket.serverid_dropoff, ticket.server_dropoff_location, timestamp];
    }
    if (ticketType === "patreonMonthlyDino") {
      table = 'patreon_dino_request';
      sqlQueryInsert = 'INSERT INTO patreon_dino_request (ign, discord_name, discord_id, server_assistance, status, serverid_dropoff, dino_name, colored, region0, region1, region2, region3, region4, region5, sex, server_dropoff_location, email_address, submitted_on) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.serverid_dropoff, ticket.dino_choice, ticket.dino_color, ticket.region0, ticket.region1, ticket.region2, ticket.region3, ticket.region4, ticket.region5, ticket.sex, ticket.server_dropoff_location, ticket.email_address, timestamp];
    }
    if (ticketType === "patreonDinoInsurance") {
      table = 'patreon_dino_insurance';
      sqlQueryInsert = 'INSERT INTO patreon_dino_insurance (ign, discord_name, discord_id, server_assistance, status, dino_link, email_address, month_claimed, explanation, submitted_on) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.link, ticket.email_address, ticket.month_claimed, ticket.explanation, timestamp];
    }
    if (ticketType === "banAppeal") {
      table = 'ban_appeal';
      sqlQueryInsert = 'INSERT INTO ban_appeal (ign, discord_name, discord_id, server_assistance, status, steam_id, email_address, banned_reason, unban_reason, submitted_on) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.steam_id, ticket.email_address, ticket.reason, ticket.unbanned_explanation, timestamp];
    }
    if (ticketType === "reportABug") {
      table = 'bug_report';
      sqlQueryInsert = 'INSERT INTO bug_report (ign, discord_name, discord_id, server_assistance, status, issue, recreate, lost_items, submitted_on) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);';
      sqlValueArr = [ticket.ign, ticket.discordName, validateUser.id, ticket.serverAssistance, "NEW", ticket.issue, ticket.recreate, ticket.lost_items, timestamp];
    }
    client.query(sqlQueryInsert, sqlValueArr).then(() => {
      client.query(`SELECT id from ${table} ORDER BY id DESC LIMIT 1;`).then(sqlRes => {
        //sendNotification(ticketType, sqlRes.rows);
        res.redirect('/submitted');
      })
    });
  }
}));

app.post('/:status/:ticket_type/:id', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    let status = req.params.status.toUpperCase();
    let ticket_type = req.params.ticket_type;
    let ticket_id = req.params.id;

    let date = new Date();
    let timestamp = ("00" + (date.getMonth() + 1)).slice(-2) 
    + "/" + ("00" + date.getDate()).slice(-2) 
    + "/" + date.getFullYear() + " " 
    + ("00" + date.getHours()).slice(-2) + ":" 
    + ("00" + date.getMinutes()).slice(-2) 
    + ":" + ("00" + date.getSeconds()).slice(-2);
        //General
      let sqlArr;
      let sqlQuery;
      if (ticket_type === '1') {
        sqlQuery = `UPDATE ticket_general set status=$1, closed_by=$2, closed_on=$3 where id=$4;`;
        sqlArr = [status, validateUser.username, timestamp, ticket_id];
      }
      //Element from Event
      if (ticket_type === '2') {
        sqlQuery = `UPDATE element_event set status=$1, closed_by=$2, closed_on=$3 where id=$4;`;
        sqlArr = [status, validateUser.username, timestamp, ticket_id];
      }
      //Element Transfer
      if (ticket_type === '3') {
        sqlQuery = `UPDATE element_transfer set status=$1, closed_by=$2, closed_on=$3 where id=$4;`;
        sqlArr = [status, validateUser.username, timestamp, ticket_id];
      }
      //Patreon Dino Request
      if (ticket_type === '4') {
        sqlQuery = `UPDATE patreon_dino_request set status=$1, closed_by=$2, closed_on=$3 where id=$4;`;
        sqlArr = [status, validateUser.username, timestamp, ticket_id];
      }
      //Patreon Dino Insurance
      if (ticket_type === '5') {
        sqlQuery = `UPDATE patreon_dino_insurance set status=$1, closed_by=$2, closed_on=$3 where id=$4;`;
        sqlArr = [status, validateUser.username, timestamp, ticket_id];
      }
      //Ban Appeal
      if (ticket_type === '6') {
        sqlQuery = `UPDATE ban_appeal set status=$1, closed_by=$2, closed_on=$3 where id=$4;`;
        sqlArr = [status, validateUser.username, timestamp, ticket_id];
      }
      //Bug Request
      if (ticket_type === '7') {
        sqlQuery = `UPDATE bug_report set status=$1, closed_by=$2, closed_on=$3 where id=$4;`;
        sqlArr = [status, validateUser.username, timestamp, ticket_id];
      }
    client.query(sqlQuery, sqlArr).then(sqlRes => {
      if (validateUser.isAdmin && status === "NEW") {
        res.redirect(`${ticket_type}/${ticket_id}`);
      } else if (validateUser.isAdmin) {
        res.redirect('/alltickets');
      } else {
        res.redirect('/');
      }
  });
}}));

app.get('/details/:ticket_type/:id', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    let ticket_type = req.params.ticket_type;
    let ticket_id = req.params.id;
    //General
    if (ticket_type === '1') {
      client.query(`SELECT * FROM ticket_general where id = ${ticket_id};`).then(sqlRes => {
        if (sqlRes.rowCount > 0) {
          res.render('./pages/detailed/general', {user : validateUser, ticket : sqlRes.rows[0]});
        } else {
          res.render('./pages/ticket_not_found', {user : validateUser});
        }
      });
    } 
    //Element from Event
    if (ticket_type === '2') {
      client.query(`SELECT * FROM element_event where id = ${ticket_id};`).then(sqlRes => {
        if (sqlRes.rowCount > 0) {
          res.render('./pages/detailed/element_event', {user : validateUser, ticket : sqlRes.rows[0]});
        } else {
          res.render('./pages/ticket_not_found', {user : validateUser});
        }
      });
    }
    //Element Transfer
    if (ticket_type === '3') {
      client.query(`SELECT * FROM element_transfer where id = ${ticket_id};`).then(sqlRes => {
        if (sqlRes.rowCount > 0){
          res.render('./pages/detailed/element_transfer', {user : validateUser, ticket : sqlRes.rows[0]});
        } else {
          res.render('./pages/ticket_not_found', {user : validateUser});
        }
      });
    }
    //Patreon Dino Request
    if (ticket_type === '4') {
      client.query(`SELECT * FROM patreon_dino_request where id = ${ticket_id};`).then(sqlRes => {
        if (sqlRes.rowCount > 0) {
          res.render('./pages/detailed/dino_request', {user : validateUser, ticket : sqlRes.rows[0]});
        } else {
          res.render('./pages/ticket_not_found', {user : validateUser});
        }
      });
    }
    //Patreon Dino Insurance
    if (ticket_type === '5') {
      client.query(`SELECT * FROM patreon_dino_insurance where id = ${ticket_id};`).then(sqlRes => {
        if (sqlRes.rowCount > 0) {
          res.render('./pages/detailed/dino_insurance', {user : validateUser, ticket : sqlRes.rows[0]});
        } else {
          res.render('./pages/ticket_not_found', {user : validateUser});
        }
      });
    }
    //Ban Appeal
    if (ticket_type === '6') {
      client.query(`SELECT * FROM ban_appeal where id = ${ticket_id};`).then(sqlRes => {
        if (sqlRes.rowCount > 0) {
          res.render('./pages/detailed/ban_appeal', {user : validateUser, ticket : sqlRes.rows[0]});
        } else {
          res.render('./pages/ticket_not_found', {user : validateUser});
        }
      });
    }
    //Bug Request
    if (ticket_type === '7') {
      client.query(`SELECT * FROM bug_report where id = ${ticket_id};`).then(sqlRes => {
        if (sqlRes.rowCount > 0) {
          res.render('./pages/detailed/bug_report', {user : validateUser, ticket : sqlRes.rows[0]});
        } else {
          res.render('./pages/ticket_not_found', {user : validateUser});
        }
      });
    }
  }
}));

//Just pass validatedUser.isAdmin and do something based off of that.
app.get('/new', catchAsync(async(req, res) => {
  if (req.cookies['Domi-Support-Token'] == null) {
    res.redirect('/login');
  } else {
    const validateUser = await authenticateUser(req.cookies['Domi-Support-Token']);
    const servers = await queryServerList();
    res.render('./pages/forms/newTicket', {
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
    const usersNewTickets = await findUserTickets(validateUser.id, "NEW");
    const usersOpenTickets = await findUserTickets(validateUser.id, "OPEN");
    const usersCompleteTickets = await findUserTickets(validateUser.id, "COMPLETE");
    const usersCancelledTickets = await findUserTickets(validateUser.id, "CANCEL");
      res.render('./pages/status', {
        user : validateUser, 
        newTickets : usersNewTickets,
        openTickets : usersOpenTickets,
        closedTickets : usersCompleteTickets,
        cancelledTickets : usersCancelledTickets
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
  //TODO:Add validation that this is a unique server_id
  //? Add incrementing ID to servers and just keep track of it that way?
  let option = req.body;
  let sqlQuery;
  let sqlValues = [];
  if (option.server_id) {
    sqlQuery = 'UPDATE servers SET server_id=$1, server_name=$2 where server_id=$3;';
    sqlValues = [req.body.server_id, req.body.server_name, req.body.server_id_old];
  }
  if (option.dino_id) {
    sqlQuery = 'UPDATE dinosaurs SET name=$1 where id=$2;';
    sqlValues = [req.body.dino_name, req.body.dino_id];
  }
  if (option.color_id) {
    console.log('colors');
  }
  client.query(sqlQuery, sqlValues).then(res.redirect('/admin'));
}));

app.get('*', (req, res) => {res.status(404).render('pages/error')});

async function queryServerList() {
  return client.query('SELECT * FROM servers ORDER BY server_id ASC;');
};

async function queryDinosaurList() {
  return client.query('SELECT * FROM dinosaurs ORDER BY name ASC;');
}

async function sendNotification(ticketType, ticket_id) {

  const Webhook = new Discord.WebhookClient(process.env.WEBHOOK_ID, process.env.WEBHOOK_TOKEN);
  let content;
  let id = ticket_id[0].id
  if (ticketType === "ticketGeneral") {
    content = `<https://support.domination-gaming.com/details/1/${id}>`;
  }
  if (ticketType === "elementEvent") {
    content = `<https://support.domination-gaming.com/details/2/${id}>`;
  }
  if (ticketType === "elementTransfer") {
    content = `<https://support.domination-gaming.com/details/3/${id}>`;
  }
  if (ticketType === "patreonMonthlyDino") {
    content = `<https://support.domination-gaming.com/details/4/${id}>`;
  }
  if (ticketType === "patreonDinoInsurance") {
    content = `<https://support.domination-gaming.com/details/5/${id}>`;
  }
  if (ticketType === "banAppeal") {
    content = `<https://support.domination-gaming.com/details/6/${id}>`;
  }
  if (ticketType === "reportABug") {
    content = `<https://support.domination-gaming.com/details/7/${id}>`;
  }
  Webhook.send('```**A new ticket has been submitted!**```\n'+content).then(() => {
    //Future idea?
  }).catch(e => {
    console.log(e);
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

async function findOpenTickets(status) {
  let openTickets = 0;
  try {
    let count_gen = await checkDBAdmin('ticket_general', status);
    let count_element = await checkDBAdmin('element_event', status);
    let count_transfer = await checkDBAdmin('element_transfer', status);
    let count_dino_req = await checkDBAdmin('patreon_dino_request', status);
    let count_insurance = await checkDBAdmin('patreon_dino_insurance', status);
    let count_ban = await checkDBAdmin('ban_appeal', status);
    let count_bug = await checkDBAdmin('bug_report', status);

    openTickets += count_gen.rowCount += count_element.rowCount += count_transfer.rowCount
    += count_dino_req.rowCount += count_insurance.rowCount += count_ban.rowCount 
    += count_bug.rowCount;

    return {
      ticketCount : openTickets,
      general: count_gen.rows, 
      element: count_element.rows, 
      transfer: count_transfer.rows, 
      dino_req: count_dino_req.rows, 
      dino_ins: count_insurance.rows, 
      ban: count_ban.rows, 
      bug: count_bug.rows
    };

  } catch(e) {return e;}
};

async function findUserTickets(userID, status) {
  let openTickets = 0;
  try {
    let count_gen = await checkDB('ticket_general', userID, status);
    let count_element = await checkDB('element_event', userID, status);
    let count_transfer = await checkDB('element_transfer', userID, status);
    let count_dino_req = await checkDB('patreon_dino_request', userID, status);
    let count_insurance = await checkDB('patreon_dino_insurance', userID, status);
    let count_ban = await checkDB('ban_appeal', userID, status);
    let count_bug = await checkDB('bug_report', userID, status);

    //Silly thing is silly.
    openTickets += count_gen.rowCount += count_element.rowCount += count_transfer.rowCount
    += count_dino_req.rowCount += count_insurance.rowCount += count_ban.rowCount 
    += count_bug.rowCount;

    return {
      ticketCount : openTickets,
      general: count_gen.rows, 
      element: count_element.rows, 
      transfer: count_transfer.rows, 
      dino_req: count_dino_req.rows, 
      dino_ins: count_insurance.rows, 
      ban: count_ban.rows, 
      bug: count_bug.rows
    };
} catch(e){ return e; }
};

function checkDB(table, userID, status) {
  return client.query(`SELECT * FROM ${table} where discord_id = '${userID}' and status = '${status}';`);
};

function checkDBAdmin(table, status) {
  return client.query(`SELECT * FROM ${table} WHERE status='${status}';`);
};

client.connect((err) => {
  if (err) {console.log(err) 
  } else {
    app.listen(PORT, () => console.log(`Server is live on port ${PORT}`));
  }
});