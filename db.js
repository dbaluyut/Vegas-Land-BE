const knex = require('knex')({
  client: 'pg',
  version: '7.2',
  connection: {
    host: process.env.Host,
    user: process.env.User,
    password: process.env.Password,
    database: process.env.Database,
  },
})

module.exports = knex
