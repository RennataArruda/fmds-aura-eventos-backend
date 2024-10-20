import db from '../config/DatabaseConfig.js';
import {promisify} from "util";

const buscarContratanteByEvento = (idContratante) => {
    return new Promise((resolve, reject) => {
        const query = `SELECT * FROM CONTRATANTE WHERE autoid = ${idContratante} LIMIT 1`;
        db.query(query, (err, result) => {
            if (err) {
                reject(err);
            }
            resolve(result[0]);
        });
    });
}

const createContratante = async (contratante) => {
    const query = `INSERT INTO CONTRATANTE (nome, email, telefone)  VALUES (?, ?, ?)`;

    const queryAsync = promisify(db.query).bind(db);

    const result = await queryAsync(query, [contratante.nome, contratante.email, contratante.telefone]);

    return result.insertId;
};


const updateContratante = (contratante) => {
    return new Promise((resolve, reject) => {
        const query = `UPDATE CONTRATANTE SET nome = ?, email = ?, telefone = ?   WHERE autoid = ?`;

        const values = [contratante.nome, contratante.email, contratante.telefone, contratante.autoid];

        db.query(query, values, (err, result) => {
            if (err) {
                return reject(err);
            }
            resolve(result);
        });
    });
};

const deleteContratanteById = async (contratanteId) => {
    try {
        const verificarContratanteQuery = `SELECT COUNT(*) as eventosRestantes FROM EVENTO WHERE contratante = ?`;
        const queryAsync = promisify(db.query).bind(db);
        const contratanteCheck = await queryAsync(verificarContratanteQuery, [contratanteId]);

        if (contratanteCheck[0].eventosRestantes === 0) {
            const deleteContratanteQuery = `DELETE FROM CONTRATANTE WHERE autoid = ?`;
            await queryAsync(deleteContratanteQuery, [contratanteId]);
            console.log(`Contratante ${contratanteId} deletado com sucesso.`);
        } else {
            console.log(`Contratante ${contratanteId} ainda associado a outros eventos, não deletado.`);
        }
    } catch (err) {
        console.error('Erro ao deletar contratante:', err);
        throw err;
    }
};



export default {
    buscarContratanteByEvento,
    updateContratante,
    createContratante,
    deleteContratanteById
}