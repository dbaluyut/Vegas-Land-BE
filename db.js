const knex = require("knex")({
  client: "pg",
  version: "7.2",
  connection: {
    host: "127.0.0.1",
    user: process.env.DB_USER,
    password: "",
    database: process.env.DB_NAME,
  },
})

module.exports = knex
