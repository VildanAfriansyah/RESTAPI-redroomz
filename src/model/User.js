const login = 'SELECT * FROM users WHERE username = ?'

const register = 'INSERT INTO users (username,password,created_on,updated_on) VALUES (?,?,?,?)'

const edit = 'UPDATE users SET password = ?, updated_on = ? WHERE id_user=?'

const add = 'UPDATE profile SET name = ?, no_hp = ?, email = ?, image = ?, updated_on = ? WHERE id_user = ?'

module.exports = { login,register,edit,add }