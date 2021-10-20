const express = require("express");
const router = express.Router();
const conn = require("../db");

// GET REQUEST
router.get("/admins", async (req, res) => {
  const admins = await conn.raw(`SELECT * FROM admins;`);
  res.json(admins.rows);
});

// POST REQUEST



module.exports = router;

// router.post('/users/:userId/projects/:projectId', async (req, res) => {
//   await conn('projects_users').insert({project_id: req.params.projectId, user_id: req.params.userId})
//   res.json({message: 'user added to project'})
// })
