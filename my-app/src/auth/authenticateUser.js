import React from 'react';
require('dotenv').config();
const CLIENT_ID = process.env.CLIENT_ID;
const CLIENT_SECRET = process.env.CLIENT_SECRET;
const DISCORD_BOT_ID = process.env.DISCORD_BOT_ID;
const DISCORD_GUILD_ID = process.env.DISCORD_GUILD_ID;
const DISCORD_ADMIN_GROUP_ID = process.env.DISCORD_ADMIN_GROUP_ID;
const PORT = process.env.PORT;
const redirect = encodeURIComponent(`http://localhost:${PORT}/api/discord/callback`);

const express = require('express');
const fetch = require('node-fetch');
const btoa = require('btoa');
const { catchAsync } = require('../../../utils');
const superagent = require('superagent');
const router = express.Router();

router.get('/login', (req, res) => {
  res.redirect(`https://discordapp.com/api/oauth2/authorize?client_id=${CLIENT_ID}&scope=identify&response_type=code&redirect_uri=${redirect}`);
});

router.get('/callback', catchAsync(async (req, res) => {

}));



function authenticateUser() {

}

module.exports = {authenticateUser};