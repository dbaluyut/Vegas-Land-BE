const express = require("express")
const router = express.Router()

const conn = require("../db")

router.get("/venues", async (req, res) => {
  const venues = await conn.raw(`SELECT * FROM venues
  order by id
  ;`)
  res.json(venues.rows)
})

router.get("/venues/newbars", async (req, res) => {
  const venues = await conn.raw(`SELECT * FROM venues where type='bar'
  ;`)
  res.json(venues.rows)
})

// router.get("/venues/:id", async (req, res) => {
//   const venues = await conn.raw(
//     `SELECT * FROM venues where id=${req.params.id};`
//   )
//   res.json(venues.rows)
// })

router.get("/venues/highlights", async (req, res) => {
  const venues = await conn.raw(`select venues.id, galleries.image, venues.title, venues.type from venues
  inner join galleries on galleries.venue_id=venues.id
  where venues.id in(1,21,14,2,7,3,42)
 `)
  res.json(venues.rows)
})

router.get("/venues/experiences", async (req, res) => {
  const venues = await conn.raw(`select galleries.image, venues.title, venues.id, venues.desc, venues.link, locations.street_1, locations.city, locations.state, locations.zip from venues
  inner join galleries on galleries.venue_id=venues.id
  inner join locations on locations.id=venues.location_id
    where type='experience'
`)
  res.json(venues.rows)
})

router.get("/venues/restaurants", async (req, res) => {
  const venues = await conn.raw(`select galleries.image, venues.title, venues.desc, venues.id, venues.link, locations.street_1, locations.city,
   locations.state, locations.zip from venues
  inner join galleries on galleries.venue_id=venues.id
  inner join locations on locations.id=venues.location_id
    where type='restaurant'`)
  const venuesList = venues.rows

  for (let venue of venuesList) {
    const labels = await conn.raw(
      `select labels.desc, labels.icon from venues
      inner join venue_labels on venue_labels.venue_id=venues.id
      inner join labels on venue_labels.label_id=labels.id
      where venues.id = ?`,
      [venue.id]
    )
    console.log(labels.rows)
    // const venueWithLabels = {labels: labels.rows, ...venue}
    venue.labels = labels.rows
    console.log(venue)
  }

  res.json(venuesList)
})

router.get("/venues/bars", async (req, res) => {
  const venues = await conn.raw(`select galleries.image, venues.title, venues.desc, venues.id,
  venues.link, locations.street_1, locations.city, locations.state, locations.zip from venues
  inner join galleries on galleries.venue_id=venues.id
  inner join locations on locations.id=venues.location_id
    where type='bar'`)

  const venuesList = venues.rows
  console.log(venuesList)

  for (let venue of venuesList) {
    const labels = await conn.raw(
      `select labels.desc, labels.icon from venues
      inner join venue_labels on venue_labels.venue_id=venues.id
      inner join labels on venue_labels.label_id=labels.id
      where venues.id = ?`,
      [venue.id]
    )
    console.log(labels.rows)
    // const venueWithLabels = {labels: labels.rows, ...venue}
    venue.labels = labels.rows
    console.log(venue)
  }

  res.json(venuesList)
})

// VENUES POST REQUEST

router.post("/venues", async (req, res) => {
  const newVenue = {
    title: req.body.title,
    desc: req.body.desc,
    location_id: req.body.location_id,
    type: req.body.type,
    link: req.body.link,
  }

  const venue = await conn("venues")
    .insert(newVenue)
    .returning("id")
    .then(async (id) => {
      const gallery = await conn("galleries").insert({
        venue_id: id[0],
        image:
          "https://i.pinimg.com/originals/66/46/32/664632aada8327014297b719b228f4f2.jpg",
      })
      res.json({
        message: "venue added",
        venue: {
          ...newVenue,
          id: id[0],
        },
      })
    })
})

// VENUES PATCH REQUEST

router.patch("/venues/:id", async (req, res) => {
  const venue = await conn("venues")
    .update({
      title: req.body.title,
      desc: req.body.desc,
      type: req.body.type,
      link: req.body.link,
    })
    .where({ id: req.params.id })
  res.json({ message: "venue updated" })
})

// VENUES DELETE REQUEST
router.delete("/venues/:id", async (req, res) => {
  console.log("works")
  await conn("venues").where({ id: req.params.id }).del()
  res.json({ message: "venue deleted" })
})

module.exports = router
