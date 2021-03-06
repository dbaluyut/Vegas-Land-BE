require('dotenv').config()
const express = require('express')
const jwtMiddleware = require('express-jwt')
const jwtToken = require('jsonwebtoken')
const app = express()
const PORT = process.env.PORT || 5000
// const exampleRoutes = require("./routes/example");
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
const authRoutes = require('./routes/auth')
const adminsRoutes = require('./routes/admins')
// app.use("/api", exampleRoutes)

const venuesRoutes = require('./routes/venues')
const venue_labelsRoutes = require('./routes/venue_labels')
const locationRoutes = require('./routes/locations')
const labelsRoutes = require('./routes/labels')
const happy_hrRoutes = require('./routes/happy_hr')
const galleriesRoutes = require('./routes/galleries')
const recommendationsRoutes = require('./routes/recommendations')

app.get('/', (req, res) => {
  res.send('hello world')
})

app.use('/api', adminsRoutes)
app.use('/api', authRoutes)
app.use('/api/', venuesRoutes)
app.use('/api/', venue_labelsRoutes)
app.use('/api/', locationRoutes)
app.use('/api/', labelsRoutes)
app.use('/api/', happy_hrRoutes)
app.use('/api/', galleriesRoutes)
app.use('/api', recommendationsRoutes)
app.listen(PORT, () => {
  console.log('running on port ' + PORT)
})
