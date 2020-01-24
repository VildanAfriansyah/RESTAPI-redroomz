const add       =   `INSERT INTO topup (saldo,id_user,created_on,updated_on) VALUES (?,?,?,?)`

const history   =   `SELECT profile.name, profile.id_user, topup.id_topup, topup.saldo, topup.created_on FROM profile 
                    INNER JOIN topup ON profile.id_user=topup.id_user 
                    WHERE topup.id_user = ?`

const edit      =   'UPDATE topup SET saldo = ?, updated_on=? WHERE id_topup = ?'

const dlt       =   'DELETE FROM topup WHERE id_topup = ?'

module.exports = { add, history, edit, dlt }