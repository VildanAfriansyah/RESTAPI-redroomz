const add = `INSERT INTO hotels (name,rate,image,id_city,longitude,latitude,description,created_on,updated_on) 
            VALUES (?,?,?,?,?,?,?,?,?)`

const show = 'SELECT hotels.*, city.city FROM hotels INNER JOIN city ON hotels.id_city=city.id_city ORDER BY name ASC'

const edit = 'UPDATE hotels SET name = ?, image = ?, id_city = ?, longitude = ?, latitude = ?, description = ?, updated_on=? WHERE id_hotel = ?'

const dlt = 'DELETE FROM hotels WHERE id_hotel = ?'

module.exports = { add,show,edit,dlt }