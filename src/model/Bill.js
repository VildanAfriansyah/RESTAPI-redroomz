const add       =   `INSERT INTO bill (id_booking,id_user,total_price,created_on,updated_on) 
                    VALUES (?,?,?,?,?)`

const history   =   `SELECT bill.id_bill, booking.id_booking, profile.id_user, booking.name AS name_booking, booking.checkin, booking.checkout, bill.total_price, hotels.id_hotel, hotels.name AS name_hotel, rooms.id_room, rooms.name, booking.checkin, booking.checkout FROM profile 
                    INNER JOIN booking ON profile.id_user=booking.id_user 
                    INNER JOIN hotels ON booking.id_hotel=hotels.id_hotel
                    INNER JOIN rooms ON booking.id_room=rooms.id_room
                    INNER JOIN bill ON bill.id_booking=booking.id_booking
                    WHERE bill.id_user = ?`

const edit      =   `UPDATE bill SET id_booking = ?, id_user = ?, total_price = ?, updated_on = ? WHERE id_bill = ?`

const dlt       =   'DELETE FROM bill WHERE id_bill = ?'

module.exports = { add, history, edit, dlt }