const express = require("express")
const router = express.Router()
const conn = require("../db")
const sha512 = require("js-sha512")
const jwt = require("jsonwebtoken")

// could also use a library this is just an example
function createSalt(len = 20) {
  const vals = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  let str = ""
  for (let i = 0; i < len; i++) {
    const randomIndex = Math.floor(Math.random() * vals.length)
    str += vals.charAt(randomIndex)
  }
  return str
}

router.post("/registration", async (req, res) => {
  const { username, password } = req.body
  const salt = createSalt(20)
  const hashedPassword = sha512(password + salt)
  const checkIfUserExistsSql = `SELECT * FROM users WHERE username = ?;`
  const hasAUser = await conn.raw(checkIfUserExistsSql, [username])
  const userExists = hasAUser.rows.length
  if (userExists) {
    res.status(400).json({ message: "username already exists" })
  } else {
    const addUserSql = `
                INSERT INTO users (username, password, salt)
                VALUES (?, ?, ?);
            `
    const insertedUser = await conn.raw(addUserSql, [
      username,
      hashedPassword,
      salt,
    ])
    res.status(201).json({ message: "user successfully created" })
  }
})

router.post("/login", async (req, res, next) => {
  const { username, password } = req.body
  const checkIfUserExistsSql = `SELECT * FROM admins WHERE username = ?;`
  const hasAUser = await conn.raw(checkIfUserExistsSql, [username])
  const userExists = hasAUser.rows.length
  if (!userExists) {
    res.status(400).json({ message: "invalid username or password" })
  } else {
    const user = hasAUser.rows[0]
    const hashedPassword = sha512(password + user.salt)
    if (hashedPassword === user.password) {
      // generate a token based on server secret for client to use to authenticate
      const token = jwt.sign(
        { id: user.id, username: user.username },
        process.env.SECRET
      )
      res.status(200).json({ token: token })
    } else {
      res.status(400).json({ message: "invalid username or password" })
    }
  }
})

module.exports = router
