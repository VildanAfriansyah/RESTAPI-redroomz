require('dotenv').config
const router = require('express').Router()

const mysql = require('../config/dbconfig')
const { add, history, edit, dlt } = require('../model/Booking')


/* ADD BOOKING */
router.post('/:id',(req,res)=>{
    const { id } = req.params
	const { id_hotel,id_room,checkin,checkout,email,name,no_hp } = req.body
	const created_on = new Date()
    const updated_on = new Date()
    console.log(id_hotel,id_room,checkin,checkout,email,name,no_hp,id)
    mysql.execute('SELECT saldo FROM profile WHERE id_user = ?',[id],(err,result,field)=>{
        const saldo = result[0].saldo
        mysql.execute('SELECT price FROM rooms WHERE id_room = ?',[id_room],(err,result1,field)=>{
            const price = result1[0].price
            if(saldo < price){
                res.send({
                    success: false,
                    msg: 'the balance is not sufficient'
                })
            }else{
                mysql.execute(add,[id_hotel,id_room,checkin,checkout,email,name,no_hp,id,created_on,updated_on],
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

/* HISTORY BOOKING */
router.get('/:id',(req,res)=>{
    const { id } = req.params
    mysql.query(history,[id],(err,result,field)=>{
		res.send({
            success:true,
            data:result
        })
	})
})

/* EDIT BOOKING */
router.put('/:id/:id_booking',(req,res)=>{
    const { id,id_booking } = req.params
	const { id_hotel,id_room,checkin,checkout,email,name,no_hp } = req.body
    const updated_on = new Date()
	mysql.execute('SELECT saldo FROM profile WHERE id_user = ?',[id],(err,result,field)=>{
        const saldo = result[0].saldo
        mysql.execute('SELECT price FROM rooms WHERE id_room = ?',[id_room],(err,result1,field)=>{
            const price = result1[0].price
            if(saldo < price){
                res.send({
                    success: false,
                    msg: 'the balance is not sufficient'
                })
            }else{
                mysql.execute(edit,[id_hotel,id_room,checkin,checkout,email,name,no_hp,updated_on,id_booking],
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
router.delete('/:id/:id_booking',(req,res)=>{
    const { id,id_booking } = req.params
    mysql.query(dlt,[id_booking],(err,result,field)=>{
		res.send({
            success:true,
            data:result
        })
	})
})

module.exports = router