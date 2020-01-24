require('dotenv').config()
const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')


const login = require('./src/route/Login')
const register = require('./src/route/Register')
const forgot = require('./src/route/Forgot_Password')
const profile = require('./src/route/User')
const hotel = require('./src/route/Hotel')
const room = require('./src/route/Room')
const topup = require('./src/route/Topup')
const booking = require('./src/route/Booking')
const bill = require('./src/route/Bill')


const app = express()

app.use(bodyParser.urlencoded({extended:false}))
app.use(bodyParser.json())

app.use(cors())
app.use('/image/profile', express.static('upload/profile'))
app.use('/image/hotel', express.static('upload/hotel'))
app.use('/image/room', express.static('upload/room'))
app.use('/', login)
app.use('/', register)
app.use('/', forgot)
app.use('/profile', profile)
app.use('/hotel', hotel)
app.use('/room', room)
app.use('/topup', topup)
app.use('/booking', booking)
app.use('/bill', bill)


const port = process.env.APP_PORT
app.listen(port,()=>{
    console.log('App Listen on Port ' + port)
})