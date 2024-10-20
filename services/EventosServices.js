import db from '../config/DatabaseConfig.js';
import convertData from '../utils/convertData.js';
import searchPaginationUtils from "../utils/SearchPaginationUtils.js";

const buscarEventos = (dataSearch) => {
    return new Promise((resolve, reject) => {
        let query = `SELECT * FROM VW_EVENTO_CONVIDADOS`;
        if (dataSearch.search != null && dataSearch.search != '' && dataSearch.search != undefined) {
            query += ` WHERE nomeEvento LIKE '%${dataSearch.search}%' OR tipoEvento LIKE '%${dataSearch.search}%'`;
        }

        query = searchPaginationUtils.montarCommonPagination(dataSearch, query);

        db.query(query, (err, result) => {
            if (err) {
                reject(err);
            }
            db.query(`SELECT COUNT(*) AS total FROM VW_EVENTO_CONVIDADOS`, (err, count) => {
                if (err) {
                    reject(err);
                }
                const data = result || [];
                data.map((evento) => {
                    evento.dataEvento = convertData(evento.dataEvento);
                });
                resolve({data: data, total: count[0].total});
            })
        });
    });
}

export default {
    buscarEventos
}