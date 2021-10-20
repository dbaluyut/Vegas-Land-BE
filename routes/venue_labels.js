const express = require('express')
const router =express.Router()

const conn = require('../db')

router.get('/venue_labels', async (req, res) => {
    const venue_labels = await conn.raw(`SELECT * FROM venue_labels;`)
    res.json(venue_labels.rows)
})

module.exports = router