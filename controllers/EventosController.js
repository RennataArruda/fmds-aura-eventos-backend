import EventosServices from "../services/EventosServices.js";

const addEvento = async (req, res) => {
    try {
        const body = req.body;
        const data = await EventosServices.createEvento(body);
        res.json(data);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
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

const getEventoById = async (req, res) => {
    const id = req.params.id;
    try {
        const data = await EventosServices.getEventoById(id);
        res.json(data);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

const updateEvento = async (req, res) => {
    const id = req.params.id;
    const evento = req.body;
    try {
        const data = await EventosServices.updateEvento(evento, id);
        res.json(evento);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

const deleteEvento = async (req, res) => {
    const id = req.params.id;
    try {
        const data = await EventosServices.deleteEventoCompleto(id);
        res.json(data);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export default {
    addEvento,
    getEventos,
    getEventoById,
    updateEvento,
    deleteEvento
}