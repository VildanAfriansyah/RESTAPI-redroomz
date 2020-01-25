require('dotenv').config
const router = require('express').Router()

const mysql = require('../config/dbconfig')
const { search } = require('../model/Search')


/* SEARCH HOTEL */
router.get('/',(req,res)=>{
	const { search } = req.body
	console.log(search)
	mysql.execute(`SELECT hotels.id_hotel, hotels.image, hotels.name, hotels.rate, hotels.price, city.city 
    FROM hotels INNER JOIN city ON hotels.id_city=city.id_city 
    WHERE name LIKE ?`,[`%` + search + `%`],(err,result,FileReader)=>{
        if(result.length > 0 ){
            if (err) {
                console.log(err)
                res.send('error cuy')
            }else{
                res.send({
                    success:true,
                    data:result
                })
            }
        }else{
            mysql.execute(`SELECT hotels.id_hotel, hotels.image, hotels.name, hotels.rate, hotels.price, city.city 
            FROM hotels INNER JOIN city ON hotels.id_city=city.id_city 
            WHERE city LIKE ?`,[`%` + search + `%`],(err,result1,FileReader)=>{
                res.send({
                    success:true,
                    data:result1
                })
            })
        }
    })
});

module.exports = router