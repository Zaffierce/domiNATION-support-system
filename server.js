'use strict';

const express = require('express');
const superagent = require('superagent');
const pg = require('pg');
const app = express();
const methodOverride = require('method-override');
const apiRouter = require('./api/discord');
require('dotenv').config();
const PORT = process.env.PORT || 3002;

app.set('view engine', 'ejs');

const client = new pg.Client(process.env.DATABASE_URL);
client.connect();
client.on('error', (error) => console.log(error));

app.use(express.urlencoded({extended: true}));
app.use(express.static('./public'));
app.use(methodOverride((request, response) => {
  if (request.body && typeof request.body === 'object' && '_method' in request.body) {
    let method = request.body._method;
    delete request.body._method;
    return method;
  }
}));

app.get('/', index);
app.use('/api/discord', apiRouter);
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

function index(req, res){
  res.render('./pages/index');
}



app.listen(PORT, () => console.log(`Server is live on ${PORT}`));