require('dotenv').config()
const router = require('express').Router()
const bcrypt = require('bcryptjs')

const mysql = require('../config/dbconfig')
const { register } = require('../model/User')

/* REGISTER */
router.post('/register',(req,res)=>{
    const { name,email,username,password } = req.body
    const encrypt = bcrypt.hashSync(password)
    const created_on = new Date()
    const updated_on = new Date()
    mysql.execute(register,[username,encrypt,created_on,updated_on],(err,result,field)=>{
        if(err){
            res.send({
                success: false,
                msg: 'Username alredy exist'
            })
        }else{
            mysql.execute('SELECT id_user FROM users WHERE username = ? ',[username,],(err,result,field)=>{
                const id_user = result[0].id_user
                console.log(id_user,email)
                mysql.execute('INSERT INTO profile (id_user,name,email,created_on,updated_on) VALUES (?,?,?,?,?)',
                [id_user,name,email,created_on,updated_on],(err,rresult,field)=>{
                    if(err){
                        console.log(err)
                        res.send({
                            succes: false,
                            msg: 'Email already exist'
                        })
                    }else{
                        res.send({
                            success: true,
                            msg: 'Account has been created'
                        })
                    }
                })
            })
        }
    })
})

module.exports = router