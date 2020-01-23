const add = `INSERT INTO topup (saldo,id_user,created_on,updated_on) VALUES (?,?,?,?)`

const show = 'SELECT *.topup, *.profile FROM topup INNER JOIN user ON topup.id_user=profile.id_user WHERE id_user = ?'

const edit = 'UPDATE users SET saldo = ?, updated_on=? WHERE id_user = ?'

// const dlt = 'DELETE FROM topup WHERE id_topup = ?'

module.exports = { add,show,edit }