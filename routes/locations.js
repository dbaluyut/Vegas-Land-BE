const express = require("express")
const router = express.Router()

const conn = require("../db")

router.get("/locations", async (req, res) => {
  const locations = await conn.raw(`SELECT * FROM locations;`)
  res.json(locations.rows)
})

router.post("/locations", async (req, res) => {
  const location = await conn("locations").insert({
    street_1: req.body.street_1,
    street_2: req.body.street_2,
    city: req.body.city,
    state: req.body.state,
    zip: req.body.zip,
    lat: req.body.lat,
    lng: req.body.lng,
  })
  res.json({ message: "location added" })
})

module.exports = router
