const search    =   `SELECT hotels.id_hotel, hotels.image, hotels.name, hotels.rate, hotels.id_fasility, city.city 
                    FROM hotels INNER JOIN city ON hotels.id_city=city.id_city 
                    WHERE name LIKE ? AND city LIKE ?`


module.exports = { search }