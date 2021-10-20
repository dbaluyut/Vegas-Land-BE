const knex = require('knex')({
  client: 'pg',
  version: '7.2',
  connection: {
    connectionString: process.env.DATABASE_URL,
    // ssl: { rejectUnauthorized: false },
  },
})

module.exports = knex
