require('dotenv').config
const router = require('express').Router()

const mysql = require('../config/dbconfig')
const { auth } = require('../config/middleware')
const { history } = require('../model/History')


/* HISTORY TOPUP */
router.get('/history',auth,(req,res)=>{
    const { id } = req.user
    mysql.query('SELECT * FROM history WHERE id_user = ?',[id],(err,result,field)=>{
		if (err) {
            console.log(err)
            res.send('error cuy')
        }else{
            res.send({
                success:true,data:result
            })
        }
	})
})


module.exports = router