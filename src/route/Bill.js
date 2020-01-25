require('dotenv').config
const router = require('express').Router()

const { auth } = require('../config/middleware')
const mysql = require('../config/dbconfig')
const { add, history, edit, dlt } = require('../model/Bill')


/* ADD BILL */
router.post('/:id_booking',auth,(req,res)=>{
    const { id } = req.user
    const { id_booking } = req.params
	const created_on = new Date()
    const updated_on = new Date()
    mysql.execute('SELECT hotels.price FROM booking INNER JOIN hotels ON booking.id_hotel=hotels.id_hotel WHERE id_booking = ?',[
    id_booking],(err,result,field)=>{
        const price = result[0].price
        console.log(id_booking,price,created_on,updated_on)
        mysql.execute(add,[id_booking,id,price,created_on,updated_on],(err,result1,field)=>{
            mysql.execute('UPDATE profile SET saldo = (saldo - ?) WHERE id_user = ?',[price,id],(err,result2,field)=>{
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
            console.log(err)
        })
    })
})

/* HISTORY BILL */
router.get('/',auth,(req,res)=>{
    const { id } = req.user
    mysql.query(history,[id],(err,result,field)=>{
		res.send({
            success:true,
            data:result
        })
	})
})

/* EDIT BILL */
// router.put('/:id/:id_bill',(req,res)=>{
//     const { id,id_bill } = req.params
// 	const created_on = new Date()
//     const updated_on = new Date()
//     mysql.execute(`SELECT hotels.price FROM booking INNER JOIN hotels ON booking.id_hotel=hotels.id_hotel 
//     INNER JOIN bill ON bill.id_booking=booking.id_booking WHERE id_bill = 5`,[id_booking],
//     (err,result,field)=>{
//         const price = result[0].price
//         console.log(id_booking,price,created_on,updated_on)
//         mysql.execute(edit,[id_booking,id,price,updated_on,id_bill],(err,result1,field)=>{
//             mysql.execute('UPDATE profile SET saldo = (saldo - ?) WHERE id_user = ?',[price,id],(err,result2,field)=>{
//                 if (err) {
//                     console.log(err)
//                     res.send('error cuy')
//                 }else{
//                     res.send({
//                         success:true,
//                         data:result2
//                     })
//                 }
//             })
//             console.log(err)
//         })
//     })
// })

/* DELETE BILL */
router.delete('/:id_bill',auth,(req,res)=>{
    const { id } = req.user
    const { id_bill } = req.params
    mysql.query(dlt,[id_bill],(err,result,field)=>{
		res.send({
            success:true,
            data:result
        })
	})
})

module.exports = router