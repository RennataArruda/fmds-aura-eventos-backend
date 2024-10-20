import { Router} from "express";
import EventosController from "../controllers/EventosController.js";

const router = Router();

router.post('/', EventosController.addEvento);
router.post('/search', EventosController.getEventos);
router.get('/:id', EventosController.getEventoById);
router.put('/:id', EventosController.updateEvento);
router.delete('/:id', EventosController.deleteEvento);

export default router;