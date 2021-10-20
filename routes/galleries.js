const express = require('express')
const router =express.Router()

const conn = require('../db')

router.get('/galleries', async (req, res) => {
    const galleries = await conn.raw(`SELECT * FROM galleries;`)
    res.json(galleries.rows)
})

module.exports = router