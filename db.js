const knex = require('knex')({
  client: 'pg',
  version: '7.2',
  connection: {
    host: 'ec2-18-215-96-54.compute-1.amazonaws.com',
    user: 'lcorrufwwnrecq',
    password:
      '3ac5199330b8962cd3d08c1e1173c0a93e4150431c48812e37c5e8d9f84e47da',
    database: 'daicfrugl8kvoo',
  },
})

module.exports = knex
