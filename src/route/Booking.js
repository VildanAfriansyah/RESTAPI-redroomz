require('dotenv').config
const router = require('express').Router()

const mysql = require('../config/dbconfig')
const { add, history, edit, dlt } = require('../model/Topup')


/* ADD TOPUP */
router.post('/:id',(req,res)=>{
    const { id } = req.params
	const { saldo } = req.body
	const created_on = new Date()
    const updated_on = new Date()
	mysql.execute(add,[saldo,id,created_on,updated_on],(err,result,field)=>{
        mysql.execute('UPDATE profile SET saldo = (saldo + ?) WHERE id_user = ?',[saldo,id],(err,result,field)=>{
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
})

/* HISTORY TOPUP */
router.get('/:id',(req,res)=>{
    const { id } = req.params
    mysql.query(history,[id],(err,result,field)=>{
		res.send({
            success:true,
            data:result
        })
	})
})

/* EDIT TOPUP */
router.put('/:id/:id_topup',(req,res)=>{
    const { id_topup,id } = req.params
    const { saldo } = req.body
    const updated_on = new Date()
	mysql.execute(edit,[saldo,updated_on,id_topup],(err,result,field)=>{
        mysql.execute('SELECT SUM(saldo) AS total_saldo FROM topup WHERE id_user = ?',[id],(err,result1,field)=>{
            const total = result1[0].total_saldo
            mysql.execute('UPDATE profile SET saldo = ?',[total],(err,result,field)=>{
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
	})
})

/* DELETE TOPUP */
router.delete('/:id/:id_topup',(req,res)=>{
    const { id,id_topup } = req.params
    mysql.query(dlt,[id_topup],(err,result,field)=>{
		mysql.execute('SELECT SUM(saldo) AS total_saldo FROM topup WHERE id_user = ?',[id],(err,result1,field)=>{
            const total = result1[0].total_saldo
            mysql.execute('UPDATE profile SET saldo = ?',[total],(err,result,field)=>{
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
	})
})

module.exports = router