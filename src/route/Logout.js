require('dotenv').config
const router = require('express').Router()

const { auth } = require('../config/middleware')
const mysql = require('../config/dbconfig')


/* LOGOUT */
router.post('/logout',auth,(req,res)=>{
	const token = req.headers['authorization'].substr(7)
	const logout = new Date()
	mysql.query(`UPDATE revoked_token SET status=?, logout=? WHERE token=?`,[1,logout,token],(err,result,field)=>{
		res.send({success:true,data:result})
	})
})



module.exports = router