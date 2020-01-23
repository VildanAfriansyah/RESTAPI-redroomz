require('dotenv').config
const router = require('express').Router()

const mysql = require('../config/dbconfig')
const { add,show,edit,dlt } = require('../model/Topup')


/* ADD ROOM */
router.post('/',(req,res)=>{
    const { id } = req.params
	const { saldo } = req.body
	const created_on = new Date()
    const updated_on = new Date()
	mysql.execute(add,[saldo,id,created_on,updated_on],(err,result,field)=>{
        if (err) {
            console.log(err)
            res.send('error cuy')
        }else{
            res.send({
                success:true,
                data:result
            })
        }
	})
})

/* SHOW ROOM */
router.get('/',(req,res)=>{
    mysql.query(show,[],(err,result,field)=>{
		res.send({
            success:true,
            data:result
        })
	})
})

/* EDIT ROOM */
router.put('/:id',(req,res)=>{

    const { id } = req.params
    const { id_hotel,name,description } = req.body
    const updated_on = new Date()
    console.log(name,id_hotel,image,description,updated_on,id)
	mysql.execute(edit,[name,id_hotel,image,description,updated_on,id],(err,result,field)=>{
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

/* DELETE ROOM */
router.delete('/:id',(req,res)=>{
    const { id } = req.params
    mysql.query(dlt,[id],(err,result,field)=>{
		res.send({
            success:true,
            data:result
        })
	})
})


module.exports = router