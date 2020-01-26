const add       =   `INSERT INTO booking (id_hotel,checkin,checkout,email,name,total,room,no_hp,id_user,created_on,updated_on) 
                    VALUES (?,?,?,?,?,?,?,?,?,?,?)`

const history   =   `SELECT booking.id_booking, city.city, booking.room, booking.total, profile.id_user, booking.name AS name_booking, hotels.id_hotel, hotels.name AS name_hotel, hotels.price, booking.checkin, booking.checkout FROM profile 
                    INNER JOIN booking ON profile.id_user=booking.id_user 
                    INNER JOIN hotels ON booking.id_hotel=hotels.id_hotel
                    INNER JOIN city ON city.id_city=hotels.id_city
                    WHERE booking.id_user = ?`

const edit      =   `UPDATE booking SET id_hotel = ?, checkin = ?, checkout = ?, email = ?, name = ?,
                    no_hp = ?, updated_on = ? WHERE id_booking = ?`

const dlt       =   'DELETE FROM booking WHERE id_booking = ?'

module.exports = { add, history, edit, dlt }