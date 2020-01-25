require('dotenv').config()
const router = require('express').Router()
const bcrypt = require('bcryptjs')
const multer = require('multer')
const path = require('path')


const { auth } = require('../config/middleware')
const mysql = require('../config/dbconfig')
const { edit, add, show } = require('../model/User')


const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, './upload/profile');
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



/* CHANGE PASSWORD */
router.put('/change_password',auth,(req,res)=>{
    const { id } = req.user
    const { password } = req.body
    const password_encrypted = bcrypt.hashSync(password)
    const updated_on = new Date()
    mysql.execute(edit,[password_encrypted,updated_on,id],(err,result,field)=>{
        if(err){
            res.send({succes: false})
        }else{
            res.send({success: true, msg : 'Password has been changed'})
        }
    })
})

/* ADD/EDIT PROFILE */
router.put('/',auth,upload.single('image'),(req,res)=>{
    var image = 'image.jpg'
    if(req.file){
       image = (req.file.originalname)
    } 
    const { id } = req.user
    const { name,no_hp,email } = req.body
    const updated_on = new Date()
	mysql.execute(add,[name,no_hp,email,image,updated_on,id],(err,result,field)=>{
		if(err){
            console.log
            res.send({
                succes: false,
            })
        }else{
            res.send({
                success:true,
                data:result
            })
        }
	})
})

/* SHOW PROFILE */
router.get('/',auth,(req,res)=>{
    const { id } = req.user
    console.log(id)
    mysql.query(show,[id],(err,result,field)=>{
		res.send({
            success:true,
            data:result
        })
	})
})
module.exports = router