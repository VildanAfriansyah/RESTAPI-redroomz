const jwt   = require('jsonwebtoken')

const mysql = require('./dbconfig')

const auth = (req,res,next)=>{
    if(
        req.headers['authorization'] && 
        req.headers['authorization'].startsWith('Bearer')
    ){
        const token = req.headers['authorization'].substr(7)
        try{
            const user = jwt.verify(token,process.env.APP_KEY)
            mysql.execute('SELECT * FROM revoked_token WHERE token = ?',[token],(err,result,field)=>{
                if(result.length > 0 ){
                    var status = result[0].status
                    var token = result[0].token
                    try{
                        if(status === 0){
                            next()
                        }else{
                            res.send({
                                success: false,
                                msg: 'You Has Been Logout'
                            })
                        }
                    }catch(e){
                        res.send({
                            success: false,
                            msg: e
                        })
                    }
                }else{
                    res.send({
                        success: false,
                        msg: 'Token not Found'
                    })
                }
            })
        }catch(e){
            res.send({
                success: false,
                msg: e
            })
        }
    }else{
        res.send({
            success: false,
            msg: 'You must be login first'
        })
    }
}

module.exports = { auth }