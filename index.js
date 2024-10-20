import express from 'express';
import cors from 'cors';
import eventosRoutes from "./routes/EventosRoutes.js";

const app = express();

// usar cors
app.use(cors());

// Usar json no corpo da requisição
app.use(express.json());
app.use('/api/eventos', eventosRoutes);

app.listen(5000, () => { console.log('Servidor express rodando') });