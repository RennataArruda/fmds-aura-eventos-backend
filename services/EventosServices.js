import db from '../config/DatabaseConfig.js';
import convertFormUtils from "../utils/convertFormUtils.js";
import searchPaginationUtils from "../utils/SearchPaginationUtils.js";
import contratanteServices from "./ContratanteServices.js";
import convidadosServices from "./ConvidadosServices.js";
import { promisify } from 'util';


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
                    evento.dataEvento = convertFormUtils.convertData(evento.dataEvento);
                });
                resolve({data: data, total: count[0].total});
            })
        });
    });
}

const getEventoById = async (id) => {
    return new Promise(async (resolve, reject) => {
        const queryEvento = `SELECT * FROM EVENTO WHERE AUTOID = ${id} LIMIT 1`;
        let evento = null;

        db.query(queryEvento, async (err, result) => {
            if (err) {
                reject(err);
            }
            evento = result;
            evento = evento[0];
            if (!evento) {
                reject({message: 'Evento não encontrado'});
            }
            const contratante = await contratanteServices.buscarContratanteByEvento(evento.contratante);

            const convidados = await convidadosServices.buscarConvidadosByEvento(id);
            evento.convidados = convidados;
            evento.contratante = contratante;
            evento.data = convertFormUtils.convertData(evento.data);
            resolve(evento);
        });
    });
}

const createEvento = async (evento) => {
    try {
        const contratanteToCreate = evento.contratante;
        const convidadosToCreate = evento.convidados;

        const contratanteId = await contratanteServices.createContratante(contratanteToCreate);

        const query = `INSERT INTO EVENTO (nome, tipo, data, contratante, horaEvento, qtdConvidados, local, descricao) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;

        const queryAsync = promisify(db.query).bind(db);

        const result = await queryAsync(query, [
            evento.nome,
            evento.tipo,
            evento.data,
            contratanteId,
            evento.horaEvento,
            evento.qtdConvidados,
            evento.local,
            evento.descricao
        ]);

        const eventoId = result.insertId;

        try {
            await convidadosServices.updateOrCreateConvidados(convidadosToCreate, eventoId);
        } catch (err) {
            throw err;
        }

        return evento;
    } catch (err) {
        throw err;
    }
};



const updateEvento = async (evento, id) => {
    try {
        const contratanteToUpdate = evento.contratante;
        const convidadosToUpdate = evento.convidados;
        const eventoToUpdate = { ...evento, contratante: evento.contratante.autoid };

        const query = `UPDATE EVENTO SET  nome = ?,   tipo = ?,  data = ?, contratante = ?,  horaEvento = ?,  qtdConvidados = ?,  local = ?, descricao = ?  WHERE autoid = ?`;

        const queryAsync = promisify(db.query).bind(db);

        await queryAsync(query, [eventoToUpdate.nome, eventoToUpdate.tipo, eventoToUpdate.data, eventoToUpdate.contratante, eventoToUpdate.horaEvento, eventoToUpdate.qtdConvidados, eventoToUpdate.local, eventoToUpdate.descricao, id]);

        try {
            await contratanteServices.updateContratante(contratanteToUpdate);
        } catch (err) {
            throw err;
        }

        try {
            await convidadosServices.updateOrCreateConvidados(convidadosToUpdate, id);
        } catch (err) {
            throw err;
        }
        return eventoToUpdate;
    } catch (err) {
        throw err;
    }
};

const deleteEventoCompleto = async (idEvento) => {
    try {
        console.log(`Deletando evento completo com ID: ${idEvento}`);

        await convidadosServices.deleteConvidadosByEvento(idEvento);

        const contratanteQuery = `SELECT contratante FROM EVENTO WHERE autoid = ?`;
        const queryAsync = promisify(db.query).bind(db);
        const result = await queryAsync(contratanteQuery, [idEvento]);

        if (result.length > 0) {
            const contratanteId = result[0].contratante;

            await deleteEventoById(idEvento);

            await contratanteServices.deleteContratanteById(contratanteId);
        } else {
            console.log('Evento não encontrado.');
        }

        return { message: 'Evento completo deletado com sucesso.' };
    } catch (err) {
        console.error('Erro ao deletar evento completo:', err);
        throw err;
    }
};


const deleteEventoById = async (idEvento) => {
    try {
        const deleteEventoQuery = `DELETE FROM EVENTO WHERE autoid = ?`;
        const queryAsync = promisify(db.query).bind(db);
        await queryAsync(deleteEventoQuery, [idEvento]);
        console.log(`Evento ${idEvento} deletado com sucesso.`);
    } catch (err) {
        console.error('Erro ao deletar evento:', err);
        throw err;
    }
};


export default {
    buscarEventos,
    getEventoById,
    updateEvento,
    createEvento,
    deleteEventoCompleto
}