require('dotenv').config
const router = require('express').Router()
const multer = require('multer')
const path = require('path')

const mysql = require('../config/dbconfig')
const { add } = require('../model/hotel')

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, './upload/hotel');
     },
    filename: function (req, file, cb) {
        cb(null , file.originalname);
    }
});
const fileFilter = function (req, file, cb) {
        var ext = path.extname(file.originalname)
        if(ext !== '.png' && ext !== '.jpg' && ext !== '.gif' && ext !== '.jpeg') {
            return cb('Extension not allowed')
        }
        cb(null, true)
    }
const upload = multer({storage: storage,fileFilter: fileFilter})


/* ADD HOTEL */
router.post('/',upload.single('image'),(req,res)=>{
    const image = (req.file.originalname)
	const { name,price,id_city,longitude,latitude,property,description } = req.body
	const created_on = new Date()
    const updated_on = new Date()
    console.log(name,image,price,id_city,longitude,latitude,property,description,created_on,updated_on)
	mysql.execute(add,[name,image,price,id_city,longitude,latitude,property,description,created_on,updated_on],(err,result,field)=>{
		res.send({
            success:true,data:result
        })
	})
})

module.exports = router