import express from 'express';
import cors from 'cors';
import eventosRoutes from "./routes/EventosRoutes.js";
import admin from 'firebase-admin';
import serviceAccount
    from './middlewares/avaliacao-iii-fwds-firebase-adminsdk-inwmv-896c2cb51e.json' assert {type: 'json'};
import checkFirebaseToken from './middlewares/checkTokenFirebase.js';
import swaggerJsDoc from 'swagger-jsdoc';
import swaggerUI from 'swagger-ui-express';
import docsSwagger from './swagger/docs.json' assert {type: 'json'};


admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
});


const app = express();

// usar cors
app.use(cors());
app.use(express.json());

const swaggerOptions = {
    swaggerDefinition: docsSwagger,
    apis: ['./routes/EventosRoutes.js']
};

const swaggerDocs = swaggerJsDoc(swaggerOptions);

app.use('/api-docs', swaggerUI.serve, swaggerUI.setup(swaggerDocs));
app.use('/api/eventos', checkFirebaseToken, eventosRoutes);

app.listen(5000, () => { console.log('Servidor express rodando') });