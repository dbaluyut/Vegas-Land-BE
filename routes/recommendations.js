const express = require("express");
const router = express.Router();

const conn = require("../db");

router.get("/recommendations", async (req, res) => {
  const recommendations = await conn.raw(`SELECT * FROM recommendations;`);
  res.json(recommendations.rows);
});

router.post("/recommendations", async (req, res) => {
  const newRecommendation = await conn("recommendations").insert({
    name: req.body.name,
    email: req.body.email,
    desc: req.body.desc,
  });
  res.json({ message: "recommendation created" });
});

// router.post("/recommendations", async (req, res) => {
//   console.log(req.body);

//   const { name } = req.body.name;
//   const { email } = req.body.email;
//   const { desc } = req.body.desc;

// await conn
//     .raw(`INSERT INTO recommendations (name, email, desc) VALUES (?, ?, ?);`, [
//       name,
//       email,
//       desc,
//     ])
//     .then((result) => {
//       res.json(result.rows);
//     });
// });

module.exports = router;
