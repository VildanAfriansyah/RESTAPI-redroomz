require('dotenv').config()
const router = require('express').Router()
const bcrypt = require('bcryptjs')

const mysql = require('../config/dbconfig')
const { register } = require('../model/User')

/* REGISTER */
router.post('/register',(req,res)=>{
    var image = 'https://d3buf9vqrgrft6.cloudfront.net/assets/default_user-e9127509183b26c6472a9ef6b49a5719.png'
    const { name,email,password,no_hp } = req.body
    const encrypt = bcrypt.hashSync(password)
    const created_on = new Date()
    const updated_on = new Date()
    mysql.execute(register,[email,encrypt,created_on,updated_on],(err,result,field)=>{
        if(err){
            res.send({
                success: false,
                msg: 'Email already exist'
            })
        }else{
            mysql.execute('SELECT id_user FROM users WHERE email = ? ',[email,],(err,result,field)=>{
                const id_user = result[0].id_user
                console.log(id_user,email)
                mysql.execute('INSERT INTO profile (id_user,name,email,no_hp,image,created_on,updated_on) VALUES (?,?,?,?,?,?,?)',
                [id_user,name,email,no_hp,image,created_on,updated_on],(err,result,field)=>{
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