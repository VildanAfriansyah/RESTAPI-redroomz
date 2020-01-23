require('dotenv').config()
const router = require('express').Router()
var nodemailer = require('nodemailer')
const bcrypt = require('bcryptjs')

const mysql = require('../config/dbconfig')
const { login } = require('../model/User')

var length = 8
var newPassword      = ''
var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
var charactersLength = characters.length;
for ( var i = 0; i < length; i++ ) {
    newPassword += characters.charAt(Math.floor(Math.random() * charactersLength))
}

/* FORGOT PASSWORD */
router.post('/forgot_password',(req,res)=>{
    const { username,email } = req.body
    mysql.execute('SELECT username FROM users WHERE username = ?',[username],(err,result,field)=>{
        if(result.length === 0){
            res.send({
                succes: false,
                msg: 'Username not Found'
            })
        }else{
            mysql.execute('SELECT email FROM profile WHERE email = ?',[email],(err,result1,field)=>{
                const gmail = result1.email 
                if(result1.length === 0){
                    res.send({
                        succes: false,
                        msg: 'Email not Found'
                    })
                }else{
                   
                    password_decode = bcrypt.hashSync(newPassword)
                    mysql.execute('UPDATE users SET password = ? WHERE username = ?',[password_decode,username],(err,result2,field)=>{
                        return
                    })
                    const gmail = result1[0].email
                    var transporter = nodemailer.createTransport({
                        service: 'gmail',
                        auth: {
                            user: 'forgot.redroomz@gmail.com',
                            pass: process.env.EMAIL_PASSWORD
                        }
                    })
                    
                    var mailOptions = {
                        from: 'forgot.redroomz@gmail.com',
                        to: gmail,
                        subject: '<Dont Repply Email>',
                        text: 'your password is ' + newPassword
                    };
                    
                    transporter.sendMail(mailOptions, (err, info) => {
                        if (err) throw err;
                        console.log('Email sent: ' + info.response);
                    })
                    res.send({
                        succes: true,
                        msg: 'check your email'
                    })
                }
            })
        }
    })
})






module.exports = router