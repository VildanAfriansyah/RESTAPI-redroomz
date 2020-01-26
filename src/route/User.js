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
// router.put('/',auth,upload.single('image'),(req,res)=>{
    router.put('/',auth,(req,res)=>{
    var image = 'https://d3buf9vqrgrft6.cloudfront.net/assets/default_user-e9127509183b26c6472a9ef6b49a5719.png'
    // if(req.file){
    //    image = (req.file.originalname)
    // } 
    if(req.body.image){
        image = req.body.image
    }
    const { id } = req.user
    const { name,no_hp,email } = req.body
    const birthday = new Date(req.body.birthday)
    const updated_on = new Date()
    console.log(name,birthday,no_hp,email,image,updated_on,id)
	mysql.execute(add,[name,birthday,no_hp,email,image,updated_on,id],(err,result,field)=>{
		if(err){
            console.log(err)
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