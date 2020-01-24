const add = `INSERT INTO rooms (name,price,rate,id_hotel,image,description,created_on,updated_on) 
            VALUES (?,?,?,?,?,?,?,?)`

const show = 'SELECT * FROM rooms'

const edit = 'UPDATE rooms SET name = ?, price = ?, id_hotel = ?, image = ?, description = ?, updated_on=? WHERE id_room = ?'

const dlt = 'DELETE FROM rooms WHERE id_room = ?'

module.exports = { add,show,edit,dlt }