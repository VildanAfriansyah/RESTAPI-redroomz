require('dotenv').config
const router = require('express').Router()
const multer = require('multer')
const path = require('path')

const mysql = require('../config/dbconfig')
const { add,show,edit,dlt } = require('../model/Hotel')

const storage = multer.diskStorage({
    destination: function(req, files, cb) {
        cb(null, './upload/hotel');
     },
    filename: function (req, file, cb) {
        cb(null , file.originalname);
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


/* ADD HOTEL */
router.post('/',upload.array('image',3),(req,res)=>{
    var image = ''

    for(i = 0; i < 3; i++)
    if (i === 2) {
        image += (req.files[i].originalname)
    }else{
        image += (req.files[i].originalname + ', ')
    }
    
	const { name,id_city,longitude,latitude,property,description } = req.body
	const created_on = new Date()
    const updated_on = new Date()
	mysql.execute(add,[name,'0',image,id_city,longitude,latitude,property,description,created_on,updated_on],(err,result,field)=>{
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

/* SHOW HOTEL */
router.get('/',(req,res)=>{
    mysql.query(show,[],(err,result,field)=>{
		res.send({
            success:true,
            data:result
        })
	})
})

/* EDIT HOTEL */
router.put('/:id',upload.array('image',3),(req,res)=>{
    var image = ''

    for(i = 0; i < 3; i++)
    if (i === 2) {
        image += (req.files[i].originalname)
    }else{
        image += (req.files[i].originalname + ', ')
    }

    const { id } = req.params
    const { name,id_city,longitude,latitude,property,description } = req.body
    const updated_on = new Date()
	mysql.execute(edit,[name,image,id_city,longitude,latitude,property,description,updated_on,id],(err,result,field)=>{
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

/* DELETE HOTEL */
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