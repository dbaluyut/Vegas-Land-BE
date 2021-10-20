const express = require('express')
const router =express.Router()

const conn = require('../db')

router.get('/labels', async (req, res) => {
    const labels = await conn.raw(`SELECT * FROM labels;`)
    res.json(labels.rows)
})

module.exports = router