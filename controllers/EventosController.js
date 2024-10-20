import EventosServices from "../services/EventosServices.js";
const addEvento = (req, res) => {
};

const getEventos = async (req, res) => {
    try {
        const body = req.body;
        const data = await EventosServices.buscarEventos(body);
        res.json(data);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

const getEventoById = (req, res) => {

}

const updateEvento = (req, res) => {

}

const deleteEvento = (req, res) => {

}

export default {
    addEvento,
    getEventos,
    getEventoById,
    updateEvento,
    deleteEvento
}