import mysql from 'mysql2';
import dotenv from 'dotenv';

// Carregar as variáveis de ambiente do arquivo .env
dotenv.config();

// Criação da conexão com o banco de dados
const db = mysql.createConnection({
    host:  process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
});

// Verificação de conexão
db.connect((err) => {
    if (err) {
        console.log('Erro ao conectar ao banco:', err.message);
        throw err;
    }
    console.log('Conectado ao banco de dados');
});

export default db;
