require('dotenv').config
const router = require('express').Router()
const moment = require('moment')

const { auth } = require('../config/middleware')
const mysql = require('../config/dbconfig')
const { add, history, edit, dlt } = require('../model/Booking')


/* ADD BOOKING */
router.post('/:id_hotel',auth,(req,res)=>{
    const { id } = req.user
    const { id_hotel } = req.params
    const { email,name,no_hp,room } = req.body
    const checkin = new Date(req.body.checkin)
    const checkout = new Date(req.body.checkout)
    var day = moment(checkout).startOf('day').diff(moment(checkin).startOf('day'),'days')
    console.log(day)
	const created_on = new Date()
    const updated_on = new Date()
    console.log(id_hotel,checkin,checkout,email,name,no_hp,id,day)
    mysql.execute('SELECT saldo FROM profile WHERE id_user = ?',[id],(err,result,field)=>{
        const saldo = result[0].saldo
        mysql.execute('SELECT price FROM hotels WHERE id_hotel = ?',[id_hotel],(err,result1,field)=>{
            const price = result1[0].price
            var total = (price * room) * day
            console.log(price, room, day,total,saldo)
            if(saldo < total){
                res.send({
                    success: false,
                    msg: 'the balance is not sufficient'
                })
            }else{
                mysql.execute(add,[id_hotel,checkin,checkout,email,name,total,room,no_hp,id,created_on,updated_on],
                (err,result2,field)=>{
                    if (err) {
                        console.log(err)
                        res.send('error cuy')
                    }else{
                        mysql.execute('UPDATE profile SET saldo = (saldo - ?) WHERE id_user = ?',[total,id],(err,result4,field)=>{
                            mysql.execute('SELECT * FROM hotels WHERE id_hotel = ?',[id_hotel],(err,result3)=>{
                                const { name } = result3[0]
                                const description = 'Booking'
                                console.log(name,description)   
                                mysql.execute('INSERT INTO history (id_user,name,description,total,created_on,updated_on) VALUES (?,?,?,?,?,?)',[id,name,description,total,created_on,updated_on],(err,result4,field)=>{
                                        res.send({
                                            success:true,
                                            data:result2
                                        })
                                    })
                            })
                        })
                    }
                })
            }
        })
    })
})

/* HISTORY BOOKING */
router.get('/',auth,(req,res)=>{
    const { id } = req.user
    mysql.query(history,[id],(err,result,field)=>{
		res.send({
            success:true,
            data:result
        })
	})
})

/* EDIT BOOKING */
router.put('/:id_booking',auth,(req,res)=>{
    const { id } = req.user
    const { id_booking } = req.params
	const { id_hotel,checkin,checkout,email,name,no_hp } = req.body
    const updated_on = new Date()
	mysql.execute('SELECT saldo FROM profile WHERE id_user = ?',[id],(err,result,field)=>{
        const saldo = result[0].saldo
        mysql.execute('SELECT price FROM hotels WHERE id_hotel = ?',[id_hotel],(err,result1,field)=>{
            const price = result1[0].price
            if(saldo < price){
                res.send({
                    success: false,
                    msg: 'the balance is not sufficient'
                })
            }else{
                mysql.execute(edit,[id_hotel,id_hotel,checkin,checkout,email,name,no_hp,updated_on,id_booking],
                (err,result2,field)=>{
                    if (err) {
                        console.log(err)
                        res.send('error cuy')
                    }else{
                        res.send({
                            success:true,
                            data:result2
                        })
                    }
                })
            }
        })
	})
})

/* DELETE BOOKING */
router.delete('/:id_booking',auth,(req,res)=>{
    const { id_booking } = req.params
    mysql.query(dlt,[id_booking],(err,result,field)=>{
		res.send({
            success:true,
            data:result
        })
	})
})

module.exports = router