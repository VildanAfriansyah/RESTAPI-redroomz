require('dotenv').config
const router = require('express').Router()
const multer = require('multer')
const path = require('path')

const mysql = require('../config/dbconfig')
const { add,show,edit,dlt } = require('../model/Room')

const storage = multer.diskStorage({
    destination: function(req, files, cb) {
        cb(null, './upload/room');
     },
    filename: function (req, files, cb) {
        cb(null , files.originalname);
    }
})

const fileFilter = function (req, files, cb) {
        var ext = path.extname(files.originalname)
        if(ext !== '.png' && ext !== '.jpg' && ext !== '.gif' && ext !== '.jpeg') {
            return cb('Extension not allowed')
        }
        cb(null, true)
    }
    
const upload = multer({storage: storage,fileFilter: fileFilter})


/* ADD ROOM */
router.post('/',upload.array('image',3),(req,res)=>{
    var image = ''

    for(i = 0; i < 3; i++)
    if (i === 2) {
        image += (req.files[i].originalname)
    }else{
        image += (req.files[i].originalname + ', ')
    }
    
	const { id_hotel,name,description } = req.body
	const created_on = new Date()
    const updated_on = new Date()
	mysql.execute(add,[name,'0',id_hotel,image,description,created_on,updated_on],(err,result,field)=>{
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
router.put('/:id',upload.array('image',3),(req,res)=>{
    var image = ''

    for(i = 0; i < 3; i++)
    if (i === 2) {
        image += (req.files[i].originalname)
    }else{
        image += (req.files[i].originalname + ', ')
    }

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