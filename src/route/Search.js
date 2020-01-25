require('dotenv').config
const router = require('express').Router()

const mysql = require('../config/dbconfig')
const { search } = require('../model/Search')


/* SEARCH HOTEL */
router.get(['/'],(req,res)=>{
    const { name, city } = req.query
	mysql.execute(search,["'%" + name + "%'","'%" + city + "%'"],(err,result,field)=>{
        if (err) {
            res.send('error cuy')
        }else{
            res.send({
                success:true,data:result
            })
        }
	})
})

module.exports = router