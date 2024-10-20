import db from '../config/DatabaseConfig.js';
import convertFormUtils from "../utils/convertFormUtils.js";
import {promisify} from "util";

const buscarConvidadosByEvento = (idEvento) => {
    return new Promise((resolve, reject) => {
        const query = `SELECT * FROM CONVIDADO WHERE eventoId = ${idEvento}`;
        db.query(query, (err, result) => {
            if (err) {
                reject(err);
            }
            if (result.length > 0) {
                result.map((convidado) => {
                    convidado.confirmado = convertFormUtils.numberToBoolean(convidado.confirmado);
                });
            }
            resolve(result);
        });
    });
}

const updateOrCreateConvidados = (convidados, idEvento) => {
    return new Promise((resolve, reject) => {
        const deleteQuery = `DELETE FROM CONVIDADO WHERE eventoId = ?`;

        db.query(deleteQuery, [idEvento], (err, result) => {
            if (err) {
                return reject(err);
            }

            const queries = convidados.map(c => {
                let query = null;
                let values = null;

                query = `INSERT INTO CONVIDADO (nome, telefone, confirmado, eventoId) VALUES (?, ?, ?, ?)`;
                values = [c.nome, c.telefone, convertFormUtils.booleanToNumber(c.confirmado), idEvento];

                return new Promise((resolveQuery, rejectQuery) => {
                    db.query(query, values, (err, result) => {
                        if (err) {
                            return rejectQuery(err);
                        }
                        resolveQuery(result);
                    });
                });
            });

            Promise.all(queries)
                .then(results => resolve(results))
                .catch(err => reject(err));
        });
    });
};

const deleteConvidadosByEvento = async (idEvento) => {
    try {
        const deleteConvidadosQuery = `DELETE FROM CONVIDADO WHERE eventoId = ?`;
        const queryAsync = promisify(db.query).bind(db);
        await queryAsync(deleteConvidadosQuery, [idEvento]);
        console.log('Convidados deletados com sucesso.');
    } catch (err) {
        console.error('Erro ao deletar convidados:', err);
        throw err;
    }
};



export default {
    buscarConvidadosByEvento,
    updateOrCreateConvidados,
    deleteConvidadosByEvento
}