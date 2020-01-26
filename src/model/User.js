const login     =   'SELECT * FROM users WHERE email = ?'

const register  =   'INSERT INTO users (email,password,created_on,updated_on) VALUES (?,?,?,?)'

const edit      =   'UPDATE users SET password = ?, updated_on = ? WHERE id_user=?'

const add       =   'UPDATE profile SET name = ?, birthday = ?, no_hp = ?, email = ?, image = ?, updated_on = ? WHERE id_user = ?'

const show      =   'SELECT * FROM profile WHERE id_user = ?' 

module.exports = { login,register,edit, add, show }