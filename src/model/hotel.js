const add = `INSERT INTO hotels (image,name,price,id_city,longitude,latitude,property,description,created_on,updated_on) 
            VALUES (?,?,?,?,?,?,?,?,?,?)`

module.exports = { add }