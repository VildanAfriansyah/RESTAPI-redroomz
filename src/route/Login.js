require('dotenv').config()
const router = require('express').Router()
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')


const mysql = require('../config/dbconfig')
const { login } = require('../model/User')


/* LOGIN */
router.post('/login',(req,res)=>{
    const { email,password } = req.body
    mysql.execute(login,[email],(err,result,field)=>{
        if(result.length > 0){
            if(bcrypt.compareSync(password,result[0].password)){
                const id = result[0].id_user
                const token = jwt.sign({ email,id },process.env.APP_KEY)
                const login = new Date()
                console.log(token,0,login)
                mysql.execute( 'INSERT INTO revoked_token (token, status, login) VALUES (?,?,?)',[token,0,login],(err,result,field)=>{return} )
                
                res.send({
                    success: true,
                    token
                })
            }else{
                res.send({
                    success: false,
                    msg: 'Incorrect Password'
                })
            }
        }else{
            res.send({
                success: false,
                msg: 'Incorrect Email'
            })
        }
    })
})


module.exports = router