const add = `INSERT INTO hotels (name,rate,image,id_city,longitude,latitude,id_fasility,description,created_on,updated_on) 
            VALUES (?,?,?,?,?,?,?,?,?,?)`

const show = 'SELECT * FROM hotels'

const edit = 'UPDATE hotels SET name = ?, image = ?, id_city = ?, longitude = ?, latitude = ?, id_fasility = ?, description = ?, updated_on=? WHERE id_hotel = ?'

const dlt = 'DELETE FROM hotels WHERE id_hotel = ?'

module.exports = { add,show,edit,dlt }