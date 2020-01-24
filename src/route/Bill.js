require('dotenv').config
const router = require('express').Router()

const mysql = require('../config/dbconfig')
const { add, history, edit, dlt } = require('../model/Bill')


/* ADD BILL */
router.post('/:id/:id_booking',(req,res)=>{
    const { id,id_booking } = req.params
	const created_on = new Date()
    const updated_on = new Date()
    mysql.execute('SELECT rooms.price FROM booking INNER JOIN rooms ON booking.id_room=rooms.id_room WHERE id_booking = ?',[
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
router.get('/:id',(req,res)=>{
    const { id } = req.params
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
//     mysql.execute(`SELECT rooms.price FROM booking INNER JOIN rooms ON booking.id_room=rooms.id_room 
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
router.delete('/:id/:id_bill',(req,res)=>{
    const { id,id_bill } = req.params
    mysql.query(dlt,[id_bill],(err,result,field)=>{
		res.send({
            success:true,
            data:result
        })
	})
})

module.exports = router