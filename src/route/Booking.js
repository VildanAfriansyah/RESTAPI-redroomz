require('dotenv').config
const router = require('express').Router()

const { auth } = require('../config/middleware')
const mysql = require('../config/dbconfig')
const { add, history, edit, dlt } = require('../model/Booking')


/* ADD BOOKING */
router.post('/:id_hotel',auth,(req,res)=>{
    const { id } = req.user
    const { id_hotel } = req.params
	const { checkin,checkout,email,name,no_hp } = req.body
	const created_on = new Date()
    const updated_on = new Date()
    console.log(id_hotel,checkin,checkout,email,name,no_hp,id)
    mysql.execute('SELECT saldo FROM profile WHERE id_user = ?',[id],(err,result,field)=>{
        const saldo = result[0].saldo
        console.log(saldo)
        mysql.execute('SELECT price FROM hotels WHERE id_hotel = ?',[id_hotel],(err,result1,field)=>{
            const price = result1[0].price
            console.log(price)
            if(saldo < price){
                res.send({
                    success: false,
                    msg: 'the balance is not sufficient'
                })
            }else{
                mysql.execute(add,[id_hotel,checkin,checkout,email,name,no_hp,id,created_on,updated_on],
                (err,result2,field)=>{
                    if (err) {
                        console.log(err)
                        res.send('error cuy')
                    }else{
                        mysql.execute('SELECT * FROM hotels WHERE id_hotel = ?',[id_hotel],(err,result3)=>{
                            const { name } = result3[0]
                            const description = 'Booking'
                            console.log(name,description)   
                            mysql.execute('INSERT INTO history (id_user,name,description) VALUES (?,?,?)',[id,name,description],(err,result4,field)=>{
                                    res.send({
                                        success:true,
                                        data:result2
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